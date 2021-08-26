//
//  PopOverViewModel.swift
//  NasaExample
//
//  Created by Mac on 22.08.2021.
//

import Foundation

final class PopOverMenuViewModel {
  var cameras: [CameraName] = []
  var roverName: RoverName = .curiosity

  func getCameraType(at index: Int) -> CameraName {
    return cameras[index]
  }
  
  func getNumberOfRow() -> Int {
    return cameras.count
  }
}
