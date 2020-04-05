//
//  EggTimerViewController.swift
//  EggTimer
//
//  Created by Lambda_School_loaner_226 on 4/2/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import UIKit

class EggTimerViewController: UIViewController {

    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    let eggTimes = ["Soft": 180, "Medium": 300, "Hard": 720]
    var timer = Timer()
    var totalTime = 0
    var secondsPassed = 0
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        timer.invalidate()
        let hardness = sender.currentTitle!
        totalTime = eggTimes[hardness]!
        progressBar.progress = 1.0
        statusLabel.text = hardness
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer() {
        if secondsPassed < totalTime {
            secondsPassed += 1
            progressBar.progress = Float(secondsPassed) / Float(totalTime)
            statusLabel.text = "\(secondsPassed) seconds have passed out of \(totalTime) seconds"
        } else {
            timer.invalidate()
            statusLabel.text = "Done!"
        }
    }
    
    
    
    
}
