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
    public static let doubleChevronLeft = Image(systemName: "chevron.left.2")
    public static let doubleChevronright = Image(systemName: "chevron.right.2")
    public static let plus = Image(systemName: "plus")
  }
  enum CoreDataInfo {
    public static let dailyLogModelName = "DailyLogModel"
    public static let coreDataFatalError = "Error loading data"
  }
  enum UserDefaultKeys {
    public static let lastViewedDate = "lastViewedDate"
    public static let recommendedPortions = "recommendedPortions"
    public static let lastViewLogDate = "lastViewedLogDate"
    public static let recommendedProteins = "recommendeProteins"
    public static let recommendedCarbs = "recommendedCarbs"
    public static let recommendedVeg = "recommendedVeg"
    public static let recommendedFats = "recommendedFats"
    public static let defaultStartUp = "defaultStartUp"
  }
  enum BinaryConstants {
    public static let maxTappable = 0b11111111111111111111
  }
  enum InitialDefaults {
    public static let visiblePortions = 12.0
  }
  enum Text {
    public static let createLogButtonDescription = "Add new log"
    public static let recommendedPortionsSettingLabel = "Recommended Portions"
    public static let defaultDateSettingLabel = "On Startup view"
  }
  enum Dimensions {
    public static let createLogButtonMaxWidth = 75.0
  }
}
