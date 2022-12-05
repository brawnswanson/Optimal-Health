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
  @State var isSettingsSheetDisplayed = false
  
  var body: some View {
    VStack {
      PortionLogHeader(isSettingsSheetDisplayed: $isSettingsSheetDisplayed, currentDate: $vm.selectedDate)
      Divider()
      Spacer()
      if currentLogViewVisible {
        NutrientsView(nutrients: $vm.currentLogNutrients)
      } else {
        CreateLogButton(vm: vm)
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
