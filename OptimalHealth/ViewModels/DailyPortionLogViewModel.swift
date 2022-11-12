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
      .print("userDefaultsUpdate:")
      .map { date -> Data? in
        try? self.encoder.encode(date)
      }
      .sink(receiveValue: { UserDefaults.standard.set($0, forKey: "currentViewDate")})
      .store(in: &subscriptions)
  }
  
  func fetchCurrentLogSubscription() {
    contextChangePublisher.combineLatest($currentLogDate)
      .print("Fetch currentLog:")
      .map { try? CoreDataController.shared.context.fetch(DailyLog.dailyLogFetchRequest(for: $1)) }
      .map { $0?.first }
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
  
  func fetchLogs() throws -> [DailyLog] {
    let fetchRequest = DailyLog.fetchRequest()
    let results = try CoreDataController.shared.context.fetch(fetchRequest)
    return results
  }
}
