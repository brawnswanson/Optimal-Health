//
//  RecommendedPortionsSection.swift
//  Optimal Health
//
//  Created by Daniel Pressner on 17.11.22.
//

import SwiftUI

struct RecommendedPortionsSection: View {
  
  @AppStorage(Constants.UserDefaultKeys.recommendedVeg) var recommendedVeg = 8.0
  @AppStorage(Constants.UserDefaultKeys.recommendedCarbs) var recommendedCarbs = 8.0
  @AppStorage(Constants.UserDefaultKeys.recommendedProteins) var recommendedProteins = 8.0
  @AppStorage(Constants.UserDefaultKeys.recommendedFats) var recommendedFats = 8.0
  
    var body: some View {
      Section {
        ForEach(Nutrient.allCases, id:\.self) { nutrient in
          RecommendedPortionsSlider(recommendedPortions: getRecommendedPortionsUserDefault(for: nutrient), nutrientType: nutrient)
        }
      } header: {
        Text(Constants.Text.recommendedPortionsSettingLabel)
      }
    }
  
  func getRecommendedPortionsUserDefault(for nutrient: Nutrient) -> AppStorage<Double> {
    switch nutrient {
    case .carbs:
      return _recommendedCarbs
    case .fats:
      return _recommendedFats
    case .proteins:
      return _recommendedProteins
    case .vegetables:
      return _recommendedVeg
    }
  }
}

struct RecommendedPortionsSection_Previews: PreviewProvider {
    static var previews: some View {
        RecommendedPortionsSection()
    }
}
