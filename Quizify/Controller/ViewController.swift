//
//  ViewController.swift
//  Quizify
//
//  Created by Sedef Bozkurt on 4.11.2024.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var choice1: UIButton!
    @IBOutlet weak var choice2: UIButton!
    @IBOutlet weak var choice3: UIButton!
    @IBOutlet weak var choice4: UIButton!
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    func updateUI() {
        questionLabel.text = quizBrain.getQuestionText()
        
        let choices = quizBrain.getChoices()
        choice1.setTitle(choices[0], for: .normal)
        choice2.setTitle(choices[1], for: .normal)
        choice3.setTitle(choices[2], for: .normal)
        choice4.setTitle(choices[3], for: .normal)
        
        scoreLabel.text = "Skor: \(quizBrain.score)"
    }
}

