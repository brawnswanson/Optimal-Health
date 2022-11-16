//
//  SettingsSheet.swift
//  Optimal Health
//
//  Created by Daniel Pressner on 16.11.22.
//

import SwiftUI

struct SettingsSheet: View {
  
  @State var recommendedPortions: (proteins: Double, fats: Double, carbs: Double, veg: Double) = (0,0,0,0)
  
  var body: some View {
    Form {
      Section {
        HStack {
          Slider(value: $recommendedPortions.proteins, in: 0.0...Constants.InitialDefaults.visiblePortions, step: 1)
          Text("\(Int(recommendedPortions.proteins))")
        }
      } header: {
        Text("Proteins")
      }
      Section {
        HStack {
          Slider(value: $recommendedPortions.fats, in: 0.0...Constants.InitialDefaults.visiblePortions, step: 1)
          Text("\(Int(recommendedPortions.fats))")
        }
      } header: {
        Text("Fats")
      }
      Section {
        HStack {
          Slider(value: $recommendedPortions.carbs, in: 0.0...Constants.InitialDefaults.visiblePortions, step: 1)
          Text("\(Int(recommendedPortions.carbs))")
        }
      } header: {
        Text("Carbs")
      }
      Section {
        HStack {
          Slider(value: $recommendedPortions.veg, in: 0.0...Constants.InitialDefaults.visiblePortions, step: 1)
          Text("\(Int(recommendedPortions.veg))")
        }
      } header: {
        Text("Vegetables")
      }
    }
    .onAppear {
      getSettings()
    }
    .onDisappear {
      updateSettings()
    }
  }
}

extension SettingsSheet {
  func getSettings() {
    let userDefaults = UserDefaults.standard
    recommendedPortions.proteins = userDefaults.value(forKey: Constants.UserDefaultKeys.recommendedProteins) as? Double ?? 8
    recommendedPortions.fats = userDefaults.value(forKey: Constants.UserDefaultKeys.recommendedFats) as? Double ?? 8
    recommendedPortions.carbs = userDefaults.value(forKey: Constants.UserDefaultKeys.recommendedCarbs) as? Double ?? 8
    recommendedPortions.veg = userDefaults.value(forKey: Constants.UserDefaultKeys.recommendedVeg) as? Double ?? 8
  }
  
  func updateSettings() {
    let userDefaults = UserDefaults.standard
    userDefaults.set(recommendedPortions.proteins, forKey: Constants.UserDefaultKeys.recommendedProteins)
    userDefaults.set(recommendedPortions.fats, forKey: Constants.UserDefaultKeys.recommendedFats)
    userDefaults.set(recommendedPortions.carbs, forKey: Constants.UserDefaultKeys.recommendedCarbs)
    userDefaults.set(recommendedPortions.veg, forKey: Constants.UserDefaultKeys.recommendedVeg)
  }
}

struct SettingsSheet_Previews: PreviewProvider {
  static var previews: some View {
    SettingsSheet()
  }
}
