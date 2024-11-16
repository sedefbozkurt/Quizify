//
//  ResultViewController.swift
//  Quizify
//
//  Created by Sedef Bozkurt on 11.11.2024.
//

import UIKit

protocol ResultViewControllerDelegate {
    func didRestartQuiz()
}

class ResultViewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var feedbackLabel: UILabel!
    
    var quizBrain: QuizBrain?
    var delegate: ResultViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateResultUI()
    }

    func updateResultUI() {
        guard let quizBrain = quizBrain else { return }
        
        let feedback = quizBrain.getFeedback()
        scoreLabel.text = "\(quizBrain.score)/\(quizBrain.totalQuestions)"
        feedbackLabel.text = feedback.message
        view.backgroundColor = feedback.color
    }

    @IBAction func restartButtonPressed(_ sender: UIButton) {
        quizBrain?.resetGame()
        delegate?.didRestartQuiz()
        dismiss(animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.quizBrain = quizBrain
        }
    }
}
