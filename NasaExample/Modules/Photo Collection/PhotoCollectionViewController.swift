//
//  PhotoCollectionViewController.swift
//  NasaExample
//
//  Created by Mac on 22.08.2021.
//

import UIKit
import CHTCollectionViewWaterfallLayout

final class PhotoCollectionViewController: UIViewController {
  @IBOutlet weak var collectionView: UICollectionView!
  @IBOutlet weak var cameraFilterButton: UIBarButtonItem!
  @IBOutlet weak var detailView: PhotoDetailView!
  @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
  
  let viewModel = PhotoCollectionViewModel()
 
  override func viewDidLoad() {
    super.viewDidLoad()
   
    setup()
    reloadData()
  }
  
  private func setup() {
    self.navigationController?.navigationBar.isTranslucent = true
    self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
    self.navigationController?.navigationBar.shadowImage = UIImage()
  }
  
  func reloadData() {
    DispatchQueue.main.async { [weak self] in
      guard let self = self else { return }

      self.viewModel.getImages(type: self.viewModel.roverSourceType) { [weak self] _ in
        guard let self = self else { return }
        
        self.collectionView.reloadData()
        self.setupCollectionViewLayout()
      }
    }
  }
  
 private func loadMoreData() {
    if !self.viewModel.isLoading {
      self.viewModel.isLoading = true
      DispatchQueue.global().async { [ weak self] in
        guard let self = self else { return }
  
        self.viewModel.pageNumber = self.viewModel.pageNumber + 1
        
        self.viewModel.getImages(type: self.viewModel.roverSourceType) { [weak self] _ in
          guard let self = self else { return }
          
          self.collectionView.reloadInputViews()
          self.setupCollectionViewLayout()
          self.viewModel.isLoading = false
        }
      }
    }
  }
  
  private func setupCollectionViewLayout() {
    let layout = CHTCollectionViewWaterfallLayout()
    
    layout.minimumColumnSpacing = CGFloat(Constants.minSpacing)
    layout.minimumInteritemSpacing = CGFloat(Constants.minSpacing)
    
    self.collectionView.collectionViewLayout = layout
  }
  
  private func configurePhotoDetailView(_ isDetailViewHidden: Bool, _ isCollectionViewHidden: Bool, _ isCameraFilterButtonEnabled: Bool, _ cameraFilterButtonImage: UIImage? = nil, _ cameraFilterButtonTitle: String? = nil) {
    detailView.isHidden = isDetailViewHidden
    collectionView.isHidden = isCollectionViewHidden
    cameraFilterButton.isEnabled = isCameraFilterButtonEnabled
    cameraFilterButton.image = cameraFilterButtonImage
    cameraFilterButton.title = cameraFilterButtonTitle ?? ""
  }
  
  @IBAction func cameraFilterButtonTapped(_ sender: UIBarButtonItem) {
    let popOverstoryboard = UIStoryboard(name: StoryboardName.popOverMenu, bundle: Bundle.main)

    if let popOverViewController = popOverstoryboard.instantiateViewController(withIdentifier: "PopOverMenu") as? PopOverMenuViewController {
      popOverViewController.viewModel.cameras = viewModel.cameras
      
      popOverViewController.modalPresentationStyle = .popover
      popOverViewController.preferredContentSize =  CGSize(width: 100, height: viewModel.cameras.count * 50)
      
      let popOver = popOverViewController.popoverPresentationController
      popOver?.delegate = popOverViewController
      popOver?.barButtonItem = sender

      present(popOverViewController, animated: true, completion: nil)
    }
  }
}

extension PhotoCollectionViewController: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return viewModel.getPhotosCount()
  }
  
  func numberOfSections(in collectionView: UICollectionView) -> Int {
    return 1
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCellIdentifier.photo, for: indexPath) as! CustomCollectionViewCell
    let row = indexPath.row
    
    cell.configure(image: viewModel.getPhotoSource(at: row))
    
    return cell
  }
}

//MARK: Collection View Delegate
extension PhotoCollectionViewController: UICollectionViewDelegate {
  func scrollViewDidScroll(_ scrollView: UIScrollView) {
    let offsetY = scrollView.contentOffset.y
    let contentHeight = scrollView.contentSize.height + CGFloat(viewModel.photos.count)
    
    if (offsetY > contentHeight - scrollView.frame.height * CGFloat(viewModel.photos.count)) && !viewModel.isLoading {
      loadMoreData()
    }
  }
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    let row = indexPath.row
  
    configurePhotoDetailView(false, true, false, .none, "")
    
    let selectedphoto = viewModel.getSelectedPhoto(at: row)
    
    detailView.configureDetailView(selectedphoto.camera.name.rawValue, selectedphoto.rover.name, selectedphoto.earthDate, selectedphoto.rover.landingDate, selectedphoto.rover.launchDate, selectedphoto.rover.status, selectedphoto.imgSrc)
    
    detailView.close = { [weak self] in
      guard let self = self else { return }
      
      self.configurePhotoDetailView(true, false, true, UIImage(systemName: "camera.filters"))
    }
  }
}

//MARK: Waterfall Collection View Layout
extension PhotoCollectionViewController: CHTCollectionViewDelegateWaterfallLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let cellWidth = 500 + Int.random(in: 0...800)
    let cellHeight = 550 + Int.random(in: 0...800)

    return CGSize(width: cellWidth, height: cellHeight)
  }

  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, columnCountFor section: Int) -> Int {
    return Constants.columnCount
  }
}
