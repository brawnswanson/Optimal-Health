//
//  RecommendedPotionsSlider.swift
//  Optimal Health
//
//  Created by Daniel Pressner on 16.11.22.
//

import SwiftUI

struct RecommendedPortionsSlider: View {

  @AppStorage var recommendedPortions: Double
  var nutrientType: Nutrient
  
  var body: some View {
    HStack {
      Text("\(nutrientType.description)")
      Slider(value: $recommendedPortions, in: 0.0...Constants.InitialDefaults.visiblePortions, step: 1)
      Text("\(Int(recommendedPortions))")
    }
  }
}

struct RecommendedPotionsSlider_Previews: PreviewProvider {
  static var previews: some View {
    RecommendedPortionsSlider(recommendedPortions: AppStorage(wrappedValue: 2.0, Constants.UserDefaultKeys.recommendedProteins), nutrientType: .proteins)
  }
}
