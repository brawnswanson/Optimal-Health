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
          TappablePortionView(color: .cyan)
          TappablePortionView(color: .cyan)
          TappablePortionView(color: .cyan)
          TappablePortionView(color: .cyan)
          TappablePortionView(color: .cyan)
          TappablePortionView(color: .cyan)
        }
        HStack {
          TappablePortionView(color: .cyan)
          TappablePortionView(color: .cyan)
          TappablePortionView(color: .cyan)
          TappablePortionView(color: .cyan)
          TappablePortionView(color: .cyan)
          TappablePortionView(color: .cyan)
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
          TappablePortionView(color: .green)
          TappablePortionView(color: .green)
          TappablePortionView(color: .green)
          TappablePortionView(color: .green)
          TappablePortionView(color: .green)
          TappablePortionView(color: .green)
        }
        HStack {
          TappablePortionView(color: .green)
          TappablePortionView(color: .green)
          TappablePortionView(color: .green)
          TappablePortionView(color: .green)
          TappablePortionView(color: .green)
          TappablePortionView(color: .green)
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
          TappablePortionView(color: .orange)
          TappablePortionView(color: .orange)
          TappablePortionView(color: .orange)
          TappablePortionView(color: .orange)
          TappablePortionView(color: .orange)
          TappablePortionView(color: .orange)
        }
        HStack {
          TappablePortionView(color: .orange)
          TappablePortionView(color: .orange)
          TappablePortionView(color: .orange)
          TappablePortionView(color: .orange)
          TappablePortionView(color: .orange)
          TappablePortionView(color: .orange)
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
          TappablePortionView(color: .yellow)
          TappablePortionView(color: .yellow)
          TappablePortionView(color: .yellow)
          TappablePortionView(color: .yellow)
          TappablePortionView(color: .yellow)
          TappablePortionView(color: .yellow)
        }
        HStack {
          TappablePortionView(color: .yellow)
          TappablePortionView(color: .yellow)
          TappablePortionView(color: .yellow)
          TappablePortionView(color: .yellow)
          TappablePortionView(color: .yellow)
          TappablePortionView(color: .yellow)
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
