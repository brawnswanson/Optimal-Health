//
//  RecommendedPotionsSlider.swift
//  Optimal Health
//
//  Created by Daniel Pressner on 16.11.22.
//

import SwiftUI

struct RecommendedPotionsSlider: View {
  
  @State var portions: Double
  var nutrientType: Nutrient
  
  var body: some View {
    HStack {
      Text("\(nutrientType.description)")
      Slider(value: $portions, in: 0.0...Constants.InitialDefaults.visiblePortions, step: 1)
      Text("\(Int(portions))")
    }
    .onChange(of: portions) { newPortions in
      UserDefaults.standard.set(newPortions, forKey: nutrientType.userDefaultKey)
    }
  }
}

struct RecommendedPotionsSlider_Previews: PreviewProvider {
  static var previews: some View {
    RecommendedPotionsSlider(portions: 2.0, nutrientType: .proteins)
  }
}
