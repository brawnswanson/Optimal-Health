//
//  PortionLogHeader.swift
//  Optimal Health
//
//  Created by Daniel Pressner on 10.11.22.
//

import SwiftUI
import ScrollingCalendar

struct PortionLogHeader: View {
  
  @State var isSettingsSheetDisplayed = false
  @State var isCalendarSheetPresented = false
  
  @EnvironmentObject var vm: DailyPortionLogViewModel
  
  var fowardDayDisabled: Bool {
    let today = Date()
    let todayComponents = returnDateComponents(today)
    return vm.currentLogDateComponents == todayComponents ? true : false
  }
  
  var forwardMonthDisabled: Bool {
    guard let currentViewedDate = cal.date(from: vm.currentLogDateComponents), let oneMonthFromCurrent = cal.date(byAdding: .month, value: 1, to: currentViewedDate) else { return false }
    if cal.isDate(oneMonthFromCurrent, inSameDayAs: Date()) { return false }
    else if oneMonthFromCurrent > Date() { return true }
    else { return false }
  }
  
  let cal = Calendar.current
  
  var body: some View {
    HStack {
      HStack {
        SFSymbolButton(image: Constants.Images.doubleChevronLeft, action: { changeDate(component: .month, by: -1) })
        SFSymbolButton(image: Constants.Images.chevronLeft, action: { changeDate(component: .day, by: -1) })
        Text("\(currentDateString)")
          .font(.system(size: 18))
        SFSymbolButton(image: Constants.Images.chevronRight, action: { changeDate(component: .day, by: 1) })
          .disabled(fowardDayDisabled)
        SFSymbolButton(image: Constants.Images.doubleChevronright, action: { changeDate(component: .month, by: 1) })
          .disabled(forwardMonthDisabled)
      }
      .padding(.horizontal)
      Spacer()
      Button {
        isCalendarSheetPresented = true
      } label: {
        Image(systemName: "calendar")
      }
      .sheet(isPresented: $isCalendarSheetPresented) {
        ScrollingCalendarSheet()
      }
      Spacer()
      Button {
        vm.currentLogDateComponents = returnDateComponents(Date())
      } label: {
        Text("Today")
          .font(.system(size: 18))
      }
      Spacer()
      Button {
        isSettingsSheetDisplayed.toggle()
      } label: {
        Image(systemName: "gearshape")
          .font(.system(size: 18))
      }
      .padding((.trailing))
      .sheet(isPresented: $isSettingsSheetDisplayed) {
        SettingsSheet()
      }
    }
  }
}

extension PortionLogHeader {
  
  func changeDate(component: Calendar.Component, by value: Int) {
    guard let currentDate = cal.date(from: vm.currentLogDateComponents), let newDate = cal.date(byAdding: component, value: value, to: currentDate) else { return }
    vm.currentLogDateComponents = returnDateComponents(newDate)
  }
  
  func returnDateComponents(_ date: Date) -> DateComponents {
    cal.dateComponents([.year, .month, .day], from: date)
  }
  
  var currentDateString: String {
    guard let date = Calendar.current.date(from: vm.currentLogDateComponents) else { return Date().formatted(date: .abbreviated, time: .omitted) }
    return date.formatted(date: .abbreviated, time: .omitted)
  }
}

struct PortionLogHeader_Preview: PreviewProvider {
  static var previews: some View {
    PortionLogHeader()
  }
}
