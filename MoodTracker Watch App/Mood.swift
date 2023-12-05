import Foundation
import SwiftUI

enum Mood: String, CaseIterable {
  case happy = "Happy"
  case sad = "Sad"
  case angry = "Angry"
  case hopeful = "Hopeful"
  case confused = "Confused"
}

extension Mood {
  func getColor() -> Color {
    switch self {
    case .happy: return Color.blue
    case .sad: return Color.gray
    case .angry: return Color.red
    case .hopeful: return Color.green
    case .confused: return Color.purple
    }
  }
}

extension Mood {
  func getEmoji() -> String {
    switch self {
    case .happy: return "😁"
    case .sad: return "😥"
    case .angry: return "😡"
    case .hopeful: return "😙"
    case .confused: return "🤔"
    }
  }
}
