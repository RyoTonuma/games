//
//  CountDownViewController.swift
//  touchGradation
//
//  Created by Ryo on 2015/04/23.
//  Copyright (c) 2015年 Ryo. All rights reserved.
//

import UIKit

class CountDownViewController: UIViewController {
    
    var timeLabel: UILabel = UILabel()
    var timeNum: Int = 300
    var timer:NSTimer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.whiteColor()
        
        timeLabel.text = "\(Int(timeNum + 1))"
        timeLabel.frame = CGRectMake(0, 0, self.view.frame.width/2, self.view.frame.height/2)
        timeLabel.layer.position = CGPoint(x:self.view.frame.width/2, y:self.view.frame.height/2)
        timeLabel.textAlignment = NSTextAlignment.Center
        timeLabel.backgroundColor = UIColor.whiteColor()
        
        self.view.addSubview(timeLabel)
        
        timer = NSTimer.scheduledTimerWithTimeInterval(0.01, target: self, selector: "onUpdate:", userInfo: nil, repeats: true)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func onUpdate(timer : NSTimer){
        
        
        
        if timeNum == 0 {
            
            timer.invalidate()
            
            var appDelegate:AppDelegate = UIApplication.sharedApplication().delegate as AppDelegate

            var myNextViewController: UIViewController!
            
            switch appDelegate.modeNum {
            case 1:
                myNextViewController = EasyViewController()
            case 2:
                myNextViewController = NormalViewController()
            case 3:
                myNextViewController = HardViewController()
            case 4:
                myNextViewController = ExtraViewController()
            default:
                println("error")
                
            }
            
            // Viewの移動.
            self.presentViewController(myNextViewController, animated: false, completion: nil)
        }
        
        else{
            timeNum -= 1
            timeLabel.text = "\(Int(Float(timeNum)/100 + 1))"
        }
    }
}
