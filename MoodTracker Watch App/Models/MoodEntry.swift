import Foundation
import SwiftData

@Model
class MoodEntry {
  var mood: Mood
  var timestamp: Date = Date()
  
  init(mood: Mood) {
    self.mood = mood
  }
}
