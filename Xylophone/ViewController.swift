//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 28/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func keyPressed(_ sender: UIButton) {
//        print(sender.currentTitle as Any)
        playSound(soundName: sender.currentTitle ?? "C")
        sender.alpha = 0.5
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
       //This code brings sender's opacity back to fully opaque.
        /* for smooth transition*/    UIView.animate(withDuration: 0.3) {
                        sender.alpha = 1.0
                    }
      }
    }
    
    func playSound(soundName:String) {
        let url = Bundle.main.url(forResource: soundName, withExtension: "wav")
        print(url!)
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
                	
    }
}
