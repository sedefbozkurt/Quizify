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
    
    let questions = [
        Question(questionText: "Rönesans'ın en önemli sanatçılarından biri kimdir?", choices: ["Rembrandt", "Leonardo da Vinci", "Van Gogh", "Picasso"], correctAnswer: "Leonardo da Vinci"),
        Question(questionText: "Fransız Devrimi hangi yüzyılda yaşanmıştır?", choices: ["17. yüzyıl", "18. yüzyıl", "19. yüzyıl", "20. yüzyıl"], correctAnswer: "18. yüzyıl"),
        Question(questionText: "Dünyanın en büyük okyanusu hangisidir?", choices: ["Atlantik Okyanusu", "Pasifik Okyanusu", "Hint Okyanusu", "Arktik Okyanusu"], correctAnswer: "Pasifik Okyanusu"),
        Question(questionText: "Türkiye'nin en büyük gölü hangisidir?", choices: ["Tuz Gölü", "Beyşehir Gölü", "Van Gölü", "Eğirdir Gölü"], correctAnswer: "Van Gölü"),
        Question(questionText: "Beatles grubunun en ünlü şarkılarından biri hangisidir?", choices: ["Bohemian Rhapsody", "Imagine", "Stairway to Heaven", "Yesterday"], correctAnswer: "Yesterday"),
        Question(questionText: "Graffiti sanatının kökenleri hangi ülkeye dayanır?", choices: ["İngiltere", "Fransa", "ABD", "Japonya"], correctAnswer: "ABD"),
        Question(questionText: "Güneş sistemindeki en büyük gezegen hangisidir?", choices: ["Satürn", "Neptün", "Jupiter", "Uranüs"], correctAnswer: "Jupiter"),
        Question(questionText: "DNA'nın yapısını keşfeden bilim insanları kimlerdir?", choices: ["Marie Curie ve Albert Einstein", "James Watson ve Francis Crick", "Isaac Newton ve Galileo Galilei", "Charles Darwin ve Gregor Mendel"], correctAnswer: "James Watson ve Francis Crick")
    ]
    
    func getQuestionText() -> String {
        return questions[questionIndex].questionText
    }
    
    func getChoices() -> [String] {
        return questions[questionIndex].choices
    }
    
    mutating func checkAnswer(_ userAnswer: String) -> Bool {
        if userAnswer == questions[questionIndex].correctAnswer {
            score += 1
            return true
        } else {
            return false
        }
    }
    
    mutating func nextQuestion() {
        if questionIndex + 1 < questions.count {
            questionIndex += 1
        } else {
            questionIndex = 0
            score = 0
        }
    }
    
    func getScore() -> Int {
        return score
    }
}
