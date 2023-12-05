import SwiftUI

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
