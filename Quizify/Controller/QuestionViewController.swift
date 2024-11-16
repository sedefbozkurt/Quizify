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
        questionLabel.text = quizBrain.currentQuestion.text
        scoreLabel.text = "Skor: \(quizBrain.score)"
        progressBar.progress = quizBrain.getProgress()
        
        let choices = quizBrain.getChoices()
        choice1.setTitle(choices[0], for: .normal)
        choice2.setTitle(choices[1], for: .normal)
        choice3.setTitle(choices[2], for: .normal)
        choice4.setTitle(choices[3], for: .normal)
    }
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        guard let userAnswer = sender.currentTitle else { return }
        let isCorrect = quizBrain.checkAnswer(userAnswer)
        
        sender.backgroundColor = isCorrect ? .green: .red
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            if self.quizBrain.hasMoreQuestions {
                self.quizBrain.nextQuestion()
                self.updateUI()
                sender.backgroundColor = .clear
            } else {
                self.performSegue(withIdentifier: "goToResult", sender: self)
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.quizBrain = self.quizBrain
        }
    }
}

