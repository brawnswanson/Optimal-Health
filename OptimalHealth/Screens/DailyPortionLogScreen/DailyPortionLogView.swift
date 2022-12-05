//
//  DailyPortionLogView.swift
//  Optimal Health
//
//  Created by Daniel Pressner on 27.10.22.
//
import Foundation
import SwiftUI

struct DailyPortionLogView: View {
  
  @StateObject private var vm = DailyPortionLogViewModel()
  
  @State var selectedDate = Date()
  @State var currentLogViewVisible: Bool = false
  @State var isSettingsSheetDisplayed = false
  @AppStorage(Constants.UserDefaultKeys.lastViewedDate, store: .standard) var lastViewedDateInterval = Date().timeIntervalSince1970
  @AppStorage(Constants.UserDefaultKeys.defaultStartUp) var startUpPreference = StartUpScreenSelection.today.rawValue
  
  var body: some View {
    VStack {
      PortionLogHeader(isSettingsSheetDisplayed: $isSettingsSheetDisplayed, currentDate: $selectedDate)
        .sheet(isPresented: $isSettingsSheetDisplayed) {
          SettingsSheet()
        }
      Divider()
      Spacer()
      if currentLogViewVisible {
        NutrientsView(nutrients: $vm.currentLogNutrients)
      } else {
        CreateLogButton(vm: vm)
      }
      Spacer()
    }
    .onChange(of: selectedDate) { date in
      lastViewedDateInterval = date.timeIntervalSince1970
    }
    //    .onReceive(vm.$currentLog, perform: { log in
    //      guard let _ = log else {
    //        currentLogViewVisible = false
    //        return
    //      }
    //      currentLogViewVisible = true
    //    })
    .onAppear {
      guard let startUpPreference = StartUpScreenSelection(rawValue: startUpPreference) else { return }
      switch startUpPreference {
      case .today:
        selectedDate = Date()
      case .lastViewed:
        selectedDate = Date(timeIntervalSince1970: lastViewedDateInterval)
      }
    }
  }
}

struct DailyPortionLogView_Previews: PreviewProvider {
  static var previews: some View {
    DailyPortionLogView()
  }
}
