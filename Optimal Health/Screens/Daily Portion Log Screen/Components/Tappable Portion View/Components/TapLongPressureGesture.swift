//
//  TapLongPressureGesture.swift
//  Optimal Health
//
//  Created by Daniel Pressner on 27.10.22.
//

import SwiftUI

struct TapAndLongPressGesture: ViewModifier {
  
  @Binding var toggle: Bool
  
  func body(content: Content) -> some View {
    content
      .simultaneousGesture(LongPressGesture().onEnded({ _ in
        toggle = false
      }))
      .simultaneousGesture(TapGesture().onEnded({ _ in
        toggle = true
      }))
  }
}

extension View {
  func tapAndLongPressGesture(valueToToggle: Binding<Bool>) -> some View {
    modifier(TapAndLongPressGesture(toggle: valueToToggle))
  }
}
