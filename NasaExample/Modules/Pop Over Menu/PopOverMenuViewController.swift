//
//  PopOverViewController.swift
//  NasaExample
//
//  Created by Mac on 22.08.2021.
//

import UIKit

final class PopOverMenuViewController: UIViewController {
  @IBOutlet weak var tableView: UITableView!
  
  var viewModel = PopOverMenuViewModel()

  override func viewDidLoad() {
    super.viewDidLoad()
  }
}

extension PopOverMenuViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return viewModel.getNumberOfRow()
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let row = indexPath.row
    
    let cell = tableView.dequeueReusableCell(withIdentifier: "Camera") as! PopOverMenuTableViewCell
    
    cell.configure(with: viewModel.getCameraType(at:row).rawValue)
    
    return cell
  }
}

extension PopOverMenuViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let row = indexPath.row
    
    let cameraType = viewModel.getCameraType(at: row)
    
    let mainStoryboard = UIStoryboard(name: StoryboardName.main, bundle:nil)
    let photoCollectionViewController = mainStoryboard.instantiateViewController(withIdentifier: "PhotoCollection") as! PhotoCollectionViewController
    
    photoCollectionViewController.viewModel.roverSourceType = viewModel.roverName
    photoCollectionViewController.viewModel.cameraType = cameraType
    photoCollectionViewController.reloadData()
    
    dismiss(animated: true, completion: nil)
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return CGFloat(35)
  }
}

extension PopOverMenuViewController: UIPopoverPresentationControllerDelegate {
  func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
    return .none
  }
}
