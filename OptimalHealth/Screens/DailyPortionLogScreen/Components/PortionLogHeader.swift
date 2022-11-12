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
        Text("\(date.month?.description ?? "1").\(date.day?.description ?? "1").\(date.year?.description ?? "1")")
        SFSymbolButton(image: Constants.Images.chevronRight, action: {})
      }
    }
}

//struct PortionLogHeader_Previews: PreviewProvider {
//    static var previews: some View {
//        PortionLogHeader(date: Date())
//    }
//}
