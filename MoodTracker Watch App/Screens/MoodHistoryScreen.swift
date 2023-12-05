import SwiftUI
import SwiftData

struct MoodHistoryScreen: View {
  @Query var list: [MoodEntry]
  @Environment(\.modelContext) private var context
  
  var body: some View {
    if list.isEmpty {
      ContentUnavailableView(
        "Nothing, Zit, Nada",
        image: "doc.richtext.fill",
        description: Text("This place is too clean...")
      )
    } else {
      List {
        ForEach(list, id: \.id) { entry in
          MoodRowView(mood: entry.mood)
        }
        .onDelete(perform: { indexSet in
          for i in indexSet {
            let entry = list[i]
            context.delete(entry)
          }
        })
      }
    }
  }
}
