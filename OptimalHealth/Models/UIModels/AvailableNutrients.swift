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
      return Constants.UserDefaultKeys.numberOfTappableProteins
    case .fats:
      return Constants.UserDefaultKeys.numberOfTappableFats
    case .carbs:
      return Constants.UserDefaultKeys.numberOfTappableCarbs
    case .vegetables:
      return Constants.UserDefaultKeys.numberOfTappableVegs
    }
  }
  
  var numberOfVisiblePortions: Int {
    return UserDefaults.standard.value(forKey: userDefaultKey) as? Int ?? 20
  }
  
}
