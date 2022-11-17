//
//  UserDefaultsController.swift
//  Optimal Health
//
//  Created by Daniel Pressner on 16.11.22.
//

import Foundation

class UserDefaultsController {
  
  private static let defaults = UserDefaults.standard
  
  static func getValue<T>(for key: String, ofType type: T.Type) -> T? {
    guard let defaultValue = defaults.value(forKey: key) as? T else { return nil }
    return defaultValue
  }
  
  static func setDefault(value: Any, for key: String) {
    defaults.set(value, forKey: key)
  }
}
