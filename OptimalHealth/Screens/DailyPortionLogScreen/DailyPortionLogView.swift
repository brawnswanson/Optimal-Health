//
//  DailyPortionLogView.swift
//  Optimal Health
//
//  Created by Daniel Pressner on 27.10.22.
//

import SwiftUI

struct DailyPortionLogView: View {
  
  @StateObject private var vm = DailyPortionLogViewModel()
  @State var currentLogViewVisible: Bool = false
  
  var body: some View {
    VStack {
      PortionLogHeader(currentDateComponents: $vm.currentLogDateComponents)
      Divider()
      Spacer()
      if currentLogViewVisible {
        NutrientsView(nutrients: $vm.currentLogNutrients)
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
    .onReceive(vm.$currentLog, perform: { log in
      guard let _ = log else {
        currentLogViewVisible = false
        return
      }
      currentLogViewVisible = true
    })
  }
}

struct DailyPortionLogView_Previews: PreviewProvider {
  static var previews: some View {
    DailyPortionLogView()
  }
}