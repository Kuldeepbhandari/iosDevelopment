//
//  ViewController.swift
//  DemoDatePickerUsingTextFiled
//
//  Created by mac on 10/02/20.
//  Copyright © 2020 mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var selectGender: UITextField!
    @IBOutlet weak var datePicker: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        datePicker.delegate = self
        
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.datePicker = textField
        //Create
        let picker = UIDatePicker()
        picker.datePickerMode = .date
        picker.addTarget(self, action: #selector(updateDateField(sender:)), for: .valueChanged)
        textField.inputView = picker
        textField.text = formatDateDisplay(date:picker.date)
        
    }
    

    @objc func updateDateField(sender:UIDatePicker){
        datePicker.text = formatDateDisplay(date:sender.date)
    }
    
    func formatDateDisplay(date:Date) -> String{
        let formate = DateFormatter()
        formate.dateFormat = "dd MM YYYY"
        return formate.string(from: date)
    }
}

