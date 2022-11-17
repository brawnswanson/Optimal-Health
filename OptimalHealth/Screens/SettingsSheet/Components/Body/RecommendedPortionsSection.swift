//
//  RecommendedPortionsSection.swift
//  Optimal Health
//
//  Created by Daniel Pressner on 17.11.22.
//

import SwiftUI

struct RecommendedPortionsSection: View {
    var body: some View {
      Section {
        ForEach(Nutrient.allCases, id:\.self) { nutrient in
          RecommendedPotionsSlider(portions: nutrient.recommendedPortions, nutrientType: nutrient)
        }
      } header: {
        Text(Constants.Text.recommendedPortionsSettingLabel)
      }
    }
}

struct RecommendedPortionsSection_Previews: PreviewProvider {
    static var previews: some View {
        RecommendedPortionsSection()
    }
}
