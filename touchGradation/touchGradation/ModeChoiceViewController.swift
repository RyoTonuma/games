//
//  ModeChoiceViewController.swift
//  touchGradation
//
//  Created by Ryo on 2015/04/16.
//  Copyright (c) 2015年 Ryo. All rights reserved.
//

import UIKit

class ModeChoiceViewController: UIViewController {
    
    var easyButton: UIButton = UIButton()
    var normalButton: UIButton = UIButton()
    var hardButton: UIButton = UIButton()
    var scoreButton: UIButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.whiteColor()
        
        let userDefaults = NSUserDefaults.standardUserDefaults()
        

        if userDefaults.stringForKey("easyScore") == nil {
            userDefaults.setObject(0, forKey: "easyScore")
        }
        if userDefaults.stringForKey("normalScore") == nil {
            userDefaults.setObject(0, forKey: "normalScore")
        }
        if userDefaults.stringForKey("hardScore") == nil {
            userDefaults.setObject(0, forKey: "hardScore")
        }
        if userDefaults.stringForKey("extraScore") == nil {
            userDefaults.setObject(0, forKey: "extraScore")
        }
        
        // ボタンの生成
        easyButton = UIButton(frame: CGRectMake(0,0,self.view.frame.width/2,100))
        easyButton.setTitle("Easy", forState: .Normal)
        easyButton.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        easyButton.backgroundColor = UIColor(red:0,green:0,blue:1,alpha:0.2)
        easyButton.layer.cornerRadius = 20.0
        easyButton.layer.position = CGPoint(x: self.view.frame.width/2 , y:self.view.frame.height/2 - 150)
        easyButton.addTarget(self, action: "onClickMyButton:", forControlEvents: .TouchUpInside)
        easyButton.tag = 1
        
        normalButton = UIButton(frame: CGRectMake(0,0,self.view.frame.width/2,100))
        normalButton.setTitle("Normal", forState: .Normal)
        normalButton.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        normalButton.backgroundColor = UIColor(red:0,green:1,blue:0,alpha:0.2)
        normalButton.layer.cornerRadius = 20.0
        normalButton.layer.position = CGPoint(x: self.view.frame.width/2 , y:self.view.frame.height/2)
        normalButton.addTarget(self, action: "onClickMyButton:", forControlEvents: .TouchUpInside)
        normalButton.tag = 2
        
        hardButton = UIButton(frame: CGRectMake(0,0,self.view.frame.width/2,100))
        hardButton.setTitle("Hard", forState: .Normal)
        hardButton.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        hardButton.backgroundColor = UIColor(red:1,green:0,blue:0,alpha:0.2)
        hardButton.layer.cornerRadius = 20.0
        hardButton.layer.position = CGPoint(x: self.view.frame.width/2 , y:self.view.frame.height/2 + 150)
        hardButton.addTarget(self, action: "onClickMyButton:", forControlEvents: .TouchUpInside)
        hardButton.tag = 3
        
        scoreButton = UIButton(frame: CGRectMake(0,0,self.view.frame.width*3/8,50))
        scoreButton.setTitle("High Score", forState: .Normal)
        scoreButton.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        scoreButton.backgroundColor = UIColor.blackColor()
        scoreButton.layer.cornerRadius = 20.0
        scoreButton.layer.position = CGPoint(x: self.view.frame.width*5/8 , y:self.view.frame.height/2 - 250)
        scoreButton.addTarget(self, action: "onClickMyButton:", forControlEvents: .TouchUpInside)
        scoreButton.tag = 0
        
        // ボタンを追加
        self.view.addSubview(easyButton)
        self.view.addSubview(normalButton)
        self.view.addSubview(hardButton)
        self.view.addSubview(scoreButton)
        
    }
    
    //
    // ボタンイベント
    //
    func onClickMyButton(sender: UIButton){
        
        var appDelegate:AppDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        
        switch sender.tag {
        case 0:
            let myScoreViewController: UIViewController = ScoreViewController()
            self.presentViewController(myScoreViewController, animated: false, completion: nil)
        default:
            let myStartViewController: UIViewController = CountDownViewController()
            appDelegate.modeNum = sender.tag
            self.presentViewController(myStartViewController, animated: false, completion: nil)
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
