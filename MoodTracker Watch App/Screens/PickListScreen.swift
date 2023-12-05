import SwiftUI
import SwiftData

struct PickListScreen: View {
  @State var showConfirmationSheet = false
  @Query var list: [MoodEntry]
  
  var body: some View {
    NavigationStack {
      List {
        if !list.isEmpty {
          NavigationLink {
            MoodHistoryScreen()
          } label: {
            HStack {
              Image(systemName: "list.dash")
              Text("^[\(list.count) entry](inflect: true)")
            }
          }
        }
        ForEach(Mood.allCases, id: \.self) { mood in
          NavigationLink {
            ConfirmMoodScreen(mood: mood)
          } label: {
            MoodRowView(mood: mood)
          }
          .padding(.vertical, 2)
        }
        .navigationTitle("I feel...")
      }
      .padding()
    }
  }
}
