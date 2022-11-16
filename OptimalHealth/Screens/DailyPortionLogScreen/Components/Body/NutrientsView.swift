//
//  NutrientsView.swift
//  Optimal Health
//
//  Created by Daniel Pressner on 10.11.22.
//

import SwiftUI
import Combine

struct NutrientsView: View {
  
  @Binding var nutrients: [NutrientEntry]
  
  var body: some View {
    List {
      ForEach($nutrients, id:\.id) { $nutrient in
        NutrientSectionView(nutrient: $nutrient)
      }
    }
  }
}

//struct NutrientsView_Previews: PreviewProvider {
//  static var previews: some View {
//    NutrientsView(nutrients: .constant([]))
//  }
//}
