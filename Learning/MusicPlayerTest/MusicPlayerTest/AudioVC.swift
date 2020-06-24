//
//  AudioVC.swift
//  MusicPlayerTest
//
//  Created by mac on 21/06/20.
//  Copyright © 2020 KuldeepBhandari. All rights reserved.
//

import UIKit
import AVFoundation

class AudioVC: UIViewController {
    
    @IBOutlet var holder:UIView!
    
    private let albumImageView:UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    private let songNameLbl:UILabel = {
           let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0
           return label
       }()
    private let songArtistLbl:UILabel = {
              let label = UILabel()
           label.textAlignment = .center
           label.numberOfLines = 0
              return label
          }()
    private let albumNameLbl:UILabel = {
              let label = UILabel()
           label.textAlignment = .center
           label.numberOfLines = 0
              return label
          }()
    public var postion = 0
       var songs : [Song] = []
       
       var player:AVAudioPlayer?
    let playPauseBtn = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        if holder.subviews.count == 0{
            configure()
        }
    }

    func configure(){
//        Setup player
        let song = songs[postion]
        let urlString = Bundle.main.path(forResource: song.trackName, ofType: "mp3")
        do{
            
            try AVAudioSession.sharedInstance().setMode(.default)
            try AVAudioSession.sharedInstance().setActive(true, options: .notifyOthersOnDeactivation)
            guard let urlString = urlString else {return}
            
            player = try AVAudioPlayer(contentsOf: URL(string: urlString)!)
            guard let player = player else {return}
            player.volume = 0.5
            player.play()
            
        }catch{
            print("Error occured")
        }
        
//        Setup ui elements
//        Album cover
        
        albumImageView.frame = CGRect(x: 10, y: 10, width: holder.frame.size.width-20, height: holder.frame.size.width-20)
        albumImageView.image = UIImage(named: song.imageName)
        holder.addSubview(albumImageView)
//        Configure label
        
        songNameLbl.frame = CGRect(x: 10, y: albumImageView.frame.size.height+10, width: holder.frame.size.width-20, height: 70)
        albumNameLbl.frame = CGRect(x: 10, y: albumImageView.frame.size.height+10+70, width: holder.frame.size.width-20, height: 70)
        songArtistLbl.frame = CGRect(x: 10, y: albumImageView.frame.size.height+10+140, width: holder.frame.size.width-20, height: 70)
        
        songNameLbl.text = song.name
        albumNameLbl.text = song.albumName
        songArtistLbl.text = song.artistName
        
        holder.addSubview(songNameLbl)
        holder.addSubview(albumNameLbl)
        holder.addSubview(songArtistLbl)
        
//        Configure volume slider
        
        let slider = UISlider(frame: CGRect(x: 20, y: holder.frame.size.height-60, width: holder.frame.size.width-40, height: 50))
        slider.value = 0.5
        slider.addTarget(self, action: #selector(sliderDidSlide(_:)), for: .valueChanged)
        holder.addSubview(slider)
        
        
//        Configure btn
        
        let nextBtn = UIButton()
        let backBtn = UIButton()
        
        //        BtnActions

        playPauseBtn.addTarget(self, action: #selector(didTapOnPlayPauseBtn), for: .touchUpInside)
        nextBtn.addTarget(self, action: #selector(didTapOnForwardBtn), for: .touchUpInside)
        backBtn.addTarget(self, action: #selector(didTapOnBackBtn), for: .touchUpInside)
        
//        frame
        var yPosition = songArtistLbl.frame.origin.y+70+20
        var size : CFloat = 80
        
//        playPauseBtn.frame = CGRect(x: (holder.frame.size.width - size) / 2.0,
//                                       y: yPosition,
//                                       width: size,
//                                       height: size)
//
//        nextBtn.frame = CGRect(x: 20, y: yPosition, width: size, height: size)
//
//        backBtn.frame = CGRect(x: 20,
//                                  y: yPosition,
//                                  width: size,
//                                  height: size)
        
        
        
        
//        Set images
        playPauseBtn.setBackgroundImage(UIImage(systemName: "pause.fill"), for: .normal)
        nextBtn.setBackgroundImage(UIImage(systemName: "forward.fill"), for: .normal)
        backBtn.setBackgroundImage(UIImage(systemName: "back.fill"), for: .normal)
        
        playPauseBtn.tintColor = .black
        nextBtn.tintColor = .black
        backBtn.tintColor = .black


        
        holder.addSubview(playPauseBtn)
        holder.addSubview(nextBtn)
        holder.addSubview(backBtn)


        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if let player = player{
            player.stop()
        }
    }
    
    @objc func sliderDidSlide(_ slider:UISlider){
        let value = slider.value
//        adjust player value
        player?.volume = value
        
    }
    
    @objc func didTapOnBackBtn(){
        
    }
    @objc func didTapOnPlayPauseBtn(){
        
    }
    @objc func didTapOnForwardBtn(){
        
    }
}
