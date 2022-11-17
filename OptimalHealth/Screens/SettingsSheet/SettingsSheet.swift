//
//  SettingsSheet.swift
//  Optimal Health
//
//  Created by Daniel Pressner on 16.11.22.
//

import SwiftUI

struct SettingsSheet: View {
  
  @Environment(\.dismiss) var dismiss
  
  var body: some View {
    VStack {
      HeaderView(dismiss: dismiss.callAsFunction)
      Form {
        RecommendedPortionsSection()
        DefaultDateSection()
      }
    }
  }
}

struct SettingsSheet_Previews: PreviewProvider {
  static var previews: some View {
    SettingsSheet()
  }
}
