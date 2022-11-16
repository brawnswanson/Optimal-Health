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
  }
  enum CoreDataInfo {
    public static let dailyLogModelName = "DailyLogModel"
    public static let coreDataFatalError = "Error loading data"
  }
  enum UserDefaultKeys {
    public static let lastViewLogDate = "lastViewedLogDate"
    public static let numberOfTappableProteins = "tappableProteins"
    public static let numberOfTappableFats = "tappableFats"
    public static let numberOfTappableCarbs = "tappableCarbs"
    public static let numberOfTappableVegs = "tappableVegs"
  }
  enum BinaryConstants {
    public static let maxTappable = 0b11111111111111111111
  }
  enum InitialDefaults {
    public static let visiblePortions = 20
  }
}
