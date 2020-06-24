//
//  ViewController.swift
//  GuessWord
//
//  Created by mac on 23/06/20.
//  Copyright © 2020 KuldeepBhandari. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDelegateFlowLayout {

    
    var clauseLabel:UILabel!
    var answerLabel:UILabel!
    var currentAnswer:UITextField!
    var scoreLbl:UILabel!
    var letterButtons = [UIButton]()
    
    override func loadView() {
        view = UIView()
        view.backgroundColor = .white
        
        scoreLbl = UILabel()
        scoreLbl.translatesAutoresizingMaskIntoConstraints = false
        scoreLbl.textAlignment = .right
        scoreLbl.text = "Score : 0"
        view.addSubview(scoreLbl)
        
        clauseLabel = UILabel()
        clauseLabel.translatesAutoresizingMaskIntoConstraints = false
        clauseLabel.font = UIFont.systemFont(ofSize: 24)
        clauseLabel.text = "CLUES"
        clauseLabel.numberOfLines = 0
        clauseLabel.setContentHuggingPriority(UILayoutPriority(1), for: .vertical)

        view.addSubview(clauseLabel)
        
        answerLabel = UILabel()
        answerLabel.translatesAutoresizingMaskIntoConstraints = false
        answerLabel.font = UIFont.systemFont(ofSize: 24)
        answerLabel.text = "ANSWER"
        answerLabel.numberOfLines = 0
        answerLabel.textAlignment = .right
        answerLabel.setContentHuggingPriority(UILayoutPriority(1), for: .vertical)

        view.addSubview(answerLabel)
        
        
        currentAnswer = UITextField()
        currentAnswer.translatesAutoresizingMaskIntoConstraints = false
        currentAnswer.placeholder = "Tap letters to guess"
        currentAnswer.textAlignment = .center
        currentAnswer.font = UIFont.systemFont(ofSize: 30)
        currentAnswer.isUserInteractionEnabled = false
        view.addSubview(currentAnswer)
        
//         Add buttons
        let submit = UIButton(type: .system)
        submit.translatesAutoresizingMaskIntoConstraints = false
        submit.setTitle("SUBMIT", for: .normal)
        view.addSubview(submit)
        
        let clear = UIButton(type: .system)
        clear.translatesAutoresizingMaskIntoConstraints = false
        clear.setTitle("CLEAR", for: .normal)
        view.addSubview(clear)
        
        
        let buttonsView = UIView()
        buttonsView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(buttonsView)
        
        NSLayoutConstraint.activate([
            scoreLbl.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor,constant: 20),
            scoreLbl.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor,constant: 0),
            clauseLabel.topAnchor.constraint(equalTo: scoreLbl.bottomAnchor,constant: 10),
            clauseLabel.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor,constant: 40),
            clauseLabel.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor, multiplier: 0.5, constant: -40),
            answerLabel.topAnchor.constraint(equalTo: scoreLbl.bottomAnchor,constant: 10),
            answerLabel.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor,constant:-40),
            answerLabel.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor, multiplier: 0.5, constant: -40),
            answerLabel.heightAnchor.constraint(equalTo: clauseLabel.heightAnchor),
            currentAnswer.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            currentAnswer.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
            currentAnswer.topAnchor.constraint(equalTo: clauseLabel.bottomAnchor, constant: 20),
            
            submit.topAnchor.constraint(equalTo: currentAnswer.bottomAnchor),
            submit.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -100),
            submit.heightAnchor.constraint(equalToConstant: 44),

            clear.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 100),
            clear.centerYAnchor.constraint(equalTo: submit.centerYAnchor),
            clear.heightAnchor.constraint(equalToConstant: 44),
            buttonsView.widthAnchor.constraint(equalToConstant: 750),
            buttonsView.heightAnchor.constraint(equalToConstant: 320),
            buttonsView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonsView.topAnchor.constraint(equalTo: submit.bottomAnchor, constant: 20),
            buttonsView.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor, constant: -20),
            
        ])
       // clauseLabel.backgroundColor = .red
        //answerLabel.backgroundColor = .blue
       // buttonsView.backgroundColor = .green
        
        let width = 150
        let height = 80
//        Create 20 button
        
        for row in 0..<4{
            for col in 0..<5{
                var count = 0
                let letterButton = UIButton(type: .system)
                letterButton.titleLabel?.font = UIFont.systemFont(ofSize: 20)
                letterButton.setTitle("WWW", for: .normal)
                letterButton.backgroundColor = .red
                
                let frame = CGRect(x: col * width, y: row * height, width: width, height: height)
                print(frame)
                letterButton.frame = frame
                buttonsView.addSubview(letterButton)
                count += 1
                letterButtons.append(letterButton)
                print(letterButtons.count)
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

