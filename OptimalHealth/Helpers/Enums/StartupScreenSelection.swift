//
//  StartupScreenSelection.swift
//  Optimal Health
//
//  Created by Daniel Pressner on 16.11.22.
//

import Foundation

enum StartUpScreenSelection: String {
  case today = "Today", lastViewed = "Last Viewed Date"
  
  var label: String {
    switch self {
    case .today:
      return "Today"
    case .lastViewed:
      return "Last Viewed Date"
    }
  }
  
}
