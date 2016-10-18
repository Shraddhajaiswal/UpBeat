//
//  ViewController.swift
//  UpBeat
//
//  Created by Macos on 18/10/16.
//  Copyright © 2016 shraddha work station. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation



class SignInVC: UIViewController {
    
    
    @IBOutlet weak var logo: UILabel!
    
    var player: AVPlayer?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let vedioURL: URL = Bundle.main.url(forResource: "video", withExtension: "mp4")!
        view.backgroundColor = UIColor(white: 0.0,alpha: 0.0)
     
        
        
       
        player = AVPlayer(url: vedioURL)
        player?.actionAtItemEnd = .none
        player?.isMuted = true
        
        let playerLayer = AVPlayerLayer(player: player)
        playerLayer.videoGravity = AVLayerVideoGravityResizeAspectFill
        playerLayer.zPosition = -1
        
        playerLayer.frame = view.frame
        
        view.layer.addSublayer(playerLayer)
        
        player?.play()
        
        //loop video
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(SignInVC.loopVideo),
                                               name: NSNotification.Name.AVPlayerItemDidPlayToEndTime,
                                               object: nil)
    }
    
    func loopVideo() {
        player?.seek(to: kCMTimeZero)
        player?.play()
    }
    

        
    }




