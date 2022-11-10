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
}