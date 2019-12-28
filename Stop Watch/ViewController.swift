//
//  ViewController.swift
//  Stop Watch
//
//  Created by Erin Beachkofski on 12/27/19.
//  Copyright © 2019 Erin Beachkofski. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var time = 0.0
    var timer = Timer()
    var isPlaying = false

    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        timerLabel.text = String(time)
        stopButton.isEnabled = false
        stopButton.alpha = 0.5
        resetButton.isEnabled = false
        resetButton.alpha = 0.5
        
    }

    @IBAction func startTimer(_ sender: Any) {
        startButton.isEnabled = false
        startButton.alpha = 0.5
        stopButton.isEnabled = true
        stopButton.alpha = 1
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    @IBAction func stopTimer(_ sender: Any) {
        startButton.isEnabled = true
        startButton.alpha = 1
        stopButton.isEnabled = false
        stopButton.alpha = 0.5
        resetButton.isEnabled = true
        resetButton.alpha = 1
        timer.invalidate()
    }
    
    @IBAction func resetTimer(_ sender: Any) {
        startButton.isEnabled = true
        startButton.alpha = 1
        stopButton.isEnabled = false
        stopButton.alpha = 0.5
        resetButton.isEnabled = false
        resetButton.alpha = 0.5
        timer.invalidate()
        time = 0.0
        timerLabel.text = String(time)
    }
    
    @objc func updateTimer() {
        time = time + 0.1
        timerLabel.text = String(format: "%.1f", time)
    }

}

