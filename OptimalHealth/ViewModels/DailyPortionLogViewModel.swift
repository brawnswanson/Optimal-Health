//
//  DailyPortionLogViewModel.swift
//  Optimal Health
//
//  Created by Daniel Pressner on 10.11.22.
//

import Foundation
import Combine
import ScrollingCalendar

class DailyPortionLogViewModel: ObservableObject {
  
  @Published var currentLog: DailyLog?
  @Published var currentLogNutrients: [NutrientEntry] = []
  @Published var currentLogDateComponents: DateComponents
  @Published var scrollingCalendarDateComponents: DateComponents?
  
  let updateNutrientConsumedPublisher = PassthroughSubject<(NutrientEntry, Int), Never>()
  
  private let contextChangePublisher = NotificationCenter.default.publisher(for: Notification.Name.NSManagedObjectContextObjectsDidChange)
  
  private let calendar = Calendar.current
  private let decoder = JSONDecoder()
  private let encoder = JSONEncoder()
  
  private var subscriptions = Set<AnyCancellable>()
  
  init() {
    
    if let defaultStartupString = UserDefaultsController.getValue(for: Constants.UserDefaultKeys.defaultStartUp, ofType: String.self), let defaultStartupSetting = StartUpScreenSelection.init(rawValue: defaultStartupString) {
      switch defaultStartupSetting {
      case .today:
        currentLogDateComponents = calendar.dateComponents([.year, .month, .day], from: Date())
      case .lastViewed:
        if let lastViewedDateInUserDefaults = UserDefaultsController.getValue(for: Constants.UserDefaultKeys.lastViewLogDate, ofType: Data.self), let lastViewedDateComponents = try? decoder.decode(DateComponents.self, from: lastViewedDateInUserDefaults) {
          currentLogDateComponents = lastViewedDateComponents
        } else {
          currentLogDateComponents = calendar.dateComponents([.year, .month, .day], from: Date())
        }
      }
    } else {
      currentLogDateComponents = calendar.dateComponents([.year, .month, .day], from: Date())
    }
    
    $currentLog
      .map { $0?.nutrientsArray }
      .replaceNil(with: [])
      .assign(to: &$currentLogNutrients)
    
    $scrollingCalendarDateComponents
      .sink {
        guard let newDateComponents = $0 else { return }
        self.currentLogDateComponents = newDateComponents
      }
      .store(in: &subscriptions)
    
    //Subscribe to publishers
    didUpdateCurrentViewDate()
    contextDidChangeRefreshLog()
    updateNutrientConsumedPublisher
      .sink { nutrient, amount in
        self.update(nutrient: nutrient, portionsConsumedBy: amount)
      }
      .store(in: &subscriptions)
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
      .map { _ in try? self.fetchLog(for: self.currentLogDateComponents)}
      .assign(to: &$currentLog)
  }
}

//MARK: - CoreData Interactions
extension DailyPortionLogViewModel {
  func createNewLog() {
    let newLog = DailyLog(context: CoreDataController.shared.context)
    newLog.date = currentLogDateComponents
    newLog.id = UUID()
    for nutrient in Nutrient.allCases {
      let nutrientEntry = NutrientEntry(context: CoreDataController.shared.context)
      nutrientEntry.nameData = nutrient.rawValue
      nutrientEntry.id = UUID()
      nutrientEntry.portionsConsumed = 0
      nutrientEntry.portionsRecommended = UserDefaults.standard.value(forKey: nutrient.userDefaultKey) as? Int32 ?? 8
      newLog.addToNutrientEntries(nutrientEntry)
    }
    try? CoreDataController.shared.context.save()
  }
  
  func fetchLog(for date: DateComponents) throws -> DailyLog? {
    let fetchRequest = DailyLog.dailyLogFetchRequest(for: date)
    let results = try CoreDataController.shared.context.fetch(fetchRequest)
    return results.first
  }
  
  func update(nutrient: NutrientEntry, portionsConsumedBy value: Int) {
    guard Int(nutrient.portionsConsumed) + value >= 0, Int(nutrient.portionsConsumed) + value <= 12 else { return }
    let newPortionsConsumed = Int(nutrient.portionsConsumed) + value
    nutrient.portionsConsumed = Int32(newPortionsConsumed)
    try? CoreDataController.shared.context.save()
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

extension DailyPortionLogViewModel: ScrollingCalendarInterface {
  func getFilledInDaysFor(month: Int, and year: Int) -> [Int] {
    let thisMonth = DailyLog.existingLogsFetchRequest(for: DateComponents(year: 2022, month: 11))
  return []
  }
  
  
}
