//
//  ViewController.swift
//  Project1
//
//  Created by mac on 22/05/20.
//  Copyright © 2020 KuldeepBhandari. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    var pictures = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        navigationController?.navigationBar.prefersLargeTitles = true

        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath:path)
        
        for item in items{
            if item.hasPrefix("nssl"){
                pictures.append(item)
            }
            
        }
        print(pictures)
        title = "Strom Viewer"
        pictures.sort()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }

//    Dequeuing cells

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        cell.textLabel?.text = pictures[indexPath.row]
        return cell
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(identifier: "DetailViewController") as! DetailViewController
        vc.selectedImage = pictures[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
}

