//
//  SFSymbolButton.swift
//  Optimal Health
//
//  Created by Daniel Pressner on 10.11.22.
//

import SwiftUI

struct SFSymbolButton: View {
  let image: Image
  let action: () -> ()
  
    var body: some View {
      Button {
        action()
      } label: {
        image
      }
    }
}

struct SFSymbolButton_Previews: PreviewProvider {
    static var previews: some View {
      SFSymbolButton(image: Image(systemName: "chevron.left"), action: {})
    }
}
