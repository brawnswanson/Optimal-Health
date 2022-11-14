//
//  TappablePortionView.swift
//  Optimal Health
//
//  Created by Daniel Pressner on 27.10.22.
//
//TODO: - Need to fill in the tapped circle, using index isn't working as desired. Maybe an array of filled values created somehow?

import SwiftUI
import Combine

struct TappablePortionView: View {
  
  @Binding var nutrient: NutrientEntry
  var index: Int
  var nutrientSetting: Nutrient {
    Nutrient(rawValue: nutrient.name) ?? Nutrient.allCases.first!
  }
  var filled: Bool {
    nutrient.portionsConsumed >= index
  }
  var extraPortion: Bool {
    index > nutrient.portionsRecommended
  }
  
  var body: some View {
    Button {
      
    } label: {
      ZStack {
        Circle()
          .foregroundColor(nutrientSetting.color)
          .opacity(filled ? 1.0 : 0.0)
        circleBorder()
      }
      .scaledToFit()
    }
    .tapAndLongPressGesture(nutrient: $nutrient)
  }
  
  @ViewBuilder
  func circleBorder() -> some View {
    if extraPortion && !filled {
      Circle()
        .stroke(nutrientSetting.color, style: StrokeStyle(lineWidth: 2.0, dash: [5.0]))
        .opacity(0.5)
    } else {
      Circle()
        .stroke(nutrientSetting.color, lineWidth: 2.0)
    }
  }
}

//struct TappablePortionView_Previews: PreviewProvider {
//  static var previews: some View {
//    TappablePortionView(color: .orange, filled: true, extraPortion: false)
//  }
//}
