//
//  AnswerCell.swift
//  AppLumi
//
//  Created by appinventiv on 08/04/20.
//  Copyright © 2020 appinventiv. All rights reserved.
//

import UIKit
import Alamofire

class AnswerCell: UITableViewCell {

    @IBOutlet var answerStackView: UIStackView!
    @IBOutlet var viewAnswer: UIView!
    @IBOutlet var answerLabel: UILabel!
    @IBOutlet var btnStackView: UIStackView!
    @IBOutlet var answerBtn: UIButton!
    @IBOutlet var containerView: UIView!
    @IBOutlet var addBtn: UIButton!
    @IBOutlet var cancelBtn: UIButton!
    @IBOutlet var answerTextView: UITextView!
    @IBOutlet var lblQuestions: UILabel!
    @IBOutlet var stackView: UIView!
    
//    MARK: call back varibales
    var addBtnTapped:(()->())?
    var answerBtnTapped:(()->())?
    var cancelBtnTapped:(()->())?

    override func awakeFromNib() {
        super.awakeFromNib()
        btnStackView.isHidden = true
        answerLabel.isHidden = true
        viewAnswer.isHidden = true
        answerTextView.delegate = self
    }

    override func prepareForReuse() {
        super.prepareForReuse()
    }
   

    @IBAction func addBtnWasPressed(_ sender: UIButton) {
        addBtnTapped?()
        viewAnswer.backgroundColor = UIColor.clear
    }
    @IBAction func cancelBtnWasPressed(_ sender: UIButton) {
        cancelBtnTapped?()
    }

    @IBAction func answerBtnWasPressed(_ sender: UIButton) {
        answerBtnTapped?()        
    }
}

//TextView Delegate method

extension AnswerCell:UITextViewDelegate{
    func textViewDidBeginEditing(_ textView: UITextView) {
        textView.text = ""
    }
}
