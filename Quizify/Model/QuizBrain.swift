//
//  QuizBrain.swift
//  Quizify
//
//  Created by Sedef Bozkurt on 6.11.2024.
//

import Foundation

struct QuizBrain {
    var questionIndex = 0
    var score = 0
    
    var totalQuestions: Int { questions.count }
    var currentQuestion: Question { questions[questionIndex] }
    
    let questions: [Question] = [
        Question(text: "Rönesans'ın en önemli sanatçılarından biri kimdir?", choices: ["Rembrandt", "Leonardo da Vinci", "Van Gogh", "Picasso"], correctAnswer: "Leonardo da Vinci"),
        Question(text: "Fransız Devrimi hangi yüzyılda yaşanmıştır?", choices: ["17. yüzyıl", "18. yüzyıl", "19. yüzyıl", "20. yüzyıl"], correctAnswer: "18. yüzyıl"),
        Question(text: "Dünyanın en büyük okyanusu hangisidir?", choices: ["Atlantik Okyanusu", "Pasifik Okyanusu", "Hint Okyanusu", "Arktik Okyanusu"], correctAnswer: "Pasifik Okyanusu"),
        Question(text: "Türkiye'nin en büyük gölü hangisidir?", choices: ["Tuz Gölü", "Beyşehir Gölü", "Van Gölü", "Eğirdir Gölü"], correctAnswer: "Van Gölü"),
        Question(text: "Beatles grubunun en ünlü şarkılarından biri hangisidir?", choices: ["Bohemian Rhapsody", "Imagine", "Stairway to Heaven", "Yesterday"], correctAnswer: "Yesterday"),
        Question(text: "Graffiti sanatının kökenleri hangi ülkeye dayanır?", choices: ["İngiltere", "Fransa", "ABD", "Japonya"], correctAnswer: "ABD"),
        Question(text: "Güneş sistemindeki en büyük gezegen hangisidir?", choices: ["Satürn", "Neptün", "Jupiter", "Uranüs"], correctAnswer: "Jupiter"),
        Question(text: "DNA'nın yapısını keşfeden bilim insanları kimlerdir?", choices: ["Marie Curie ve Albert Einstein", "James Watson ve Francis Crick", "Isaac Newton ve Galileo Galilei", "Charles Darwin ve Gregor Mendel"], correctAnswer: "James Watson ve Francis Crick")
    ]
    
    mutating func checkAnswer(_ userAnswer: String) -> Bool {
        let isCorrect = userAnswer == currentQuestion.correctAnswer
        if isCorrect { score += 1 }
        return isCorrect
    }
    
    mutating func nextQuestion() {
        if hasMoreQuestions {
            questionIndex += 1
        }
    }
    
    mutating func resetGame() {
        questionIndex = 0
        score = 0
    }
    
    func getQuestionText() -> String {
        return questions[questionIndex].text
    }
    
    func getFeedbackMessage() -> String {
        let ratio = Float(score) / Float(totalQuestions)
        
        switch ratio {
        case 0.8...1:
            return "BİLGİNİ KONUŞTURDUN!"
        case 0.5..<0.8:
            return "BİRAZ DAHA PRATİKLE ZİRVEYE ÇIKABİLRSİN!"
        default:
            return "DENEMEYE DEVAM ET!"
        }
    }

    func getProgress() -> Float {
        return Float(questionIndex + 1) / Float(totalQuestions)
    }
    
    var hasMoreQuestions: Bool {
        return questionIndex < questions.count - 1
    }
    
    func getChoices() -> [String] {
        return questions[questionIndex].choices
    }
    
//    func getScore() -> Int {
//        return score
//    }  
}
