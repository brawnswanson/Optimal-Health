//
//  DailyPortionLogViewModel.swift
//  Optimal Health
//
//  Created by Daniel Pressner on 10.11.22.
//

import Foundation

class DailyPortionLogViewModel: ObservableObject {
  
  @Published var currentLog: DailyLog?
  @Published var dailyLogs: [DailyLog] = []
  @Published var currentLogDate: DateComponents
  
  private let calendar = Calendar.current
  
  init() {
    
    currentLogDate = calendar.dateComponents([.day, .month, .year], from: Date())

  }
}

//MARK: - CoreData Interactions
extension DailyPortionLogViewModel {
  func createNewLog() {
    let newLog = DailyLog(context: CoreDataController.shared.context)
    newLog.date = Date()
    newLog.id = UUID()
    dailyLogs = fetchLogs()
  }
  
  func fetchLogs() -> [DailyLog] {
    let fetchRequest = DailyLog.fetchRequest()
    fetchRequest.sortDescriptors = [NSSortDescriptor(key: "date", ascending: true)]
    guard let results = try? CoreDataController.shared.context.fetch(fetchRequest) else { return [] }
    return results
  }
}
