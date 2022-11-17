//
//  DefaultDateSection.swift
//  Optimal Health
//
//  Created by Daniel Pressner on 17.11.22.
//

import SwiftUI

struct DefaultDateSection: View {
    var body: some View {
      Section {
        DefaultStartupPicker()
      } header: {
        Text(Constants.Text.defaultDateSettingLabel)
      }
    }
}

struct DefaultDateSection_Previews: PreviewProvider {
    static var previews: some View {
        DefaultDateSection()
    }
}
