//
//  DailyLogExtensions.swift
//  Optimal Health
//
//  Created by Daniel Pressner on 12.11.22.
//

import Foundation
import CoreData

extension DailyLog {
  
  static func dailyLogFetchRequest(for date: DateComponents) -> NSFetchRequest<DailyLog> {
    let request = DailyLog.fetchRequest()
    request.predicate = NSPredicate(format: "date==%@", date as CVarArg)
    return request
  }
  
  var nutrientsArray: [NutrientEntry] {
    guard let nutrients = nutrientEntries, let array = nutrients.array as? [NutrientEntry] else { return [] }
    return array
  }
}