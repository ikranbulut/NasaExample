//
//  ViewController.swift
//  NasaExample
//
//  Created by Mac on 20.08.2021.
//

import UIKit

enum Type: Int {
  case curiosity
  case opportunity
  case spirit
}

final class MainViewController: UITabBarController {
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let curiosityViewController = setUpViewController(.curiosity, Styles.Images.curiosity)
    let opportunityViewController = setUpViewController(.opportunity, Styles.Images.opportunity)
    let spiritViewController = setUpViewController(.spirit, Styles.Images.spirit)
    
    let controllers = [curiosityViewController, opportunityViewController, spiritViewController]
    
    self.viewControllers = controllers.map ({ UINavigationController(rootViewController: $0) })
  }
  
  func setUpViewController(_ type: RoverName, _ image: UIImage? = nil, cameraType: CameraName? = nil) -> UIViewController {
    let mainStoryboard = UIStoryboard(name: StoryboardName.main, bundle:nil)
    let photoCollectionViewController = mainStoryboard.instantiateViewController(withIdentifier: "PhotoCollection") as! PhotoCollectionViewController
    
    photoCollectionViewController.viewModel.roverSourceType = type
    photoCollectionViewController.tabBarItem.title = type.rawValue
    photoCollectionViewController.tabBarItem.image = image
    
    if let cameraType = cameraType {
      photoCollectionViewController.viewModel.cameraType = cameraType
    }

    return photoCollectionViewController
  }
}
