import SwiftUI
import SwiftData

struct MoodHistoryScreen: View {
  @Query var list: [MoodEntry]
  var body: some View {
    List {
      ForEach(list, id: \.id) { entry in
        MoodRowView(mood: entry.mood)
      }
    }
  }
}
