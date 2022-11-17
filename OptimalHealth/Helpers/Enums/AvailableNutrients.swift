//
//  AvailableNutrients.swift
//  Optimal Health
//
//  Created by Daniel Pressner on 10.11.22.
//

import Foundation
import SwiftUI

enum Nutrient: String, CustomStringConvertible, CaseIterable {
  case proteins, fats, carbs, vegetables
  var description: String {
    self.rawValue.uppercased()
  }
  
  var color: Color {
    switch self {
    case .proteins:
      return .cyan
    case .fats:
      return .yellow
    case .carbs:
      return .orange
    case .vegetables:
      return .green
    }
  }
  
  var userDefaultKey: String {
    switch self {
    case .proteins:
      return Constants.UserDefaultKeys.recommendedProteins
    case .fats:
      return Constants.UserDefaultKeys.recommendedFats
    case .carbs:
      return Constants.UserDefaultKeys.recommendedCarbs
    case .vegetables:
      return Constants.UserDefaultKeys.recommendedVeg
    }
  }
  
  var recommendedPortions: Double {
    UserDefaults.standard.value(forKey: self.userDefaultKey) as? Double ?? 8.0
  }
  
  var numberOfVisiblePortions: Int {
    return Int(Constants.InitialDefaults.visiblePortions)
  }
  
}
