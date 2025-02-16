import Foundation

struct Question: Identifiable {
    let id: Int
    let question: String
    let correctAnswer: String
    let wrongAnswer: String
}
