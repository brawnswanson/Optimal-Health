//
//  DailyPortionLogView.swift
//  Optimal Health
//
//  Created by Daniel Pressner on 27.10.22.
//

import SwiftUI

struct DailyPortionLogView: View {
  
  @StateObject private var vm = DailyPortionLogViewModel()
  
  var body: some View {
    VStack {
      PortionLogHeader(currentDateComponents: $vm.currentLogDateComponents)
      Divider()
      Spacer()
      if let log = vm.currentLog {
        NutrientsView(log: log)
      } else {
        Button {
          vm.createNewLog()
        } label: {
          VStack {
            Image(systemName: "plus")
              .resizable()
              .scaledToFit()
              .frame(maxWidth: 75)
            Text("Add new log")
          }
        }
      }
      Spacer()
    }
  }
}

struct DailyPortionLogView_Previews: PreviewProvider {
  static var previews: some View {
    DailyPortionLogView()
  }
}
