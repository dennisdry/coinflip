//
//  ViewController.swift
//  Coin Toss
//
//  Created by Nagy Zsolt on 2017. 06. 09..
//  Copyright © 2017. Nagy Zsolt. All rights reserved.
//

import UIKit
import Device
import AVFoundation



class ViewController: UIViewController {
    
    @IBOutlet weak var introTopConstrain: NSLayoutConstraint!
    
    var randomFlip = 0
    var randomText = 0
    
    let spinnerGif = UIImage.gif(name: "spinner3")
    
    let intros = ["Decisions, decisions...", "Are You satisfied? Flip again if not.", "Hope You have an answer!"]
    let coins = ["coin_front", "coin_back"]
    
    var audioPlayer = AVAudioPlayer()
    
    
    @IBOutlet weak var introText: UILabel!
    @IBOutlet weak var coinImage: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        
        
    }

    @IBAction func flipButtonPressed(_ sender: Any) {
        
        flipCoin()
        
    }
    
    func flipCoin() {
        
        coinImage.image = spinnerGif
        
        //Sound.stopAll()
        //Sound.play(file: "flip.mp3")
        
        let soundUrl = Bundle.main.url(forResource: "flip", withExtension: "mp3")
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: soundUrl!)
        }
        catch {
            print(error)
        }
        
        audioPlayer.play()
        
        
        Timer.scheduledTimer(withTimeInterval: 1.6, repeats: false) { (timer) in
            
            self.randomFlip = Int(arc4random_uniform(2))
            self.randomText = Int(arc4random_uniform(2))
            
            self.coinImage.image = UIImage(named: self.coins[self.randomFlip])
            
            self.introText.text = self.intros[self.randomText]
            
            self.audioPlayer.stop()
            
        }
        
    }
    
    
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        
        flipCoin()
        
    }
    
    func screenSizeChange() {
        
        if Device.size() == Size.screen4Inch {
            introTopConstrain.constant = 20
        }
        
    }
    

}

