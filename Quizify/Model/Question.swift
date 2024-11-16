//
//  Question.swift
//  Quizify
//
//  Created by Sedef Bozkurt on 6.11.2024.
//

import Foundation

struct Question {
    let text: String
    let choices: [String]
    let correctAnswer: String
    
    init(text: String, choices: [String], correctAnswer: String) {
        self.text = text
        self.choices = choices
        self.correctAnswer = correctAnswer
    }
}
