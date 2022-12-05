//
//  DailyLogExtensions.swift
//  Optimal Health
//
//  Created by Daniel Pressner on 12.11.22.
//

import Foundation
import CoreData

extension DailyLog {
  
  static func dailyLogFetchRequest(for date: Date) -> NSFetchRequest<DailyLog> {
    let request = DailyLog.fetchRequest()
   
    return request
  }
  
  static func existingLogsFetchRequest(for month: DateComponents) -> NSFetchRequest<DailyLog> {
    let request = DailyLog.fetchRequest()
    request.predicate = NSPredicate(format: "date.month==%@ && date.year==%@", month.month!, month.year!)
    return request
  }
  
  var nutrientsArray: [NutrientEntry] {
    guard let nutrients = nutrientEntries, let array = nutrients.array as? [NutrientEntry] else { return [] }
    return array
  }
}
