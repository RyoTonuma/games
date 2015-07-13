//
//  ViewController.swift
//  instantTimer
//
//  Created by Ryo on 2015/04/17.
//  Copyright (c) 2015年 Ryo. All rights reserved.
//

import UIKit
import AudioToolbox

class ViewController: UIViewController {

    var timer:NSTimer!
    
    var timeNum:Int = 500
    
    var timerNow:Bool = false
    
    let soundIdRing:SystemSoundID = 1005
    
    let timerLabel: UILabel = UILabel()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        AudioServicesPlaySystemSound(soundIdRing)
        println("a")
        
        timerLabel.text = "\(Int(timeNum + 1))"
        timerLabel.frame = CGRectMake(0, 0, self.view.frame.width/2, 70)
        timerLabel.layer.position = CGPoint(x:self.view.frame.width/2, y:self.view.frame.height/2)
        timerLabel.textAlignment = NSTextAlignment.Center
        timerLabel.layer.masksToBounds = true
        timerLabel.backgroundColor = UIColor.whiteColor()
        timerLabel.layer.cornerRadius = 10.0
        
        self.view.addSubview(timerLabel)
        
        timer = NSTimer.scheduledTimerWithTimeInterval(0.01, target: self, selector: "onUpdate:", userInfo: nil, repeats: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func onUpdate(timer : NSTimer){
        if timeNum > 0 {
            timeNum -= 1
            timerLabel.text = "\(Int(timeNum))"
        }
            
        if timeNum == 0 && !timerNow {
            AudioServicesPlaySystemSound(soundIdRing)
            timerNow = true
            println("b")
        }
        
    }
    
}

