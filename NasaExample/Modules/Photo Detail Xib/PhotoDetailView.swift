//
//  PhotoDetailView.swift
//  NasaExample
//
//  Created by Mac on 23.08.2021.
//

import UIKit
import SnapKit
import Kingfisher

final class PhotoDetailView: UIView {
  @IBOutlet var contentView: UIView!
  @IBOutlet weak var backgroundView: UIView!
  @IBOutlet weak var detailTableView: UITableView!
  
  @IBOutlet weak var imageView: UIImageView!
  @IBOutlet weak var cameraNameLabel: UILabel!
  @IBOutlet weak var roverNameLabel: UILabel!
  @IBOutlet weak var earthDateLabel: UILabel!
  @IBOutlet weak var landingDateLabel: UILabel!
  @IBOutlet weak var launchDateLabel: UILabel!
  @IBOutlet weak var roverStatusLabel: UILabel!
  
  var close: (() -> Void)?
  
  var photo: Photo?
  var photoDetail: [String] = []
  
  private override init(frame: CGRect) {
    super.init(frame: frame)
    
    loadNib()
  }
  
  internal required init?(coder: NSCoder) {
    super.init(coder: coder)
    
    loadNib()
  }
  
  private func loadNib() {
    Bundle.main.loadNibNamed("PhotoDetailView", owner: self, options: nil)
    
    addSubview(contentView)
    
    contentView.frame = self.bounds
    contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    contentView.layer.masksToBounds = true
  }
  
  func PhotoDetailViewConstraint() {
    snp.makeConstraints { make in
      make.width.equalToSuperview()
      make.height.equalToSuperview()
      make.centerX.equalToSuperview()
      make.centerY.equalToSuperview()
    }
  }
  
  func configureDetailView(_ cameraName: String, _ roverName: String, _ earthDate: String, _ landingDate: String, _ launchDate: String, _ roverStatus: String, _ imageSource: String) {
    imageView.kf.setImage(with: URL(string: imageSource))
    
    cameraNameLabel.text = Localization.PhotoDetail.cameraName + cameraName
    roverNameLabel.text = Localization.PhotoDetail.roverName + roverName
    roverStatusLabel.text = Localization.PhotoDetail.roverStatus + roverStatus
    landingDateLabel.text = Localization.PhotoDetail.landingDate + landingDate
    launchDateLabel.text = Localization.PhotoDetail.launchDate + launchDate
    earthDateLabel.text = Localization.PhotoDetail.earthDate + earthDate
  }
 
  @IBAction func closeButtonTapped(_ sender: UIButton) {
    close?()
  }
}
