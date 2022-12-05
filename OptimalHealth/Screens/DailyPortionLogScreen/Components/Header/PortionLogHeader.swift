//
//  PortionLogHeader.swift
//  Optimal Health
//
//  Created by Daniel Pressner on 10.11.22.
//

import SwiftUI

struct PortionLogHeader: View {
  
  @Binding var isSettingsSheetDisplayed: Bool
  @Binding var currentDate: Date
    
  var body: some View {
    HStack {
      DatePicker("", selection: $currentDate, displayedComponents: [.date])
        .datePickerStyle(.compact)
      Spacer()
      Button {
        isSettingsSheetDisplayed.toggle()
      } label: {
        Image(systemName: "gearshape")
          .font(.system(size: 18))
      }
      .padding((.trailing))
    }
  }
}

struct PortionLogHeader_Preview: PreviewProvider {
  static var previews: some View {
    PortionLogHeader(isSettingsSheetDisplayed: .constant(false), currentDate: .constant(Date()))
  }
}
