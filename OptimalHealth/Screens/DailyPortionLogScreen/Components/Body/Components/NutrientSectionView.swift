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
  
  var columns: [GridItem] {
    var array = [GridItem]()
    let numberOfColumns = nutrientSetting.numberOfVisiblePortions % 2 == 0 ? nutrientSetting.numberOfVisiblePortions / 2 : nutrientSetting.numberOfVisiblePortions / 2 + 1
    for _ in 0..<numberOfColumns {
      array.append(GridItem(.flexible(minimum:25)))
    }
    return array
  }
  
  var body: some View {
    VStack {
      HStack {
        Text("\(nutrientSetting.description)")
          .font(.title2)
          .foregroundColor(nutrientSetting.color)
        Spacer()
      }
      LazyVGrid(columns: columns) {
        ForEach(0..<nutrientSetting.numberOfVisiblePortions, id:\.self) { index in
          TappablePortionView(nutrient: $nutrient, index: index)
        }
      }
      Divider()
    }
  }
}

//struct NutrientSectionView_Previews: PreviewProvider {
//  static var previews: some View {
//    NutrientSectionView(nutrient: NutrientEntry(), minimumWidth: 30.0, updateNutrientPublisher: PassthroughSubject<(NutrientEntry, Int), Never>())
//  }
//}
