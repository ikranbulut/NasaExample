//
//  Enums.swift
//  NasaExample
//
//  Created by Mac on 20.08.2021.
//

import Foundation

enum FullName: String, Codable {
  case chemistryAndCameraComplex = "Chemistry and Camera Complex"
  case frontHazardAvoidanceCamera = "Front Hazard Avoidance Camera"
  case mastCamera = "Mast Camera"
  case navigationCamera = "Navigation Camera"
  case rearHazardAvoidanceCamera = "Rear Hazard Avoidance Camera"
  case panoramicCamerea = "Panoramic Camera"
}

enum CameraName: String, Codable {
  case chemcam = "CHEMCAM"
  case fhaz = "FHAZ"
  case mast = "MAST"
  case mahli = "MAHLI"
  case mardi = "MARDI"
  case navcam = "NAVCAM"
  case rhaz = "RHAZ"
  case pancam = "PANCAM"
  case minites = "MINITES"
}

enum RoverName: String, Codable {
  case curiosity = "Curiosity"
  case opportunity = "Opportunity"
  case spirit = "Spirit"
}

enum CollectionViewCellIdentifier {
  static let photo = "Photo"
}

enum StoryboardName {
  static let main = "Main"
  static let popOverMenu = "PopOverMenu"
}
