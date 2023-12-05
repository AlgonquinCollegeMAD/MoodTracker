import SwiftUI
import SwiftData

@main
struct MoodTracker_Watch_AppApp: App {
  var body: some Scene {
    WindowGroup {
      PickListScreen()
    }
    .modelContainer(
      for: [
        MoodEntry.self
      ]
    )
  }
}
