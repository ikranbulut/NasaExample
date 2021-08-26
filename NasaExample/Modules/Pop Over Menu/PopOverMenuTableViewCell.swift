//
//  PopOverCustomTableViewCell.swift
//  NasaExample
//
//  Created by Mac on 23.08.2021.
//

import UIKit

final class PopOverMenuTableViewCell: UITableViewCell {
  @IBOutlet weak var label: UILabel!
  
  func configure(with cameraType: String) {
    label.text = cameraType
  }
}
