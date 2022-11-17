//
//  CoreDataController.swift
//  Optimal Health
//
//  Created by Daniel Pressner on 10.11.22.
//

import Foundation
import CoreData

//MARK: CoreDataController Singleton pattern to ensure only one instance of context
public final class CoreDataController {
  
  public static let shared = CoreDataController()
  
  private lazy var container: NSPersistentContainer = {
    let persistentContainer = NSPersistentContainer(name: Constants.CoreDataInfo.dailyLogModelName)
    #if !targetEnvironment(simulator)
    persistentContainer.loadPersistentStores { description, error in
      if error != nil {
        fatalError(Constants.CoreDataInfo.coreDataFatalError)
      }
    }
    #endif
    return persistentContainer
  }()
  
  lazy var context: NSManagedObjectContext = {
    container.viewContext
  }()
  
  private init() {}
}
