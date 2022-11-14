//
//  NutrientSectionView.swift
//  Optimal Health
//
//  Created by Daniel Pressner on 10.11.22.
//

import SwiftUI
import Combine

struct NutrientSectionView: View {
  
  @Binding var nutrient: NutrientEntry
  
  var nutrientSetting: Nutrient {
    Nutrient(rawValue: nutrient.name) ?? Nutrient.allCases.first!
  }
  
  var body: some View {
    VStack {
      HStack {
        Text("\(nutrientSetting.description)")
          .font(.title)
          .foregroundColor(nutrientSetting.color)
        Spacer()
      }
      LazyHGrid(rows: [.init(.flexible(minimum: 25)), .init(.flexible(minimum: 25))]) {
        ForEach(0..<12) { index in
          TappablePortionView(nutrient: $nutrient, index: index)
        }
      }
    }
  }
}

//struct NutrientSectionView_Previews: PreviewProvider {
//  static var previews: some View {
//    NutrientSectionView(nutrient: NutrientEntry(), minimumWidth: 30.0, updateNutrientPublisher: PassthroughSubject<(NutrientEntry, Int), Never>())
//  }
//}
