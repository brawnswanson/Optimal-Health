//
//  ContentView.swift
//  Optimal Health
//
//  Created by Daniel Pressner on 05.09.22.
//

import SwiftUI

struct ContentView: View {
  
  @FetchRequest(sortDescriptors: []) private var logs: FetchedResults<DailyLog>
  
  var body: some View {
    DailyPortionLogView()
  }
  
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
