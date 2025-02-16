import Foundation

class QuestionViewModel: ObservableObject {
    @Published var questions : [Question] = []
    @Published var score: Int = 0
    @Published var index: Int = 0
    
    init() {
        for i in 0..<10 {
            questions.append(Question(id: i, question: "question \(i)", correctAnswer: "correct answer", wrongAnswer: "wrong answer"))
        }
    }
    
    func checkAnswer(answer: String) {
        if answer == questions[index].correctAnswer {
            score += 10
        }
    }
    
    func updateIndex() {
        index += 1
    }
    
    func startNewGame() {
        index = 0
        score = 0
    }
}