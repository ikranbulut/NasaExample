//
//  PhotoDetailCellView.swift
//  NasaExample
//
//  Created by Mac on 24.08.2021.
//

import UIKit
import SnapKit

final class PhotoDetailCellView: UITableViewCell{
  @IBOutlet var view: UIView!
  @IBOutlet weak var label: UILabel!
  
  private init(frame: CGRect) {
    super.init(style: .default, reuseIdentifier: "PhotoDetail")
    
    loadNib()
  }
  
  internal required init?(coder: NSCoder) {
    super.init(coder: coder)
    
    loadNib()
  }
  
  private func loadNib() {
    Bundle.main.loadNibNamed("PhotoDetailCellView", owner: self, options: nil)
    
    addSubview(contentView)
    
    contentView.frame = self.bounds
    contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    contentView.layer.masksToBounds = true
  }
  
  func configure(with detail: String) {
    label.text = detail
  }
  
  func PhotoDetailCellViewConstraint() {
    snp.makeConstraints { make in
      make.top.equalToSuperview()
      make.right.equalToSuperview()
      make.left.equalToSuperview()
      make.bottom.equalToSuperview()
    }
  }
}
