//
//  StringExtensions.swift
//  NasaExample
//
//  Created by Mac on 25.08.2021.
//

import Foundation

extension String {
  func localized() -> String {
    return NSLocalizedString(self, comment: "")
  }
}
