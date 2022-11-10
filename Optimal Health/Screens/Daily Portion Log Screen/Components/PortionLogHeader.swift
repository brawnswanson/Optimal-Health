//
//  PortionLogHeader.swift
//  Optimal Health
//
//  Created by Daniel Pressner on 10.11.22.
//

import SwiftUI

struct PortionLogHeader: View {
    
  @State var date = Date()
  
  var body: some View {
      HStack {
        SFSymbolButton(image: Constants.Images.chevronLeft, action: {})
        Text("\(date.formatted(date: .abbreviated, time: .omitted))")
        SFSymbolButton(image: Constants.Images.chevronRight, action: {})
      }
    }
}

struct PortionLogHeader_Previews: PreviewProvider {
    static var previews: some View {
        PortionLogHeader()
    }
}
