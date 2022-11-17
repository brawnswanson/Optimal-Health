//
//  TappablePortionView.swift
//  Optimal Health
//
//  Created by Daniel Pressner on 27.10.22.
//

import Foundation
import SwiftUI
import Combine

struct TappablePortionView: View {
  
  @Binding var nutrient: NutrientEntry
  var index: Int
  var nutrientSetting: Nutrient {
    Nutrient(rawValue: nutrient.name) ?? Nutrient.allCases.first!
  }
  var filled: Bool {
    let filledPortions = Int(nutrient.portionsConsumed)
    let currentCircle = 1 << index
    return filledPortions & currentCircle != 0 ? true : false
  }
  
  var extraPortion: Bool {
    var recommendedPortions = 0
    for _ in 0..<nutrient.portionsRecommended {
      recommendedPortions = recommendedPortions << 1 + 1
    }
    return recommendedPortions & (0b1 << index) != 0 ? false: true
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
    .tapAndLongPressGesture(nutrient: $nutrient, index: index)
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
//    TappablePortionView(nutrient: .constant(NutrientEntry()), index: 0)
//  }
//}
