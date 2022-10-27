//
//  TappablePortionView.swift
//  Optimal Health
//
//  Created by Daniel Pressner on 27.10.22.
//

import SwiftUI

struct TappablePortionView: View {
  
  @State var color: Color
  @State var filled = false
  @State var extraPortion = false
  
  var body: some View {
    Button {
      
    } label: {
      ZStack {
        Circle()
          .foregroundColor(color)
          .opacity(filled ? 1.0 : 0.0)
        Circle()
          .stroke(color, lineWidth: 2.0)
      }
    }
    .tapAndLongPressGesture(valueToToggle: $filled)
  }
}

struct TappablePortionView_Previews: PreviewProvider {
  static var previews: some View {
    TappablePortionView(color: .orange)
  }
}
