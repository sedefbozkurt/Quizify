//
//  ResultViewController.swift
//  Quizify
//
//  Created by Sedef Bozkurt on 11.11.2024.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var feedbackLabel: UILabel!
    
    var quizBrain: QuizBrain?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateResultUI()
    }
    // 2. Add dynamic score and feedback messages to ResultViewController
    func updateResultUI() {
        guard let quizBrain = quizBrain else { return }
        
        scoreLabel.text = "\(quizBrain.score)/\(quizBrain.totalQuestions)"
        feedbackLabel.text = quizBrain.getFeedbackMessage()
    }

    // 3. Implement restart button functionality in ResultViewController
    @IBAction func restartButtonPressed(_ sender: UIButton) {
        quizBrain?.resetGame()
        dismiss(animated: true, completion: nil)
    }
}
