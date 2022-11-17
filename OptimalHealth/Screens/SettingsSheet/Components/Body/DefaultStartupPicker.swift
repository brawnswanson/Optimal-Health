//
//  DefaultStartupPicker.swift
//  Optimal Health
//
//  Created by Daniel Pressner on 16.11.22.
//

import SwiftUI

struct DefaultStartupPicker: View {
  
  @State var defaultDatePickerSelection: StartUpScreenSelection
  
    var body: some View {
      HStack {
        Picker(selection: $defaultDatePickerSelection, label: Text(Constants.Text.defaultDateSettingLabel)) {
          Text(StartUpScreenSelection.today.label).tag(StartUpScreenSelection.today)
          Text(StartUpScreenSelection.lastViewed.label).tag(StartUpScreenSelection.lastViewed)
        }
        .pickerStyle(.segmented)
      }
      .onChange(of: defaultDatePickerSelection) { value in
        UserDefaults.standard.set(value.rawValue, forKey: Constants.UserDefaultKeys.defaultStartUp)
      }
    }
  
  init() {
    if let currentSelectionString = UserDefaults.standard.value(forKey: Constants.UserDefaultKeys.defaultStartUp) as? String, let currentSelection = StartUpScreenSelection.init(rawValue: currentSelectionString) {
      defaultDatePickerSelection = currentSelection
    } else {
      defaultDatePickerSelection = .today
    }
  }
}

struct DefaultStartupPicker_Previews: PreviewProvider {
    static var previews: some View {
        DefaultStartupPicker()
    }
}
