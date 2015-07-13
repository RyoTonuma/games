//
//  ViewController.swift
//  touchGradation
//
//  Created by Ryo on 2015/04/13.
//  Copyright (c) 2015年 Ryo. All rights reserved.
//

import UIKit

class NormalViewController: UIViewController {
    
    //時間計測用変数
    var timeNum:Double = 32
    
    
    var timer:NSTimer!
    
    //RGBを何段階に分けるか
    var colorInterval:CGFloat = 70
    
    //RGB=111にならないよう
    var spacer:CGFloat = 30
    
    //RGBの変数
    var redRand:CGFloat = 0
    var greenRand:CGFloat = 0
    var blueRand:CGFloat = 0

    //その色で何番めまで成功したか
    var count:Int = 0
    
    var successCount:Int = 0
    var missCount:Int = 0
    var bonusCount:Int = 0
    
    //薄い順か濃い順か
    var instNum:Int = 0
    
    //それぞれのボタンが何番めに薄いか
    var colors:[Int] = Array(count: 16, repeatedValue: 0)

    //ボタン、ラベル定義
    let stopButton : UIButton = UIButton()
    let button1: UIButton = UIButton()
    let button2: UIButton = UIButton()
    let button3: UIButton = UIButton()
    let button4: UIButton = UIButton()
    let button5: UIButton = UIButton()
    let button6: UIButton = UIButton()
    let button7: UIButton = UIButton()
    let button8: UIButton = UIButton()
    let button9: UIButton = UIButton()
    let button10: UIButton = UIButton()
    let button11: UIButton = UIButton()
    let button12: UIButton = UIButton()
    let button13: UIButton = UIButton()
    let button14: UIButton = UIButton()
    let button15: UIButton = UIButton()
    let button16: UIButton = UIButton()
    
    let yesButton: UIButton = UIButton()
    let noButton: UIButton = UIButton()
    
    let timeLabel: UILabel = UILabel()
    let instLabel: UILabel = UILabel()
    let sheetLabel: UILabel = UILabel()
    let resetCoverLabel: UILabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.whiteColor()
        
        //ボタンのタグ
        stopButton.tag = 0
        button1.tag = 1
        button2.tag = 2
        button3.tag = 3
        button4.tag = 4
        button5.tag = 5
        button6.tag = 6
        button7.tag = 7
        button8.tag = 8
        button9.tag = 9
        button10.tag = 10
        button11.tag = 11
        button12.tag = 12
        button13.tag = 13
        button14.tag = 14
        button15.tag = 15
        button16.tag = 16
        yesButton.tag = 17
        noButton.tag = 18
        
        //ボタンの大きさ、丸み、位置
        stopButton.frame = CGRectMake(0, 0, 30, 30)
        stopButton.layer.cornerRadius = 15.0
        stopButton.layer.position = CGPointMake(30, 50)
        
        button1.frame = CGRectMake(0, 0, 70, 70)
        button1.layer.cornerRadius = 10.0
        button1.layer.position = CGPointMake(self.view.frame.width/2 - 120, self.view.frame.height/2 - 120)
        
        button2.frame = CGRectMake(0, 0, 70, 70)
        button2.layer.cornerRadius = 10.0
        button2.layer.position = CGPointMake(self.view.frame.width/2 - 40, self.view.frame.height/2 - 120)
        
        button3.frame = CGRectMake(0, 0, 70, 70)
        button3.layer.cornerRadius = 10.0
        button3.layer.position = CGPointMake(self.view.frame.width/2 + 40, self.view.frame.height/2 - 120)
        
        button4.frame = CGRectMake(0, 0, 70, 70)
        button4.layer.cornerRadius = 10.0
        button4.layer.position = CGPointMake(self.view.frame.width/2 + 120, self.view.frame.height/2 - 120)
        
        button5.frame = CGRectMake(0, 0, 70, 70)
        button5.layer.cornerRadius = 10.0
        button5.layer.position = CGPointMake(self.view.frame.width/2 - 120, self.view.frame.height/2 - 40)
        
        button6.frame = CGRectMake(0, 0, 70, 70)
        button6.layer.cornerRadius = 10.0
        button6.layer.position = CGPointMake(self.view.frame.width/2 - 40, self.view.frame.height/2 - 40)
        
        button7.frame = CGRectMake(0, 0, 70, 70)
        button7.layer.cornerRadius = 10.0
        button7.layer.position = CGPointMake(self.view.frame.width/2 + 40, self.view.frame.height/2 - 40)
        
        button8.frame = CGRectMake(0, 0, 70, 70)
        button8.layer.cornerRadius = 10.0
        button8.layer.position = CGPointMake(self.view.frame.width/2 + 120, self.view.frame.height/2 - 40)
        
        button9.frame = CGRectMake(0, 0, 70, 70)
        button9.layer.cornerRadius = 10.0
        button9.layer.position = CGPointMake(self.view.frame.width/2 - 120, self.view.frame.height/2 + 40)
        
        button10.frame = CGRectMake(0, 0, 70, 70)
        button10.layer.cornerRadius = 10.0
        button10.layer.position = CGPointMake(self.view.frame.width/2 - 40, self.view.frame.height/2 + 40)
        
        button11.frame = CGRectMake(0, 0, 70, 70)
        button11.layer.cornerRadius = 10.0
        button11.layer.position = CGPointMake(self.view.frame.width/2 + 40, self.view.frame.height/2 + 40)
        
        button12.frame = CGRectMake(0, 0, 70, 70)
        button12.layer.cornerRadius = 10.0
        button12.layer.position = CGPointMake(self.view.frame.width/2 + 120, self.view.frame.height/2 + 40)
        
        button13.frame = CGRectMake(0, 0, 70, 70)
        button13.layer.cornerRadius = 10.0
        button13.layer.position = CGPointMake(self.view.frame.width/2 - 120, self.view.frame.height/2 + 120)
        
        button14.frame = CGRectMake(0, 0, 70, 70)
        button14.layer.cornerRadius = 10.0
        button14.layer.position = CGPointMake(self.view.frame.width/2 - 40, self.view.frame.height/2 + 120)
        
        button15.frame = CGRectMake(0, 0, 70, 70)
        button15.layer.cornerRadius = 10.0
        button15.layer.position = CGPointMake(self.view.frame.width/2 + 40, self.view.frame.height/2 + 120)
        
        button16.frame = CGRectMake(0, 0, 70, 70)
        button16.layer.cornerRadius = 10.0
        button16.layer.position = CGPointMake(self.view.frame.width/2 + 120, self.view.frame.height/2 + 120)
        
        yesButton.frame = CGRectMake(0, 0, 150, 70)
        yesButton.layer.cornerRadius = 10.0
        yesButton.layer.position = CGPointMake(self.view.frame.width/2 - 80, self.view.frame.height/2 + 110)
        yesButton.setTitle("YES", forState: .Normal)
        yesButton.backgroundColor = UIColor.redColor()
        
        noButton.frame = CGRectMake(0, 0, 150, 70)
        noButton.layer.cornerRadius = 10.0
        noButton.layer.position = CGPointMake(self.view.frame.width/2 + 80, self.view.frame.height/2 + 110)
        noButton.setTitle("NO", forState: .Normal)
        noButton.backgroundColor = UIColor.blueColor()
        
        //イベントの追加
        stopButton.addTarget(self, action: "onClickMyButton:", forControlEvents: .TouchUpInside)
        button1.addTarget(self, action: "onClickMyButton:", forControlEvents: .TouchUpInside)
        button2.addTarget(self, action: "onClickMyButton:", forControlEvents: .TouchUpInside)
        button3.addTarget(self, action: "onClickMyButton:", forControlEvents: .TouchUpInside)
        button4.addTarget(self, action: "onClickMyButton:", forControlEvents: .TouchUpInside)
        button5.addTarget(self, action: "onClickMyButton:", forControlEvents: .TouchUpInside)
        button6.addTarget(self, action: "onClickMyButton:", forControlEvents: .TouchUpInside)
        button7.addTarget(self, action: "onClickMyButton:", forControlEvents: .TouchUpInside)
        button8.addTarget(self, action: "onClickMyButton:", forControlEvents: .TouchUpInside)
        button9.addTarget(self, action: "onClickMyButton:", forControlEvents: .TouchUpInside)
        button10.addTarget(self, action: "onClickMyButton:", forControlEvents: .TouchUpInside)
        button11.addTarget(self, action: "onClickMyButton:", forControlEvents: .TouchUpInside)
        button12.addTarget(self, action: "onClickMyButton:", forControlEvents: .TouchUpInside)
        button13.addTarget(self, action: "onClickMyButton:", forControlEvents: .TouchUpInside)
        button14.addTarget(self, action: "onClickMyButton:", forControlEvents: .TouchUpInside)
        button15.addTarget(self, action: "onClickMyButton:", forControlEvents: .TouchUpInside)
        button16.addTarget(self, action: "onClickMyButton:", forControlEvents: .TouchUpInside)
        yesButton.addTarget(self, action: "onClickMyButton:", forControlEvents: .TouchUpInside)
        noButton.addTarget(self, action: "onClickMyButton:", forControlEvents: .TouchUpInside)
        
        stopButton.setTitle("×", forState: .Normal)
        stopButton.backgroundColor = UIColor.redColor()
        
        //ラベルの設定
        timeLabel.text = "\(Int(timeNum + 1))"
        timeLabel.frame = CGRectMake(0, 0, self.view.frame.width/2, 70)
        timeLabel.layer.position = CGPoint(x:self.view.frame.width/2, y:self.view.frame.height/2 - 210)
        timeLabel.textAlignment = NSTextAlignment.Center
        timeLabel.layer.masksToBounds = true
        timeLabel.backgroundColor = UIColor.whiteColor()
        timeLabel.layer.cornerRadius = 10.0
        
        instLabel.frame = CGRectMake(0, 0, self.view.frame.width/2, 70)
        instLabel.layer.position = CGPoint(x:self.view.frame.width/2, y:self.view.frame.height/2 + 210)
        instLabel.textAlignment = NSTextAlignment.Center
        instLabel.layer.masksToBounds = true
        instLabel.backgroundColor = UIColor.whiteColor()
        instLabel.layer.cornerRadius = 10.0
        
        sheetLabel.frame = CGRectMake(0, 0, 340, 340)
        sheetLabel.layer.position = CGPoint(x:self.view.frame.width/2, y:self.view.frame.height/2)
        sheetLabel.backgroundColor = UIColor.whiteColor()
        sheetLabel.layer.masksToBounds = true
        sheetLabel.layer.cornerRadius = 20.0
        
        resetCoverLabel.frame = CGRectMake(0, 0, 340, 340)
        resetCoverLabel.layer.position = CGPoint(x:self.view.frame.width/2, y:self.view.frame.height/2)
        resetCoverLabel.backgroundColor = UIColor.whiteColor()
        resetCoverLabel.layer.masksToBounds = true
        resetCoverLabel.layer.cornerRadius = 20.0
        resetCoverLabel.text = "本当に終了しますか？"
        resetCoverLabel.textAlignment = NSTextAlignment.Center
        
        //ボタンをViewに追加
        self.view.addSubview(sheetLabel)
        
        self.view.addSubview(button1)
        self.view.addSubview(button2)
        self.view.addSubview(button3)
        self.view.addSubview(button4)
        self.view.addSubview(button5)
        self.view.addSubview(button6)
        self.view.addSubview(button7)
        self.view.addSubview(button8)
        self.view.addSubview(button9)
        self.view.addSubview(button10)
        self.view.addSubview(button11)
        self.view.addSubview(button12)
        self.view.addSubview(button13)
        self.view.addSubview(button14)
        self.view.addSubview(button15)
        self.view.addSubview(button16)
        
        self.view.addSubview(timeLabel)
        self.view.addSubview(instLabel)
        
        self.view.addSubview(stopButton)
        
        self.view.addSubview(resetCoverLabel)
        self.view.addSubview(yesButton)
        self.view.addSubview(noButton)
        
        yesButton.hidden = true
        noButton.hidden = true
        resetCoverLabel.hidden = true
        
        timer = NSTimer.scheduledTimerWithTimeInterval(0.01, target: self, selector: "onUpdate:", userInfo: nil, repeats: true)
        
        reset()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func onUpdate(timer : NSTimer){
        
        timeNum -= 0.01
        timeLabel.text = "\(Int(timeNum + 1))"
        
        if timeNum < 0 {
            
            timer.invalidate()
            
            var appDelegate:AppDelegate = UIApplication.sharedApplication().delegate as AppDelegate
            appDelegate.successCount = successCount
            appDelegate.missCount = missCount
            appDelegate.bonusCount = bonusCount
            
            // 遷移するViewを定義.
            let myResultViewController: UIViewController = ResultViewController()
            
            // Viewの移動.
            self.presentViewController(myResultViewController, animated: false, completion: nil)
        }
        
    }
    
    //透明度を重複なしランダムに振り分ける
    func randColors(){
        var tmpArray:[Int] = Array(count: 16, repeatedValue: 1)
        var leftCount:Int = 16
        for i in 0...15 {
            var randNum:Int = Int(arc4random_uniform(UInt32(leftCount))) + 1
            var oneCount = 0
            for j in 0...15{
                if tmpArray[j] == 1 {
                    oneCount += 1
                }
                if oneCount == randNum {
                    colors[i] = j + 1
                    tmpArray[j] = 0
                    leftCount -= 1
                    break
                }
            }
        }
    }
    
    //RGBをランダムな値にする
    func randRgb(){
        redRand = CGFloat((arc4random_uniform(UInt32(colorInterval))) + 1)/(colorInterval + spacer)
        greenRand = CGFloat((arc4random_uniform(UInt32(colorInterval))) + 1)/(colorInterval + spacer)
        blueRand = CGFloat((arc4random_uniform(UInt32(colorInterval))) + 1)/(colorInterval + spacer)
    }
    
    //ボタンの色を変更する
    func changeColor(buttonNum:Int, redNum:CGFloat, greenNum:CGFloat, blueNum:CGFloat,alphaNum:Int){
        switch buttonNum {
        case 1:
            button1.backgroundColor = UIColor(red:redNum,green:greenNum,blue:blueNum,alpha:CGFloat(alphaNum)/16)
        case 2:
            button2.backgroundColor = UIColor(red:redNum,green:greenNum,blue:blueNum,alpha:CGFloat(alphaNum)/16)
        case 3:
            button3.backgroundColor = UIColor(red:redNum,green:greenNum,blue:blueNum,alpha:CGFloat(alphaNum)/16)
        case 4:
            button4.backgroundColor = UIColor(red:redNum,green:greenNum,blue:blueNum,alpha:CGFloat(alphaNum)/16)
        case 5:
            button5.backgroundColor = UIColor(red:redNum,green:greenNum,blue:blueNum,alpha:CGFloat(alphaNum)/16)
        case 6:
            button6.backgroundColor = UIColor(red:redNum,green:greenNum,blue:blueNum,alpha:CGFloat(alphaNum)/16)
        case 7:
            button7.backgroundColor = UIColor(red:redNum,green:greenNum,blue:blueNum,alpha:CGFloat(alphaNum)/16)
        case 8:
            button8.backgroundColor = UIColor(red:redNum,green:greenNum,blue:blueNum,alpha:CGFloat(alphaNum)/16)
        case 9:
            button9.backgroundColor = UIColor(red:redNum,green:greenNum,blue:blueNum,alpha:CGFloat(alphaNum)/16)
        case 10:
            button10.backgroundColor = UIColor(red:redNum,green:greenNum,blue:blueNum,alpha:CGFloat(alphaNum)/16)
        case 11:
            button11.backgroundColor = UIColor(red:redNum,green:greenNum,blue:blueNum,alpha:CGFloat(alphaNum)/16)
        case 12:
            button12.backgroundColor = UIColor(red:redNum,green:greenNum,blue:blueNum,alpha:CGFloat(alphaNum)/16)
        case 13:
            button13.backgroundColor = UIColor(red:redNum,green:greenNum,blue:blueNum,alpha:CGFloat(alphaNum)/16)
        case 14:
            button14.backgroundColor = UIColor(red:redNum,green:greenNum,blue:blueNum,alpha:CGFloat(alphaNum)/16)
        case 15:
            button15.backgroundColor = UIColor(red:redNum,green:greenNum,blue:blueNum,alpha:CGFloat(alphaNum)/16)
        case 16:
            button16.backgroundColor = UIColor(red:redNum,green:greenNum,blue:blueNum,alpha:CGFloat(alphaNum)/16)
        default:
            println("errorB")
        }
    }
    
    //ボタンの状態をリセットする
    func reset(){
        randRgb()
        count = 0
        randColors()
        instNum = Int(arc4random_uniform(2))
        if instNum == 0 {
            self.view.backgroundColor = UIColor.whiteColor()
            for i in 0...15{
                changeColor(i+1,redNum: redRand,greenNum: greenRand,blueNum: blueRand ,alphaNum: colors[i])
            }
            instLabel.text = "薄い順にタッチ"
        }
        else{
            self.view.backgroundColor = UIColor.grayColor()
            for i in 0...15{
                changeColor(i+1,redNum: redRand,greenNum: greenRand,blueNum: blueRand ,alphaNum: 17 - colors[i])
            }
            instLabel.text = "濃い順にタッチ"
        }
    }
    
    //全てリセットする
    func allReset(){
        count = 0
        successCount = 0
        missCount = 0
        bonusCount = 0
        reset()
    }
    
    func switchingButton(){
        resetCoverLabel.hidden = !resetCoverLabel.hidden
        yesButton.hidden = !yesButton.hidden
        noButton.hidden = !noButton.hidden
        stopButton.hidden = !stopButton.hidden
        timeLabel.hidden = !timeLabel.hidden
        instLabel.hidden = !instLabel.hidden
        button1.hidden = !button1.hidden
        button2.hidden = !button2.hidden
        button3.hidden = !button3.hidden
        button4.hidden = !button4.hidden
        button5.hidden = !button5.hidden
        button6.hidden = !button6.hidden
        button7.hidden = !button7.hidden
        button8.hidden = !button8.hidden
        button9.hidden = !button9.hidden
        button10.hidden = !button10.hidden
        button11.hidden = !button11.hidden
        button12.hidden = !button12.hidden
        button13.hidden = !button13.hidden
        button14.hidden = !button14.hidden
        button15.hidden = !button15.hidden
        button16.hidden = !button16.hidden
    }
    
    //ボタンを押したときの処理
    func onClickMyButton(sender: UIButton){
        if sender.tag == 0 {
            timer.invalidate()
            switchingButton()
        }
        else if sender.tag == 17{
            timer.invalidate()
            let myReturnViewController: UIViewController = ModeChoiceViewController()
            self.presentViewController(myReturnViewController, animated: false, completion: nil)
        }
        else if sender.tag == 18{
            timer = NSTimer.scheduledTimerWithTimeInterval(0.01, target: self, selector: "onUpdate:", userInfo: nil, repeats: true)
            switchingButton()
        }
        else if count == (colors[sender.tag - 1] - 1) {
            switch sender.tag {
            case 1:
                button1.backgroundColor = UIColor.whiteColor()
                count += 1
                successCount += 1
            case 2:
                button2.backgroundColor = UIColor.whiteColor()
                count += 1
                successCount += 1
            case 3:
                button3.backgroundColor = UIColor.whiteColor()
                count += 1
                successCount += 1
            case 4:
                button4.backgroundColor = UIColor.whiteColor()
                count += 1
                successCount += 1
            case 5:
                button5.backgroundColor = UIColor.whiteColor()
                count += 1
                successCount += 1
            case 6:
                button6.backgroundColor = UIColor.whiteColor()
                count += 1
                successCount += 1
            case 7:
                button7.backgroundColor = UIColor.whiteColor()
                count += 1
                successCount += 1
            case 8:
                button8.backgroundColor = UIColor.whiteColor()
                count += 1
                successCount += 1
            case 9:
                button9.backgroundColor = UIColor.whiteColor()
                count += 1
                successCount += 1
            case 10:
                button10.backgroundColor = UIColor.whiteColor()
                count += 1
                successCount += 1
            case 11:
                button11.backgroundColor = UIColor.whiteColor()
                count += 1
                successCount += 1
            case 12:
                button12.backgroundColor = UIColor.whiteColor()
                count += 1
                successCount += 1
            case 13:
                button13.backgroundColor = UIColor.whiteColor()
                count += 1
                successCount += 1
            case 14:
                button14.backgroundColor = UIColor.whiteColor()
                count += 1
                successCount += 1
            case 15:
                button15.backgroundColor = UIColor.whiteColor()
                count += 1
                successCount += 1
            case 16:
                button16.backgroundColor = UIColor.whiteColor()
                count += 1
                successCount += 1
            default:
                println("errorC")
            }
            if count == 16 {
                bonusCount += 1
                timeNum += 15
                reset()
            }
        }
        else if count < (colors[sender.tag - 1] - 1){
            missCount += 1
            reset()
        }
    }
    
}

