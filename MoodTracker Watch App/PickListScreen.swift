import SwiftUI

struct PickListScreen: View {
  @State var showConfirmationSheet = false
  
  var body: some View {
    NavigationStack {
      List {
        NavigationLink {
          Text("Show History")
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
fileprivate struct MoodRowView: View {
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
        //Confirm
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


