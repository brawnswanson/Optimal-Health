//
//  DailyPortionLogViewModel.swift
//  Optimal Health
//
//  Created by Daniel Pressner on 10.11.22.
//

import Foundation
import Combine

class DailyPortionLogViewModel: ObservableObject {
  
  @Published var currentLog: DailyLog?
  @Published var dailyLogs: [DailyLog] = []
  @Published var currentLogDate: DateComponents
  
  private let contextChangePublisher = NotificationCenter.default.publisher(for: Notification.Name.NSManagedObjectContextObjectsDidChange)
  
  private let calendar = Calendar.current
  private let decoder = JSONDecoder()
  private let encoder = JSONEncoder()
  
  private var subscriptions = Set<AnyCancellable>()
  
  init() {
    
    if let lastViewedDateInUserDefaults = UserDefaults.standard.value(forKey: "currentViewDate") as? Data, let lastViewedDateComponents = try? decoder.decode(DateComponents.self, from: lastViewedDateInUserDefaults) {
      currentLogDate = lastViewedDateComponents
    } else {
      currentLogDate = calendar.dateComponents([.year, .month, .day], from: Date())
    }
    
    //Subscribe to publishers
    updateCurrentViewDateInUserDefaults()
    fetchCurrentLogSubscription()
  }
}

//MARK: - Combine subscribe functions
extension DailyPortionLogViewModel {
  func updateCurrentViewDateInUserDefaults() {
    $currentLogDate
      .map { try? self.fetchLog(for: $0) }
      .assign(to: &$currentLog)
  }
  
  func fetchCurrentLogSubscription() {
    contextChangePublisher
      .map { _ in self.currentLogDate }
      .map { try? self.fetchLog(for: $0) }
      .assign(to: &$currentLog)
  }
}

//MARK: - CoreData Interactions
extension DailyPortionLogViewModel {
  func createNewLog() {
    let newLog = DailyLog(context: CoreDataController.shared.context)
    newLog.date = currentLogDate
    newLog.id = UUID()
  }
  
  func fetchLog(for date: DateComponents) throws -> DailyLog? {
    let fetchRequest = DailyLog.dailyLogFetchRequest(for: date)
    let results = try CoreDataController.shared.context.fetch(fetchRequest)
    return results.first
  }
  
  func findNextLog() {
    
  }
}
