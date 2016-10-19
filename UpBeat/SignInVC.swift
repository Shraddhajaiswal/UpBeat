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
import FBSDKLoginKit
import Firebase



class SignInVC: UIViewController {
    
    
    @IBOutlet weak var logo: UILabel!
    
    
    @IBOutlet weak var emailField: UITextField!
    
    @IBOutlet weak var passwrdField: UITextField!
    
    
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
    

    
    @IBAction func facebookBtnTapped(_ sender: AnyObject) {
        
        
        let facebookLogin = FBSDKLoginManager()
        facebookLogin.logIn(withReadPermissions: ["email"], from: self) { (result, error) in
            if error != nil {
                print("macos: unable to authenticate with facebook - \(error)")
            } else if result?.isCancelled == true {
                print("macos:user cancelled facebook authentication ")
            }
            else {
                print("macos: sucessfully authenticated with facebook")
                // firebse authentication 
                
                let credential = FIRFacebookAuthProvider.credential(withAccessToken: FBSDKAccessToken.current().tokenString)
                
                self.firebaseAuthentication(credential)
            }
        }
     
    }
    
    
    
    func firebaseAuthentication(_ credential: FIRAuthCredential) {
        
        FIRAuth.auth()?.signIn(with: credential, completion: { (user, error) in
        
            if error != nil {
                print("macos: unable to autheticate with Firebase - \(error)")
            }
            else {
                print("macos: Successfully authenticated with firebase ")
            }
        
        })
        
    }
    
    
    @IBAction func LoginTapped(_ sender: AnyObject) {
        
        //if let email = emailField.text, let pwd = passwrdField.text  where 
        
      // if let email = emailField.text , (((emailField.text?.isEmpty)) == nil), let pwd = passwrdField.text , (((passwrdField.text?.isEmpty)) == nil)
        
        if let email = emailField.text , email != "", let pwd = passwrdField.text , pwd != "" {
        
    
        
        
           
            FIRAuth.auth()?.signIn(withEmail: email, password: pwd, completion: { (user,error) in
                if error == nil {
                    print("shr: email user authenticated with firebase ")
                }
                else {
                    FIRAuth.auth()?.createUser(withEmail: email, password: pwd, completion: { (user,error) in
                        if error != nil {
                            print("shr: unable to authenticate with firebase using email ")
                        }
                        else {
                            print("sucessefully authenticated with firebase ")
                        }
                    })
                }
                
                
            })
        }
    }
}







