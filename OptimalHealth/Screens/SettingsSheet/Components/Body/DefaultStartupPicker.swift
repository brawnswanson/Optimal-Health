//
//  DefaultStartupPicker.swift
//  Optimal Health
//
//  Created by Daniel Pressner on 16.11.22.
//

import SwiftUI

struct DefaultStartupPicker: View {
  
  @AppStorage(Constants.UserDefaultKeys.defaultStartUp) var defaultStartup = StartUpScreenSelection.today.rawValue
  
  var body: some View {
    HStack {
      Picker(selection: $defaultStartup, label: Text(Constants.Text.defaultDateSettingLabel)) {
        Text(StartUpScreenSelection.today.label).tag(StartUpScreenSelection.today.rawValue)
        Text(StartUpScreenSelection.lastViewed.label).tag(StartUpScreenSelection.lastViewed.rawValue)
      }
      .pickerStyle(.segmented)
    }
  }
}

struct DefaultStartupPicker_Previews: PreviewProvider {
  static var previews: some View {
    DefaultStartupPicker()
  }
}
