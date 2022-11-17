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
  }
}
