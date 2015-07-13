//
//  ScoreViewController.swift
//  touchGradation
//
//  Created by Ryo on 2015/04/17.
//  Copyright (c) 2015年 Ryo. All rights reserved.
//

import UIKit

class ScoreViewController: UIViewController {
    
    let userDefaults = NSUserDefaults.standardUserDefaults()
    var resetButton: UIButton = UIButton()
    let yesButton: UIButton = UIButton()
    let noButton: UIButton = UIButton()
    
    var backButton: UIButton = UIButton()
    var easyLabel: UILabel = UILabel()
    var normalLabel: UILabel = UILabel()
    var hardLabel: UILabel = UILabel()
    var extraLabel: UILabel = UILabel()
    var easyScoreLabel: UILabel = UILabel()
    var normalScoreLabel: UILabel = UILabel()
    var hardScoreLabel: UILabel = UILabel()
    var extraScoreLabel: UILabel = UILabel()
    let resetCoverLabel: UILabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.whiteColor()
        
        easyLabel = UILabel(frame: CGRectMake(0,0,self.view.frame.width/4,70))
        normalLabel = UILabel(frame: CGRectMake(0,0,self.view.frame.width/4,70))
        hardLabel = UILabel(frame: CGRectMake(0,0,self.view.frame.width/4,70))
        extraLabel = UILabel(frame: CGRectMake(0,0,self.view.frame.width/4,70))
        easyScoreLabel = UILabel(frame: CGRectMake(0,0,self.view.frame.width/4,70))
        normalScoreLabel = UILabel(frame: CGRectMake(0,0,self.view.frame.width/4,70))
        hardScoreLabel = UILabel(frame: CGRectMake(0,0,self.view.frame.width/4,70))
        extraScoreLabel = UILabel(frame: CGRectMake(0,0,self.view.frame.width/4,70))
        
        
        resetButton = UIButton(frame: CGRectMake(0,0,self.view.frame.width*3/8,50))
        resetButton.setTitle("Reset", forState: .Normal)
        resetButton.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        resetButton.backgroundColor = UIColor.blackColor()
        resetButton.layer.cornerRadius = 20.0
        resetButton.layer.position = CGPoint(x: self.view.frame.width/2 , y:self.view.frame.height/2 - 200)
        resetButton.addTarget(self, action: "onClickMyButton:", forControlEvents: .TouchUpInside)
        resetButton.tag = 0
        
        yesButton.frame = CGRectMake(0, 0, 150, 70)
        yesButton.layer.cornerRadius = 10.0
        yesButton.layer.position = CGPointMake(self.view.frame.width/2, self.view.frame.height/2 + 80)
        yesButton.setTitle("YES", forState: .Normal)
        yesButton.backgroundColor = UIColor.redColor()
        yesButton.tag = 1
        
        noButton.frame = CGRectMake(0, 0, 150, 70)
        noButton.layer.cornerRadius = 10.0
        noButton.layer.position = CGPointMake(self.view.frame.width/2, self.view.frame.height/2 + 160)
        noButton.setTitle("NO", forState: .Normal)
        noButton.backgroundColor = UIColor.blueColor()
        noButton.tag = 2
        
        yesButton.addTarget(self, action: "onClickMyButton:", forControlEvents: .TouchUpInside)
        noButton.addTarget(self, action: "onClickMyButton:", forControlEvents: .TouchUpInside)
        
        easyLabel.layer.position = CGPoint(x: self.view.frame.width*3/8,y: self.view.frame.height/2 - 105)
        normalLabel.layer.position = CGPoint(x: self.view.frame.width*3/8,y: self.view.frame.height/2 - 35)
        hardLabel.layer.position = CGPoint(x: self.view.frame.width*3/8,y: self.view.frame.height/2 + 35)
        extraLabel.layer.position = CGPoint(x: self.view.frame.width*3/8,y: self.view.frame.height/2 + 105)
        easyScoreLabel.layer.position = CGPoint(x: self.view.frame.width*5/8,y: self.view.frame.height/2 - 105)
        normalScoreLabel.layer.position = CGPoint(x: self.view.frame.width*5/8,y: self.view.frame.height/2 - 35)
        hardScoreLabel.layer.position = CGPoint(x: self.view.frame.width*5/8,y: self.view.frame.height/2 + 35)
        extraScoreLabel.layer.position = CGPoint(x: self.view.frame.width*5/8,y: self.view.frame.height/2 + 105)
        
        easyLabel.textColor = UIColor.blackColor()
        normalLabel.textColor = UIColor.blackColor()
        hardLabel.textColor = UIColor.blackColor()
        extraLabel.textColor = UIColor.blackColor()
        easyScoreLabel.textColor = UIColor.blackColor()
        normalScoreLabel.textColor = UIColor.blackColor()
        hardScoreLabel.textColor = UIColor.blackColor()
        extraScoreLabel.textColor = UIColor.blackColor()
        
        easyLabel.text = "Easy"
        normalLabel.text = "Normal"
        hardLabel.text = "Hard"
        extraLabel.text = "Extra"
        
        easyScoreLabel.text = userDefaults.stringForKey("easyScore")
        normalScoreLabel.text = userDefaults.stringForKey("normalScore")
        hardScoreLabel.text = userDefaults.stringForKey("hardScore")
        extraScoreLabel.text = userDefaults.stringForKey("extraScore")
        
        resetCoverLabel.frame = CGRectMake(0, 0, self.view.frame.width, self.view.frame.height)
        resetCoverLabel.layer.position = CGPoint(x:self.view.frame.width/2, y:self.view.frame.height/2)
        resetCoverLabel.backgroundColor = UIColor.whiteColor()
        resetCoverLabel.text = "本当に消去しますか？"
        resetCoverLabel.textAlignment = NSTextAlignment.Center
        
        // ボタンの生成
        backButton = UIButton(frame: CGRectMake(0,0,self.view.frame.width,self.view.frame.height))
        backButton.layer.position = CGPoint(x: self.view.frame.width/2 , y:self.view.frame.height/2)
        backButton.addTarget(self, action: "onClickMyButton:", forControlEvents: .TouchUpInside)
        backButton.backgroundColor = UIColor.clearColor()
        backButton.tag = 3
        
        // ボタンを追加
        self.view.addSubview(easyLabel)
        self.view.addSubview(normalLabel)
        self.view.addSubview(hardLabel)
        self.view.addSubview(easyScoreLabel)
        self.view.addSubview(normalScoreLabel)
        self.view.addSubview(hardScoreLabel)
        
        if userDefaults.integerForKey("extraScore") > 0 {
            self.view.addSubview(extraLabel)
            self.view.addSubview(extraScoreLabel)
        }
        
        self.view.addSubview(backButton)
        self.view.addSubview(resetButton)
        
        self.view.addSubview(resetCoverLabel)
        self.view.addSubview(yesButton)
        self.view.addSubview(noButton)
        
        yesButton.hidden = true
        noButton.hidden = true
        resetCoverLabel.hidden = true
    }
    
    //
    // ボタンイベント
    //
    func onClickMyButton(sender: UIButton){
        switch sender.tag {
        case 0:
            resetCoverLabel.hidden = false
            yesButton.hidden = false
            noButton.hidden = false
            resetButton.hidden = true
            backButton.hidden = true
            
        case 1:
            scoreReset()
            resetCoverLabel.hidden = true
            yesButton.hidden = true
            noButton.hidden = true
            resetButton.hidden = false
            backButton.hidden = false
            
        case 2:
            resetCoverLabel.hidden = true
            yesButton.hidden = true
            noButton.hidden = true
            resetButton.hidden = false
            backButton.hidden = false
            
        case 3:
            // 遷移するViewを定義する.
            var myNextViewController: UIViewController!
            var appDelegate:AppDelegate = UIApplication.sharedApplication().delegate as AppDelegate
            
            myNextViewController = ModeChoiceViewController()
            
            // Viewの移動
            self.presentViewController(myNextViewController, animated: false, completion: nil)
        default:
            println("error")
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func scoreReset(){
        userDefaults.setObject(0, forKey: "easyScore")
        userDefaults.setObject(0, forKey: "normalScore")
        userDefaults.setObject(0, forKey: "hardScore")
        userDefaults.setObject(0, forKey: "extraScore")
        easyScoreLabel.text = userDefaults.stringForKey("easyScore")
        normalScoreLabel.text = userDefaults.stringForKey("normalScore")
        hardScoreLabel.text = userDefaults.stringForKey("hardScore")
        extraScoreLabel.text = userDefaults.stringForKey("extraScore")
    }

}

