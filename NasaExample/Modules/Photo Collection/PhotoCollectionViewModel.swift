//
//  PhotoCollectionViewModel.swift
//  NasaExample
//
//  Created by Mac on 22.08.2021.
//

import Foundation

final class PhotoCollectionViewModel {
  private let networkingManager = NetworkingManager()
  
  var roverSourceType: RoverName = .curiosity
  var cameraType: CameraName?
  var pageNumber = 1

  var photos: [Photo] = []
  var cameras: [CameraName] = []
  var photosByCameras: [Photo] = []
  
  var isLoading = false
  var isPhotoTapped = false
  
  func getImages(type: RoverName, cameraType: CameraName? = nil, completionHandler: @escaping (Bool) -> ()) {
      return networkingManager.getPhotoColletion(pageNumber: pageNumber, type: roverSourceType, cameraType: cameraType, completionHandler: { [weak self] categories in
        guard let self = self else { return }
        
        for category in categories {
          let photos = category.photos
          
          for photo in photos {
            self.photos.append(photo)
            
            let cameraType = photo.camera.name
            
            if !self.cameras.contains(cameraType) {
              self.cameras.append(cameraType)
            }
          }
        }
        
        completionHandler(true)
      })
  }
  
  func getPhotoSource(at index: Int) -> String {
    return photos[index].imgSrc
  }
  
  func getPhotosCount() -> Int {
    if !photos.isEmpty {
      return photos.count
    }
    
    return 0
  }
  
  func getSelectedPhoto(at index: Int) -> Photo {
    return photos[index]
  }
}
