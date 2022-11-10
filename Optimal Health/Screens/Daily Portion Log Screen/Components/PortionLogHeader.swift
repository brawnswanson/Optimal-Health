//
//  PortionLogHeader.swift
//  Optimal Health
//
//  Created by Daniel Pressner on 10.11.22.
//

import SwiftUI

struct PortionLogHeader: View {
    
  let date: DateComponents
  
  var body: some View {
      HStack {
        SFSymbolButton(image: Constants.Images.chevronLeft, action: {})
        Text("\(date.month?.magnitude ?? 1).\(date.day?.magnitude ?? 1).\(date.year?.magnitude ?? 1)")
        SFSymbolButton(image: Constants.Images.chevronRight, action: {})
      }
    }
}

//struct PortionLogHeader_Previews: PreviewProvider {
//    static var previews: some View {
//        PortionLogHeader(date: Date())
//    }
//}
