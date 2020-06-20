//
//  Model.swift
//  QuizApplication
//
//  Created by mac on 24/04/20.
//  Copyright © 2020 KuldeepBhandari. All rights reserved.
//

import Foundation
import UIKit

struct QuizQuestion {
    var coorectAnswer:Bool
    var question:String
    var image:UIImage
}



class Quiz {
    
    
   private var questions: [QuizQuestion] = [
        QuizQuestion(coorectAnswer: true, question: "Is this is a tree", image: UIImage(named: "tree")!),
        QuizQuestion(coorectAnswer: false, question: "is this is a dog", image: UIImage(named: "car")!),
        QuizQuestion(coorectAnswer: false, question: "Is this a person", image: UIImage(named: "mug")!)
    ]
    
    
    private var score : Int = 0
    
    private var questionIndex : Int = 0
    
//    MARK:This function is used to get score
    func getScore() -> String{
        return "\(score) \\ \(questions.count)"
    }
//    MARK:this function is used to get current questions
    func getQuesttion() -> QuizQuestion{
        return questions[questionIndex]
    }
    
//    MARK:this function is used to check answer
    func check(answer:Bool) -> Bool{
        let question = getQuesttion()
        if question.coorectAnswer == answer{
            score += 1
            return true
        }
        return false
    }
    
//    MARK:This function is used to next quetion
    func nextQuestions() -> Bool{
        questionIndex += 1
        if questionIndex > questions.count-1{
            return false
        }
        return true
    }
//    MARK:this function is used to reset the questions
    func reset(){
        questionIndex = 0
        score = 0
    }
    
}
