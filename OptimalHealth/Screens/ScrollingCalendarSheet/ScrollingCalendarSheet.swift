//
//  ScrollingCalendarSheet.swift
//  Optimal Health
//
//  Created by Daniel Pressner on 29.11.22.
//

import SwiftUI
import ScrollingCalendar

struct ScrollingCalendarSheet: View {
  
  @EnvironmentObject var vm: DailyPortionLogViewModel
  @Environment(\.dismiss) var dismiss
  
    var body: some View {
      ScrollingCalendar(viewModel: ScrollingCalendarViewModel(interface: vm), selectedDate: $vm.scrollingCalendarDateComponents)
        .onChange(of: vm.scrollingCalendarDateComponents) { _ in
          dismiss()
        }
    }
}

struct ScrollingCalendarSheet_Previews: PreviewProvider {
    static var previews: some View {
        ScrollingCalendarSheet()
    }
}
