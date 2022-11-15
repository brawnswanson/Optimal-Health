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
  let index: Int
  var currentBit: Int {
    1 << index
  }
  
  func body(content: Content) -> some View {
    content
      .simultaneousGesture(LongPressGesture().onEnded({ _ in
        turnOffBit()
      }))
      .simultaneousGesture(TapGesture().onEnded({ _ in
        turnOnBit()
      }))
  }
  
  func turnOnBit() {
    guard currentBit & Int(nutrient.portionsConsumed) == 0 else { return }
    let newPortionsConsumed = Int(nutrient.portionsConsumed) ^ currentBit
    nutrient.portionsConsumed = Int32(newPortionsConsumed)
    try? CoreDataController.shared.context.save()
  }
  
  func turnOffBit() {
    guard currentBit & Int(nutrient.portionsConsumed) != 0 else { return }
    let newPortionsConsumed = Int(nutrient.portionsConsumed) ^ currentBit
    nutrient.portionsConsumed = Int32(newPortionsConsumed)
    try? CoreDataController.shared.context.save()
  }
}

extension View {
  func tapAndLongPressGesture(nutrient: Binding<NutrientEntry>, index: Int) -> some View {
    modifier(TapAndLongPressGesture(nutrient: nutrient, index: index))
  }
}
