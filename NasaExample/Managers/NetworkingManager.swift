//
//  NetworkManager.swift
//  NasaExample
//
//  Created by Mac on 20.08.2021.
//

import Foundation
import Alamofire

final class NetworkingManager {
  func getPhotoColletion(pageNumber: Int, type: RoverName, cameraType: CameraName? = nil, completionHandler: @escaping ([Category]) -> ()) {
    var url = ""
    switch type {
    case .curiosity:
      if let type = cameraType {
        url = Constants.baseUrl + RoverName.curiosity.rawValue + Constants.urlPath + "camera" + type.rawValue + Constants.queryParam
      } else {
        url = Constants.baseUrl + RoverName.curiosity.rawValue + Constants.urlPath + "page=" + pageNumber.description + Constants.queryParam
      }
    case .opportunity:
      if let type = cameraType {
        url = Constants.baseUrl + RoverName.opportunity.rawValue + Constants.urlPath + "camera" + type.rawValue + Constants.queryParam
      } else {
        url = Constants.baseUrl + RoverName.opportunity.rawValue + Constants.urlPath + "page=" + pageNumber.description + Constants.queryParam
      }
    case .spirit:
      if let type = cameraType {
        url = Constants.baseUrl + RoverName.spirit.rawValue + Constants.urlPath + "camera" + type.rawValue + Constants.queryParam
      } else {
        url = Constants.baseUrl + RoverName.spirit.rawValue + Constants.urlPath + "page=" + pageNumber.description + Constants.queryParam
      }
    }

    let request =  AF.request(url, method: .get)
    request.responseDecodable (of: Category.self) { response in
      guard let photos = response.value else {
        print(response.error.debugDescription)
        return
      }
      
      completionHandler([photos])
    }
  }
}
