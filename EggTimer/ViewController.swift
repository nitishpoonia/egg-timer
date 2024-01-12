//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let eggTimes = ["Soft": 3, "Medium": 4, "Hard": 7]
    var secondsPassed = 0
    var totalTime = 0
    
    var timer = Timer()
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        timer.invalidate()
        progressBar.progress = 0.0
        secondsPassed = 0
        
        let hardness = sender.currentTitle!
        let result = eggTimes[hardness]!
        eggResult.text = hardness
        totalTime = eggTimes[hardness]!
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        
    }
    
//    IBOutlets
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var eggResult: UILabel!
    
//    Update Timer
    @objc func updateTimer(){
        if secondsPassed < totalTime {
            secondsPassed += 1
            let progressPercentage: Float = Float(secondsPassed) / Float(totalTime)
            
            progressBar.progress = Float(progressPercentage)
            
        } else {
            timer.invalidate()
            eggResult.text = "Done"
        }
    }
    
}
