//
//  NutrientEntryExtensions.swift
//  Optimal Health
//
//  Created by Daniel Pressner on 14.11.22.
//

import Foundation

extension NutrientEntry {
  var name: String {
    nameData ?? Nutrient.allCases.first!.rawValue
  }
}
