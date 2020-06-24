//
//  ViewController.swift
//  MusicPlayerTest
//
//  Created by mac on 21/06/20.
//  Copyright © 2020 KuldeepBhandari. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var songs = [Song]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        songs.append(Song(name: "Background music", artistName: "Rnado", imageName: "cover1", albumName: "123 others", trackName: "song1"))
        songs.append(Song(name: "Havana", artistName: "Camilla cabello", imageName: "cover2", albumName: "Havana album", trackName: "song2"))
        songs.append(Song(name: "viva la vida", artistName: "Coldplay", imageName: "cover3", albumName: "123 something", trackName: "song3"))
        songs.append(Song(name: "Background music", artistName: "Rnado", imageName: "cover1", albumName: "123 others", trackName: "song1"))
        songs.append(Song(name: "Havana", artistName: "Camilla cabello", imageName: "cover2", albumName: "Havana album", trackName: "song2"))
        songs.append(Song(name: "viva la vida", artistName: "Coldplay", imageName: "cover3", albumName: "123 something", trackName: "song3"))
        songs.append(Song(name: "Background music", artistName: "Rnado", imageName: "cover1", albumName: "123 others", trackName: "song1"))
        songs.append(Song(name: "Havana", artistName: "Camilla cabello", imageName: "cover2", albumName: "Havana album", trackName: "song2"))
        songs.append(Song(name: "viva la vida", artistName: "Coldplay", imageName: "cover3", albumName: "123 something", trackName: "song3"))
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension ViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") else {return UITableViewCell()}
        let song = songs[indexPath.row]
        cell.textLabel?.text = song.name
        cell.detailTextLabel?.text = song.albumName
        cell.textLabel?.font = UIFont(name: "Helvetica-Bold", size: 18)
        cell.detailTextLabel?.font = UIFont(name: "Helvetica", size: 18)
        cell.imageView?.image = UIImage(named: song.imageName)
        cell.imageView?.layer.cornerRadius = 10
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let position = indexPath.row
        guard let vc = storyboard?.instantiateViewController(identifier: "AudioVC") as? AudioVC else {return}
        vc.postion = position
        vc.songs = songs
        self.present(vc, animated: true, completion: nil)
    }
    
}

struct Song {
    let name:String
    let artistName:String
    let imageName:String
    let albumName:String
    let trackName:String
    
}
