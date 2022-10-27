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
  @State var extraPortion: Bool
  
  var body: some View {
    Button {
      
    } label: {
      ZStack {
        Circle()
          .foregroundColor(color)
          .opacity(filled ? 1.0 : 0.0)
        circleBorder()
      }
    }
    .tapAndLongPressGesture(valueToToggle: $filled)
  }
  
  @ViewBuilder
  func circleBorder() -> some View {
    if extraPortion && !filled {
      Circle()
        .stroke(color, style: StrokeStyle(lineWidth: 2.0, dash: [5.0]))
        .opacity(0.5)
    } else {
      Circle()
        .stroke(color, lineWidth: 2.0)
    }
  }
}

struct TappablePortionView_Previews: PreviewProvider {
  static var previews: some View {
    TappablePortionView(color: .orange, extraPortion: false)
  }
}
