//
//  ContentView.swift
//  Optimal Health
//
//  Created by Daniel Pressner on 05.09.22.
//

import SwiftUI
import ScrollingCalendar

struct ContentView: View {
  
  @FetchRequest(sortDescriptors: []) private var logs: FetchedResults<DailyLog>
  
  
  var body: some View {
    TabView {
      DailyPortionLogView().tabItem {
        Label {
          Text("Daily Log")
        } icon: {
          Image(systemName: "book")
        }
      }
//      ScrollingCalendar(viewModel: ScrollingCalendarViewModel(dataSource: nil))
    }
    .onAppear {
//      let dataSourceArray: [any ScrollingCalendarAttachment] = []
//      for log in logs {
//        
//      }
//      
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
