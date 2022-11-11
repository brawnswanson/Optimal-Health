//
//  NutrientSectionView.swift
//  Optimal Health
//
//  Created by Daniel Pressner on 10.11.22.
//

import SwiftUI

struct NutrientSectionView: View {
  
  let nutrient: Nutrient
  let minimumWidth: Double
  
  var body: some View {
    VStack {
      HStack {
        Text("\(nutrient.description)")
          .font(.title)
          .foregroundColor(nutrient.color)
        Spacer()
      }
      .padding()
      LazyHGrid(rows: [.init(.flexible(minimum: minimumWidth)), .init(.flexible(minimum: minimumWidth))]) {
        ForEach(1..<11) { _ in
          TappablePortionView(color: nutrient.color, extraPortion: false)
        }
      }
    }
  }
}

struct NutrientSectionView_Previews: PreviewProvider {
  static var previews: some View {
    NutrientSectionView(nutrient: .proteins, minimumWidth: 30.0)
  }
}
