//
//  CustomCollectionViewCell.swift
//  NasaExample
//
//  Created by Mac on 20.08.2021.
//

import UIKit
import Kingfisher

final class CustomCollectionViewCell: UICollectionViewCell {
  @IBOutlet weak var imageView: UIImageView!
  
  func configure(image: String) {
    let imageURL = URL(string: image)
    
    imageView.kf.setImage(with: imageURL)
  }
}
