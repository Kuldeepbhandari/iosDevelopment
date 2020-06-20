//
//  ViewController.swift
//  QuizApplication
//
//  Created by mac on 24/04/20.
//  Copyright © 2020 KuldeepBhandari. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var questionLbl: UILabel!
    @IBOutlet weak var questionImage: UIImageView!
    
    let quiz = Quiz()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpQuestion()
     }
    
    func setUpQuestion(){
        let currentQuestion = quiz.getQuesttion()
        questionImage.image = currentQuestion.image
        questionLbl.text = currentQuestion.question
        
    }
    
    @IBAction func trueBtnWasTapped(_ sender: Any) {
        let result = quiz.check(answer: true)
        showResult(isCorrect: result)
    }
    
    @IBAction func falseBtnWasTapped(_ sender: UIButton) {
        
        let result = quiz.check(answer: false)
        showResult(isCorrect: result)
    }
    
    
    func showResult(isCorrect correct:Bool){
        let title = correct ? "Correct" : "Incorrect"
        
        let message = correct ? "You got the right answer" : "You got the wrong answer"
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let nextQuestionAction = UIAlertAction(title: "Next Questions", style: .default) { (action) in
            if self.quiz.nextQuestions(){
                self.setUpQuestion()
                alert.dismiss(animated: true, completion: nil)
            }else{
                alert.dismiss(animated: true, completion: nil)
                self.showFinalScore()
            }
        }
        
        alert.addAction(nextQuestionAction)
        present(alert, animated: true, completion: nil)
    }
    
    
    func showFinalScore(){
        let alert = UIAlertController(title: "Final Score", message: quiz.getScore(), preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "Ok", style: .default) { (action) in
            self.quiz.reset()
            self.setUpQuestion()
            alert.dismiss(animated: true, completion: nil)
        }
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
}

