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
  @Published var currentLogDateComponents: DateComponents
  
  private let contextChangePublisher = NotificationCenter.default.publisher(for: Notification.Name.NSManagedObjectContextObjectsDidChange)
  
  private let calendar = Calendar.current
  private let decoder = JSONDecoder()
  private let encoder = JSONEncoder()
  
  private var subscriptions = Set<AnyCancellable>()
  
  init() {
    
    if let lastViewedDateInUserDefaults = UserDefaults.standard.value(forKey: Constants.UserDefaultKeys.lastViewLogDate) as? Data, let lastViewedDateComponents = try? decoder.decode(DateComponents.self, from: lastViewedDateInUserDefaults) {
      currentLogDateComponents = lastViewedDateComponents
    } else {
      currentLogDateComponents = calendar.dateComponents([.year, .month, .day], from: Date())
    }
    
    //Subscribe to publishers
    didUpdateCurrentViewDate()
    contextDidChangeRefreshLog()
  }
}

//MARK: - Combine subscribe functions
extension DailyPortionLogViewModel {
  func didUpdateCurrentViewDate() {
    $currentLogDateComponents
      .map {
        self.updateLastViewedDate(with: $0)
        return $0
      }
      .map { try? self.fetchLog(for: $0) }
      .assign(to: &$currentLog)
  }
  
  func contextDidChangeRefreshLog() {
    contextChangePublisher
      .map { _ in self.currentLogDateComponents }
      .map { try? self.fetchLog(for: $0) }
      .assign(to: &$currentLog)
  }
}

//MARK: - CoreData Interactions
extension DailyPortionLogViewModel {
  func createNewLog() {
    let newLog = DailyLog(context: CoreDataController.shared.context)
    newLog.date = currentLogDateComponents
    newLog.id = UUID()
    try? CoreDataController.shared.context.save()
  }
  
  func fetchLog(for date: DateComponents) throws -> DailyLog? {
    let fetchRequest = DailyLog.dailyLogFetchRequest(for: date)
    let results = try CoreDataController.shared.context.fetch(fetchRequest)
    return results.first
  }
}

//MARK: - UserDefaults interactions
extension DailyPortionLogViewModel {
  
  func updateLastViewedDate(with dateComponents: DateComponents) {
    let data = try? encoder.encode(dateComponents)
    UserDefaults.standard.set(data, forKey: Constants.UserDefaultKeys.lastViewLogDate)
  }
  
  func getLastViewedDate() -> DateComponents? {
    guard let lastViewedDateInUserDefaults = UserDefaults.standard.value(forKey: Constants.UserDefaultKeys.lastViewLogDate) as? Data, let lastViewedDateComponents = try? decoder.decode(DateComponents.self, from: lastViewedDateInUserDefaults) else { return nil }
    return lastViewedDateComponents
  }
}
