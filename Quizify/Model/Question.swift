//
//  Question.swift
//  Quizify
//
//  Created by Sedef Bozkurt on 6.11.2024.
//

import Foundation

struct Question {
    let questionText: String
    let choices: [String]
    let correctAnswer: String
    
    init(questionText: String, choices: [String], correctAnswer: String) {
        self.questionText = questionText
        self.choices = choices
        self.correctAnswer = correctAnswer
    }
}
