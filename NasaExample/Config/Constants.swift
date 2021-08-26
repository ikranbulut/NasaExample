//
//  Constants.swift
//  NasaExample
//
//  Created by Mac on 21.08.2021.
//

import UIKit

struct Constants {
  static let columnCount = 2
  static let minSpacing = 0
  
  static var baseUrl: String {
    get {
      guard let filePath = Bundle.main.path(forResource: "NasaAPI", ofType: "plist") else {
        fatalError("Couldn't find file 'NasaAPI.plist'.")
      }
      
      let plist = NSDictionary(contentsOfFile: filePath)
      
      guard let value = plist?.object(forKey: "baseUrl") as? String else {
        fatalError("Couldn't find key 'Base URL' in 'NasaAPI.plist'.")
      }
      
      return value
    }
  }
  
 static var urlPath: String {
    get {
      guard let filePath = Bundle.main.path(forResource: "NasaAPI", ofType: "plist") else {
        fatalError("Couldn't find file 'NasaAPI.plist'.")
      }
      
      let plist = NSDictionary(contentsOfFile: filePath)
      
      guard let value = plist?.object(forKey: "urlPath") as? String else {
        fatalError("Couldn't find key 'Url Path' in 'NasaAPI.plist'.")
      }
      
      return value
    }
  }
  
  static var queryParam: String {
     get {
       guard let filePath = Bundle.main.path(forResource: "NasaAPI", ofType: "plist") else {
         fatalError("Couldn't find file 'NasaAPI.plist'.")
       }
      
       let plist = NSDictionary(contentsOfFile: filePath)
      
       guard let value = plist?.object(forKey: "queryParam") as? String else {
         fatalError("Couldn't find key 'Query Param' in 'NasaAPI.plist'.")
       }
      
       return value
     }
   }
}
