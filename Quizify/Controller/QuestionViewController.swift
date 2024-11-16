//
//  ViewController.swift
//  Quizify
//
//  Created by Sedef Bozkurt on 4.11.2024.
//

import UIKit

class QuestionViewController: UIViewController {
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
    
    @objc func updateUI() {
        questionLabel.text = quizBrain.getQuestionText()
        let choices = quizBrain.getChoices()
        choice1.setTitle(choices[0], for: .normal)
        choice2.setTitle(choices[1], for: .normal)
        choice3.setTitle(choices[2], for: .normal)
        choice4.setTitle(choices[3], for: .normal)
        
        scoreLabel.text = "Skor: \(quizBrain.score)"
        
        progressBar.progress = quizBrain.getProgress()
    }
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle!
        let isCorrect = quizBrain.checkAnswer(userAnswer)
        
        if isCorrect {
            sender.backgroundColor = .green
        } else {
            sender.backgroundColor = .red
        }
        
        Timer.scheduledTimer(withTimeInterval: 0.3, repeats: false) { _ in
            self.quizBrain.nextQuestion()
            self.updateUI()
            sender.backgroundColor = .clear
            
            if self.quizBrain.hasMoreQuestions {
                self.quizBrain.nextQuestion()
                self.updateUI()
            } else {
                self.performSegue(withIdentifier: "goToResult", sender: self)
            }        }
    }
    
    // 4. Transition to result screen when quiz are finished
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.quizBrain = self.quizBrain
        }
    }
}

