//
//  ViewController.swift
//  PostDemo
//
//  Created by mac on 22/03/20.
//  Copyright © 2020 KuldeepBhandari. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tFieldBody: UITextField!
    @IBOutlet weak var tFieldTitle: UITextField!
    @IBOutlet weak var tfUserId: UITextField!
    
    var stringArr = [String:Any]()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    @IBAction func tappedOnPost(_ sender: UIButton) {
        setUpPostMethod()
    }
    
    
    func setUpPostMethod(){
        guard let uId = tfUserId.text else {return}
        guard let title = tFieldTitle.text else {return}
        guard let body = tFieldBody.text else {return}
        
        let url = URL(string: "https://jsonplaceholder.typicode.com/posts/")
        var request = URLRequest(url: url!)
        request.httpMethod = "POST"
        let parameters: [String : Any] = [
            "userId": uId,
            "title": title,
            "body": body
        ]
        request.httpBody = parameters.percentEscaped().data(using: .utf8)
                //Create url session
                URLSession.shared.dataTask(with: request) { (data, response, error) in
                    guard let data = data else {
                        if error == nil{
                            print(error?.localizedDescription ?? "Unknown Error")
                        }
                        return
                    }
                    //reponse
                    if let response = response as? HTTPURLResponse{
                        guard (200 ... 299) ~= response.statusCode else {
                            print("Status code :- \(response.statusCode)")
                            print(response)
                            return
                        }
                    }
                    
                    do{
                        let json = try JSONSerialization.jsonObject(with: data, options: [])
                        print(json)
                        
                    }catch let error{
                        print(error.localizedDescription)
                    }
                }.resume()
    }
    
}


extension Dictionary {
    func percentEscaped() -> String {
        return map { (key, value) in
            let escapedKey = "\(key)".addingPercentEncoding(withAllowedCharacters: .urlQueryValueAllowed) ?? ""
            let escapedValue = "\(value)".addingPercentEncoding(withAllowedCharacters: .urlQueryValueAllowed) ?? ""
            return escapedKey + "=" + escapedValue
        }
        .joined(separator: "&")
    }
}

extension CharacterSet {
    static let urlQueryValueAllowed: CharacterSet = {
        let generalDelimitersToEncode = ":#[]@" // does not include "?" or "/" due to RFC 3986 - Section 3.4
        let subDelimitersToEncode = "!$&'()*+,;="
        var allowed = CharacterSet.urlQueryAllowed
        allowed.remove(charactersIn: "\(generalDelimitersToEncode)\(subDelimitersToEncode)")
        return allowed
    }()
}
