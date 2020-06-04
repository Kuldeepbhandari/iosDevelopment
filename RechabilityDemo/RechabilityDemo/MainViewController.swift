//
//  MainViewController.swift
//  RechabilityDemo
//
//  Created by mac on 30/05/20.
//  Copyright © 2020 KuldeepBhandari. All rights reserved.
//

import UIKit
import Alamofire

struct RedditPost {
    let title:String!
    let subreddit:String!
}

class MainViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var post = [RedditPost]()
    var posttitle : String = ""
    var subreddit : String = ""
    let network  = NetworkManager.instance
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Latest Post"
        
        // Do any additional setup after loading the view.
    }
    

    private func fetchPost(completion:@escaping(_ posts : [RedditPost]) -> Void) -> Void{
     //   post.append(RedditPost(title: post["title"] as! String,subreddit: "/r/" + (post["subreddit"] as! String)))
      //  let title = (post["title"] as! String)
        
        for child in 0...children.count-1{
            let post = children[child]["data"] as! [String:AnyObject]
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
