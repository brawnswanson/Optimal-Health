//
//  TapLongPressureGesture.swift
//  Optimal Health
//
//  Created by Daniel Pressner on 27.10.22.
//

import SwiftUI
import Combine

struct TapAndLongPressGesture: ViewModifier {
  
  @Binding var nutrient: NutrientEntry
  
  func body(content: Content) -> some View {
    content
      .simultaneousGesture(LongPressGesture().onEnded({ _ in
        update(nutrient: nutrient, portionsConsumedBy: -1)
      }))
      .simultaneousGesture(TapGesture().onEnded({ _ in
        update(nutrient: nutrient, portionsConsumedBy: 1)
      }))
  }
  
  func update(nutrient: NutrientEntry, portionsConsumedBy value: Int) {
    guard Int(nutrient.portionsConsumed) + value >= 0, Int(nutrient.portionsConsumed) + value <= 12 else { return }
    let newPortionsConsumed = Int(nutrient.portionsConsumed) + value
    nutrient.portionsConsumed = Int16(newPortionsConsumed)
    try? CoreDataController.shared.context.save()
  }
}

extension View {
  func tapAndLongPressGesture(nutrient: Binding<NutrientEntry>) -> some View {
    modifier(TapAndLongPressGesture(nutrient: nutrient))
  }
}
