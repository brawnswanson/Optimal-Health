//
//  DailyPortionLogView.swift
//  Optimal Health
//
//  Created by Daniel Pressner on 27.10.22.
//

import SwiftUI

struct DailyPortionLogView: View {
  
  
  var body: some View {
    VStack {
      HStack {
        Image(systemName: "chevron.left")
        Text("\(Date().formatted(date: .abbreviated, time: .omitted))")
        Image(systemName: "chevron.right")
      }
      Divider()
      Group {
        HStack {
          Text("Protein")
            .font(.title)
            .foregroundColor(.cyan)
          Spacer()
        }
        .padding()
        HStack {
          TappablePortionView(color: .cyan, extraPortion: false)
          TappablePortionView(color: .cyan, extraPortion: false)
          TappablePortionView(color: .cyan, extraPortion: false)
          TappablePortionView(color: .cyan, extraPortion: false)
          TappablePortionView(color: .cyan, extraPortion: false)
          TappablePortionView(color: .cyan, extraPortion: false)
        }
        HStack {
          TappablePortionView(color: .cyan, extraPortion: false)
          TappablePortionView(color: .cyan, extraPortion: false)
          TappablePortionView(color: .cyan, extraPortion: false)
          TappablePortionView(color: .cyan, extraPortion: false)
          TappablePortionView(color: .cyan, extraPortion: false)
          TappablePortionView(color: .cyan, extraPortion: true)
        }
      }
      Divider()
        .padding(.vertical)
      Group {
        HStack {
          Text("Vegetables")
            .font(.title)
            .foregroundColor(.green)
          Spacer()
        }
        .padding()
        HStack {
          TappablePortionView(color: .green, extraPortion: false)
          TappablePortionView(color: .green, extraPortion: false)
          TappablePortionView(color: .green, extraPortion: false)
          TappablePortionView(color: .green, extraPortion: false)
          TappablePortionView(color: .green, extraPortion: false)
          TappablePortionView(color: .green, extraPortion: false)
        }
        HStack {
          TappablePortionView(color: .green, extraPortion: false)
          TappablePortionView(color: .green, extraPortion: false)
          TappablePortionView(color: .green, extraPortion: false)
          TappablePortionView(color: .green, extraPortion: false)
          TappablePortionView(color: .green, extraPortion: false)
          TappablePortionView(color: .green, extraPortion: true)
        }
      }
      Divider()
        .padding(.vertical)
      Group {
        HStack {
          Text("Carbs")
            .font(.title)
            .foregroundColor(.orange)
          Spacer()
        }
        .padding()
        HStack {
          TappablePortionView(color: .orange, extraPortion: false)
          TappablePortionView(color: .orange, extraPortion: false)
          TappablePortionView(color: .orange, extraPortion: false)
          TappablePortionView(color: .orange, extraPortion: false)
          TappablePortionView(color: .orange, extraPortion: false)
          TappablePortionView(color: .orange, extraPortion: false)
        }
        HStack {
          TappablePortionView(color: .orange, extraPortion: false)
          TappablePortionView(color: .orange, extraPortion: false)
          TappablePortionView(color: .orange, extraPortion: false)
          TappablePortionView(color: .orange, extraPortion: false)
          TappablePortionView(color: .orange, extraPortion: false)
          TappablePortionView(color: .orange, extraPortion: true)
        }
      }
      Divider()
        .padding(.vertical)
      Group {
        HStack {
          Text("Fats")
            .font(.title)
            .foregroundColor(.yellow)
          Spacer()
        }
        .padding()
        HStack {
          TappablePortionView(color: .yellow, extraPortion: false)
          TappablePortionView(color: .yellow, extraPortion: false)
          TappablePortionView(color: .yellow, extraPortion: false)
          TappablePortionView(color: .yellow, extraPortion: false)
          TappablePortionView(color: .yellow, extraPortion: false)
          TappablePortionView(color: .yellow, extraPortion: false)
        }
        HStack {
          TappablePortionView(color: .yellow, extraPortion: false)
          TappablePortionView(color: .yellow, extraPortion: false)
          TappablePortionView(color: .yellow, extraPortion: false)
          TappablePortionView(color: .yellow, extraPortion: false)
          TappablePortionView(color: .yellow, extraPortion: false)
          TappablePortionView(color: .yellow, extraPortion: true)
        }
      }
    }
  }
}

struct DailyPortionLogView_Previews: PreviewProvider {
  static var previews: some View {
    DailyPortionLogView()
  }
}
