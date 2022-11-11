//
//  PortionLogHeader.swift
//  Optimal Health
//
//  Created by Daniel Pressner on 10.11.22.
//

import SwiftUI

struct PortionLogHeader: View {
    
  let date: Date
  private var dateComponents: DateComponents {
    Calendar.current.dateComponents([.year, .month, .day], from: date)
  }
  
  var body: some View {
      HStack {
        SFSymbolButton(image: Constants.Images.chevronLeft, action: {})
        Text("\(dateComponents.month?.description ?? "1").\(dateComponents.day?.description ?? "1").\(dateComponents.year?.description ?? "1")")
        SFSymbolButton(image: Constants.Images.chevronRight, action: {})
      }
    }
}

//struct PortionLogHeader_Previews: PreviewProvider {
//    static var previews: some View {
//        PortionLogHeader(date: Date())
//    }
//}
