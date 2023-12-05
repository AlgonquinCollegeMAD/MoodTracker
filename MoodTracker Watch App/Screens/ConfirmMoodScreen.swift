import SwiftUI

struct ConfirmMoodScreen: View {
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
