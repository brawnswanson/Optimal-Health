//
//  Optimal_HealthApp.swift
//  Optimal Health
//
//  Created by Daniel Pressner on 05.09.22.
//

import SwiftUI

@main
struct Optimal_HealthApp: App {
  
  let context = CoreDataController.shared.context
  
  var body: some Scene {
    WindowGroup {
      ContentView().environment(\.managedObjectContext, context)
    }
  }
}
