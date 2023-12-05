import SwiftUI
import SwiftData

struct PickListScreen: View {
  @State var showConfirmationSheet = false
  
  var body: some View {
    NavigationStack {
      List {
        NavigationLink {
          MoodHistoryScreen()
        } label: {
          HStack {
            Image(systemName: "list.dash")
            Text("History")
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
