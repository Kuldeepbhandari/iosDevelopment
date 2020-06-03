//
//  ViewController.swift
//  Project2ABasicGame
//
//  Created by mac on 22/05/20.
//  Copyright © 2020 KuldeepBhandari. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button1: UIButton!
    
    var countries = [String]()
    var score = 0
    var coorectAnswer = 0
    var askedQuestion = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        countries.append("estonia")
//        countries.append("france")
//        countries.append("germany")
//        countries.append("ireland")
//        countries.append("italy")
//        countries.append("monaco")
//        countries.append("nigeria")
//        countries.append("poland")
//        countries.append("russia")
//        countries.append("spain")
//        countries.append("uk")
//        countries.append("us")
        
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        button1.layer.borderColor = UIColor.green.cgColor
        button2.layer.borderColor = UIColor.green.cgColor
        button3.layer.borderColor = UIColor.green.cgColor

        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        askQuestion()
        

    }

    func askQuestion(action:UIAlertAction! = nil){
        countries.shuffle() // to set the random image
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        coorectAnswer = Int.random(in: 0...2)
        title = countries[coorectAnswer].uppercased()

        askedQuestion += 1

        
    }
    
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        
        var title:String
        print(coorectAnswer)
        let flagName = countries[sender.tag]
        
        if sender.tag == coorectAnswer{
            title = "Correct"
            score += 1
        }else {
            title = "Wrong"
            let ac =  UIAlertController(title: title, message: "You guess the wrong flag  and the guess flag name is \(String(describing: flagName))" , preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "Ok", style: .default, handler: askQuestion))
            present(ac, animated: true, completion: nil)
            score -= 1
        }
        
        navigationItem.title = "The player Score is \(String(score))"
        let ac = UIAlertController(title: title, message: "The player Score is \(String(score))  -  \(askedQuestion) and the guess flag name is \(flagName)" , preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Continued", style: .default, handler: askQuestion))
        present(ac, animated: true, completion: nil)
    }
    
}

