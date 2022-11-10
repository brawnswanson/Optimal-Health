//
//  DailyPortionLogView.swift
//  Optimal Health
//
//  Created by Daniel Pressner on 27.10.22.
//

import SwiftUI

struct DailyPortionLogView: View {
  
  
  var body: some View {
    VStack {
      PortionLogHeader()
      Divider()
      NutrientSectionView(heading: "Proteins", color: .cyan, minimumWidth: 30.0)
      Divider()
        .padding(.vertical)
      NutrientSectionView(heading: "Vegetables", color: .green, minimumWidth: 30.0)
      Divider()
        .padding(.vertical)
      NutrientSectionView(heading: "Carbs", color: .orange, minimumWidth: 30.0)
      Divider()
        .padding(.vertical)
      NutrientSectionView(heading: "Fats", color: .yellow, minimumWidth: 30.0)
    }
  }
}

struct DailyPortionLogView_Previews: PreviewProvider {
  static var previews: some View {
    DailyPortionLogView()
  }
}
