//
//  Constants.swift
//  Optimal Health
//
//  Created by Daniel Pressner on 10.11.22.
//

import Foundation
import SwiftUI

enum Constants {
  enum Images {
    public static let chevronLeft = Image(systemName: "chevron.left")
    public static let chevronRight = Image(systemName: "chevron.right")
  }
  enum CoreDataInfo {
    public static let dailyLogModelName = "DailyLogModel"
    public static let coreDataFatalError = "Error loading data"
  }
  enum Nutrient: String, CustomStringConvertible {
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
}
