//
//  NutrientsViewModel.swift
//  Optimal Health
//
//  Created by Daniel Pressner on 14.11.22.
//

import Foundation

class NutrientsSectionViewModel: ObservableObject {
  
  @Published var totalCircles: Int = 12
  @Published var portionsConsumed: Int = 0
  @Published var recommendedPortions: Int = 0
  
  @Published var nutrient: NutrientEntry
  
  init(nutrient: NutrientEntry) {
    self.nutrient = nutrient
    
    $nutrient
      .map { Int($0.portionsConsumed) }
      .assign(to: &$portionsConsumed)
    
    $nutrient
      .map { Int($0.portionsRecommended) }
      .assign(to: &$recommendedPortions)
  }
}
