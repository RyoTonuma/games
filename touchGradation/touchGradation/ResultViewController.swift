//
//  ResultViewController.swift
//  touchGradation
//
//  Created by Ryo on 2015/04/15.
//  Copyright (c) 2015年 Ryo. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    var nextButton: UIButton = UIButton()
    var appDelegate:AppDelegate = UIApplication.sharedApplication().delegate as AppDelegate
    
    //var resultScore:Int = appDelegate.score
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var successCount:Int = appDelegate.successCount
        var missCount:Int = appDelegate.missCount
        var bonusCount:Int = appDelegate.bonusCount
        
        var resultScore:Int = 0
        var pastScore:Int = 0
        
        self.view.backgroundColor = UIColor.whiteColor()
        
        let successLabel:UILabel = UILabel(frame: CGRectMake(0,0,self.view.frame.width/4,70))
        let missLabel:UILabel = UILabel(frame: CGRectMake(0,0,self.view.frame.width/4,70))
        let bonusLabel:UILabel = UILabel(frame: CGRectMake(0,0,self.view.frame.width/4,70))
        let resultLabel:UILabel = UILabel(frame: CGRectMake(0,0,self.view.frame.width/4,70))
        
        let successCountLabel:UILabel = UILabel(frame: CGRectMake(0,0,self.view.frame.width/4,70))
        let missCountLabel:UILabel = UILabel(frame: CGRectMake(0,0,self.view.frame.width/4,70))
        let bonusCountLabel:UILabel = UILabel(frame: CGRectMake(0,0,self.view.frame.width/4,70))
        let resultScoreLabel:UILabel = UILabel(frame: CGRectMake(0,0,self.view.frame.width/4,70))
        
        let modeLabel:UILabel = UILabel(frame: CGRectMake(0,0,self.view.frame.width,70))
        
        let userDefaults = NSUserDefaults.standardUserDefaults()
        
        switch appDelegate.modeNum {
        case 1:
            modeLabel.text = "Easy"
            bonusCountLabel.text = String(bonusCount) + " ( × 9 )"
            resultScore = successCount - missCount + bonusCount * 9
            pastScore = userDefaults.integerForKey("easyScore")
            if pastScore < resultScore {
                userDefaults.setObject(resultScore, forKey: "easyScore")
            }
        case 2:
            modeLabel.text = "Normal"
            bonusCountLabel.text = String(bonusCount) + " ( × 16 )"
            resultScore = successCount - missCount + bonusCount * 16
            pastScore = userDefaults.integerForKey("normalScore")
            if pastScore < resultScore {
                userDefaults.setObject(resultScore, forKey: "normalScore")
            }
        case 3:
            modeLabel.text = "Hard"
            bonusCountLabel.text = String(bonusCount) + " ( × 25 )"
            resultScore = successCount - missCount + bonusCount * 25
            pastScore = userDefaults.integerForKey("hardScore")
            if pastScore < resultScore {
                userDefaults.setObject(resultScore, forKey: "hardScore")
            }
        case 4:
            modeLabel.text = "Extra"
            bonusCountLabel.text = String(bonusCount) + " ( × 36 )"
            resultScore = successCount - missCount + bonusCount * 36
            pastScore = userDefaults.integerForKey("extraScore")
            if pastScore < resultScore {
                userDefaults.setObject(resultScore, forKey: "extraScore")
            }
        default:
            println("error")
        }
        
        
        successLabel.text = "Success"
        missLabel.text = "Miss"
        bonusLabel.text = "Bonus"
        resultLabel.text = "Score"
        successCountLabel.text = String(successCount)
        missCountLabel.text = String(missCount)
        resultScoreLabel.text = String(resultScore)
        
        modeLabel.textColor = UIColor.blackColor()
        successLabel.textColor = UIColor.blackColor()
        missLabel.textColor = UIColor.redColor()
        bonusLabel.textColor = UIColor.blackColor()
        resultLabel.textColor = UIColor.blackColor()
        successCountLabel.textColor = UIColor.blackColor()
        missCountLabel.textColor = UIColor.redColor()
        bonusCountLabel.textColor = UIColor.blackColor()
        resultScoreLabel.textColor = UIColor.blackColor()
        
        
        modeLabel.layer.position = CGPoint(x: self.view.frame.width/2,y: self.view.frame.height/2 - 210)
        successLabel.layer.position = CGPoint(x: self.view.frame.width*3/8,y: self.view.frame.height/2 - 140)
        missLabel.layer.position = CGPoint(x: self.view.frame.width*3/8,y: self.view.frame.height/2 - 70)
        bonusLabel.layer.position = CGPoint(x: self.view.frame.width*3/8,y: self.view.frame.height/2)
        resultLabel.layer.position = CGPoint(x: self.view.frame.width*3/8,y: self.view.frame.height/2 + 70)
        successCountLabel.layer.position = CGPoint(x: self.view.frame.width*5/8,y: self.view.frame.height/2 - 140)
        missCountLabel.layer.position = CGPoint(x: self.view.frame.width*5/8,y: self.view.frame.height/2 - 70)
        bonusCountLabel.layer.position = CGPoint(x: self.view.frame.width*5/8,y: self.view.frame.height/2)
        resultScoreLabel.layer.position = CGPoint(x: self.view.frame.width*5/8,y: self.view.frame.height/2 + 70)
        
        modeLabel.textAlignment = NSTextAlignment.Center
        successLabel.textAlignment = NSTextAlignment.Left
        missLabel.textAlignment = NSTextAlignment.Left
        bonusLabel.textAlignment = NSTextAlignment.Left
        resultLabel.textAlignment = NSTextAlignment.Left
        successCountLabel.textAlignment = NSTextAlignment.Left
        missCountLabel.textAlignment = NSTextAlignment.Left
        bonusCountLabel.textAlignment = NSTextAlignment.Left
        resultScoreLabel.textAlignment = NSTextAlignment.Left
        
        self.view.addSubview(modeLabel)
        self.view.addSubview(successLabel)
        self.view.addSubview(missLabel)
        self.view.addSubview(bonusLabel)
        self.view.addSubview(resultLabel)
        self.view.addSubview(successCountLabel)
        self.view.addSubview(missCountLabel)
        self.view.addSubview(bonusCountLabel)
        self.view.addSubview(resultScoreLabel)
        
        
        // UIボタンを作成
        nextButton = UIButton(frame: CGRectMake(0,0,120,50))
        nextButton.layer.masksToBounds = true
        nextButton.layer.cornerRadius = 10.0
        nextButton.layer.position = CGPoint(x: self.view.frame.width/2 , y:self.view.frame.height-150)
        nextButton.addTarget(self, action: "onClickMyButton:", forControlEvents: .TouchUpInside)
        
        if appDelegate.modeNum == 3 && resultScore >= 30 {
            nextButton.backgroundColor = UIColor(red:0.7,green:0,blue:1,alpha:0.4)
            nextButton.setTitle("Extra Game", forState: .Normal)
            nextButton.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
            nextButton.tag = 2
        }
        else{
            nextButton.backgroundColor = UIColor.blackColor()
            nextButton.setTitle("Next Game", forState: .Normal)
            nextButton.tag = 1
        }
        
        self.view.addSubview(nextButton);
        
        
        
    }
    //
    // ボタンイベント
    //
    func onClickMyButton(sender: UIButton){
        
        // 遷移するViewを定義.
        var myNextViewController: UIViewController!
        
        switch sender.tag {
        case 1:
            myNextViewController = ModeChoiceViewController()
        case 2:
            appDelegate.modeNum = 4
            myNextViewController = CountDownViewController()
        default:
            println("error")
        }
        // Viewの移動.
        self.presentViewController(myNextViewController, animated: false, completion: nil)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
