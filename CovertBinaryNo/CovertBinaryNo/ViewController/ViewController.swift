//
//  ViewController.swift
//  CovertBinaryNo
//
//  Created by mac on 06/06/20.
//  Copyright © 2020 KuldeepBhandari. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var enterANoTextfield: UITextField!
    
    @IBOutlet weak var decimalBtn: UIButton!
    @IBOutlet weak var binaryBtn: UIButton!
    let placeholder = NSAttributedString(string: "Enter a value ...", attributes: [NSAttributedString.Key.foregroundColor:UIColor.white,NSAttributedString.Key.font:UIFont(name: "Menlo", size: 36.0)!])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        enterANoTextfield.attributedPlaceholder = placeholder
        enterANoTextfield.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
        disableBtn()
        
        let binDigit = BinaryDecimal(5)
        print(binDigit.calculateBinaryValueForInt())
    }
    
    @objc func textDidChange(){
        if enterANoTextfield.text == ""{
            disableBtn()
        }else{
            enabelBtn()
        }
    }

    func disableBtn(){
        decimalBtn.isEnabled = false
        decimalBtn.alpha = 0.5
        binaryBtn.isEnabled = false
        binaryBtn.alpha = 0.5
    }
    
    func enabelBtn(){
        decimalBtn.isEnabled = true
        decimalBtn.alpha = 1.0
        binaryBtn.isEnabled = true
        binaryBtn.alpha = 1.0
    }
    

    @IBAction func binaryBtnTapped(_ sender: Any) {
        
    }
    
    
    @IBAction func decimalBtnTapped(_ sender: Any) {
        
    }
}

