//
//  CategoryOneViewController.swift
//  NasaExample
//
//  Created by Mac on 20.08.2021.
//

import UIKit

class CategoryViewController: UIViewController {
  var viewModel = CategoryViewModel()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    switch viewModel.categorySourceType {
    case .curiosity:
      view.backgroundColor = .red
    case .opportunity:
      view.backgroundColor = .yellow
    case .spirit:
      view.backgroundColor = .green
    }
    // Do any additional setup after loading the view.
  }
}
