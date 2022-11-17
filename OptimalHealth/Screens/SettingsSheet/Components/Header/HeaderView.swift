//
//  HeaderView.swift
//  Optimal Health
//
//  Created by Daniel Pressner on 17.11.22.
//

import SwiftUI

struct HeaderView: View {
  
  let dismiss: () -> ()
  
    var body: some View {
      ZStack {
        Text("Settings")
        HStack {
          Spacer()
          Button {
            dismiss()
          } label: {
            Image(systemName: "x.circle")
          }
          .padding(.horizontal)
        }
      }
      .padding(.vertical)
    }
}

struct HeaderView_Previews: PreviewProvider {
    
    static var previews: some View {
      HeaderView(dismiss: {})
    }
}
