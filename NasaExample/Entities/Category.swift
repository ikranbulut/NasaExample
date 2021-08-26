//
//  RoverCategory.swift
//  NasaExample
//
//  Created by Mac on 20.08.2021.
//

import Foundation
// MARK: - Category
final class Category: Codable {
  let photos: [Photo]
}

// MARK: - Photo
final class Photo: Codable {
  let id: Int
  let sol: Int
  let camera: Camera
  let imgSrc: String
  let earthDate: String
  let rover: Rover

  enum CodingKeys: String, CodingKey {
    case id, sol
    case camera
    case imgSrc = "img_src"
    case earthDate = "earth_date"
    case rover
  }
}

// MARK: - Camera
final class Camera: Codable {
  let id: Int
  let name: CameraName
  let roverID: Int
  let fullName: FullName
  
  enum CodingKeys: String, CodingKey {
    case id
    case name
    case roverID = "rover_id"
    case fullName = "full_name"
  }
}

// MARK: - Rover
final class Rover: Codable {
  let id: Int
  let name: RoverName.RawValue
  let landingDate, launchDate: String
  let status: String
  
  enum CodingKeys: String, CodingKey {
    case id, name
    case landingDate = "landing_date"
    case launchDate = "launch_date"
    case status
  }
}
