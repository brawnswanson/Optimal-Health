//
//  NutrientsView.swift
//  Optimal Health
//
//  Created by Daniel Pressner on 10.11.22.
//

import SwiftUI

struct NutrientsView: View {
  
  let log: DailyLog
  
  var body: some View {
    List {
      ForEach(Nutrient.allCases, id:\.self) { nutrient in
        NutrientSectionView(nutrient: nutrient, minimumWidth: 30.0)
        Divider()
          .padding(.vertical)
      }
    }
  }
}

struct NutrientsView_Previews: PreviewProvider {
  static var previews: some View {
    NutrientsView(log: DailyLog())
  }
}
