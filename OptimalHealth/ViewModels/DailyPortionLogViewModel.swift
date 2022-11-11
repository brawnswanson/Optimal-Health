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
    
    if let lastViewedDate = UserDefaults.standard.value(forKey: "currentViewDate") as? Data, let components = try? decoder.decode(DateComponents.self, from: lastViewedDate) {
      currentLogDate = components
    } else {
      currentLogDate = calendar.dateComponents([.day, .month, .year], from: Date())
    }
    
    //Subscribe to publishers
    updateCurrentViewDateInUserDefaults()
    //If the currentlogdate changes, need to fetch the log for that date. if no log exists, display the add button
    
  }
}

//MARK: - Combine subscribe functions
extension DailyPortionLogViewModel {
  func updateCurrentViewDateInUserDefaults() {
    $currentLogDate
      .map { try? self.encoder.encode($0) }
      .sink(receiveValue: { UserDefaults.standard.set($0, forKey: "currentViewDate")})
      .store(in: &subscriptions)
  }
  
  func fetchCurrentLogSubscription() {
    $currentLogDate
    
  }
}

//MARK: - CoreData Interactions
extension DailyPortionLogViewModel {
  func createNewLog() {
    guard let dateData = try? encoder.encode(currentLogDate) else { return }
    let newLog = DailyLog(context: CoreDataController.shared.context)
    newLog.date = dateData
    newLog.id = UUID()
  }
  
  func fetchLogs() -> DailyLog? {
    let fetchRequest = DailyLog.fetchRequest()
    fetchRequest.sortDescriptors = [NSSortDescriptor(key: "date", ascending: true)]
    guard let results = try? CoreDataController.shared.context.fetch(fetchRequest) else { return nil }
    return results.first
  }
}
