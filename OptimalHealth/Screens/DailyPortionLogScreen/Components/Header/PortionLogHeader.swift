//
//  PortionLogHeader.swift
//  Optimal Health
//
//  Created by Daniel Pressner on 10.11.22.
//

import SwiftUI

struct PortionLogHeader: View {
  
  @Binding var currentDateComponents: DateComponents
  
  let cal = Calendar.current
  
  var body: some View {
    HStack {
      SFSymbolButton(image: Constants.Images.chevronLeft, action: { changeDate(component: .month, by: -1) })
      SFSymbolButton(image: Constants.Images.chevronLeft, action: { changeDate(component: .day, by: -1) })
      Text("\(currentDateString)")
      SFSymbolButton(image: Constants.Images.chevronRight, action: { changeDate(component: .day, by: 1) })
      SFSymbolButton(image: Constants.Images.chevronRight, action: { changeDate(component: .month, by: 1) })
    }
  }
}

extension PortionLogHeader {
  
  func changeDate(component: Calendar.Component, by value: Int) {
    guard let currentDate = cal.date(from: currentDateComponents), let newDate = cal.date(byAdding: component, value: value, to: currentDate) else { return }
    currentDateComponents = returnDateComponents(newDate)
  }
  
  func returnDateComponents(_ date: Date) -> DateComponents {
    cal.dateComponents([.year, .month, .day], from: date)
  }
  
  var currentDateString: String {
    guard let date = Calendar.current.date(from: currentDateComponents) else { return Date().formatted(date: .abbreviated, time: .omitted) }
    return date.formatted(date: .abbreviated, time: .omitted)
  }
}
