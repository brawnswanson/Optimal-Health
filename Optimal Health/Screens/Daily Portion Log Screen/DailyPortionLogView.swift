//
//  DailyPortionLogView.swift
//  Optimal Health
//
//  Created by Daniel Pressner on 27.10.22.
//

import SwiftUI

struct DailyPortionLogView: View {
  
  @FetchRequest(sortDescriptors: [SortDescriptor(\.date, order: SortOrder.reverse)]) var logs: FetchedResults<DailyLog>
  
  var body: some View {
    VStack {
      PortionLogHeader()
      Divider()
      NutrientSectionView(nutrient: .proteins, minimumWidth: 30.0)
      Divider()
        .padding(.vertical)
      NutrientSectionView(nutrient: .vegetables, minimumWidth: 30.0)
      Divider()
        .padding(.vertical)
      NutrientSectionView(nutrient: .carbs, minimumWidth: 30.0)
      Divider()
        .padding(.vertical)
      NutrientSectionView(nutrient: .fats, minimumWidth: 30.0)
    }
  }
}

struct DailyPortionLogView_Previews: PreviewProvider {
  static var previews: some View {
    DailyPortionLogView()
  }
}
