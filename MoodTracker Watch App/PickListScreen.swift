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

// MoodRowView
struct MoodRowView: View {
  var mood: Mood
  
  var body: some View {
    ZStack {
      RoundedRectangle(cornerRadius: 10)
        .fill(mood.getColor())
      
      HStack {
        Text(mood.getEmoji())
          .font(.largeTitle)
        
        Text(mood.rawValue)
        Spacer()
      }
      .padding()
    }
  }
}

// ConfirmMoodScreen
fileprivate struct ConfirmMoodScreen: View {
  var mood: Mood
  @Environment(\.dismiss) var dismiss
  @Environment(\.modelContext) private var context
  
  func saveMood(_ mood: Mood) {
    context.insert(MoodEntry(mood: mood))
    do {
      try context.save()
      dismiss()
    }
    catch {
      print("Error saving new location item: \(error.localizedDescription)")
    }
  }
  
  var body: some View {
    VStack {
      ZStack {
        RoundedRectangle(cornerRadius: 10)
          .fill(mood.getColor())
        
        VStack {
          Text(mood.getEmoji())
            .font(.largeTitle)
          
          Text(mood.rawValue)
        }
        .padding()
      }
      
      Button("Confirm") {
        saveMood(mood)
        dismiss()
      }
      .tint(.green)
    }
  }
}


// Previews
#Preview {
  PickListScreen()
}

#Preview {
  ConfirmMoodScreen(mood: .happy)
}

#Preview {
  ConfirmMoodScreen(mood: .angry)
}


