//
//  Optimal_HealthApp.swift
//  Optimal Health
//
//  Created by Daniel Pressner on 05.09.22.
//

import SwiftUI
import CoreData

@main
struct Optimal_HealthApp: App {
  
  let context:NSManagedObjectContext
  let defaults = UserDefaults.standard
  
  var body: some Scene {
    WindowGroup {
      ContentView().environment(\.managedObjectContext, context)
    }
  }
  
  init() {
    ValueTransformer.setValueTransformer(DateComponentsTransformer(), forName: .dateComponentsTransformerName)
    self.context = CoreDataController.shared.context
    
    //MARK: - Initial default setup
    if defaults.value(forKey: Constants.UserDefaultKeys.numberOfTappableCarbs) == nil {
      defaults.set(20, forKey: Constants.UserDefaultKeys.numberOfTappableCarbs)
    }
    if defaults.value(forKey: Constants.UserDefaultKeys.numberOfTappableFats) == nil {
      defaults.set(20, forKey: Constants.UserDefaultKeys.numberOfTappableFats)
    }
    if defaults.value(forKey: Constants.UserDefaultKeys.numberOfTappableVegs) == nil {
      defaults.set(20, forKey: Constants.UserDefaultKeys.numberOfTappableVegs)
    }
    if defaults.value(forKey: Constants.UserDefaultKeys.numberOfTappableProteins) == nil {
      defaults.set(20, forKey: Constants.UserDefaultKeys.numberOfTappableProteins)
    }
    
    
    
  }
}
