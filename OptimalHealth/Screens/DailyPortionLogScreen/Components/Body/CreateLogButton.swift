//
//  CreateLogButton.swift
//  Optimal Health
//
//  Created by Daniel Pressner on 16.11.22.
//

import SwiftUI

struct CreateLogButton: View {
  
  @ObservedObject var vm: DailyPortionLogViewModel
  
  var body: some View {
    Button {
      #if !targetEnvironment(simulator)
      vm.createNewLog()
      #endif
    } label: {
      VStack {
        Constants.Images.plus
          .resizable()
          .scaledToFit()
          .frame(maxWidth: Constants.Dimensions.createLogButtonMaxWidth)
        Text(Constants.Text.createLogButtonDescription)
      }
    }
  }
}

struct CreateLogButton_Previews: PreviewProvider {
  static var previews: some View {
    CreateLogButton(vm: DailyPortionLogViewModel())
  }
}
