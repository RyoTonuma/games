//
//  ViewController.swift
//  gradationConcentration
//
//  Created by Ryo on 2015/05/07.
//  Copyright (c) 2015年 Ryo. All rights reserved.
//

import UIKit

class NormalViewController: UIViewController {
    
    //時間計測用変数
    var timeNum:Int = 0
    
    
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
    
    var firstTouchNum = 0
    var secondTouchNum = 0
    var secondTouchFlag:Bool = false
    
    var successFlag = false
    
    var successButtonFlag:[Bool] = Array(count: 16, repeatedValue: false)
    
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
    
    let clearButton: UIButton = UIButton()
    
    let timeLabel: UILabel = UILabel()
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
        clearButton.tag = 19
        
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
        
        clearButton.frame = CGRectMake(0, 0, self.view.frame.width, self.view.frame.height)
        clearButton.layer.position = CGPointMake(self.view.frame.width/2, self.view.frame.height/2)
        clearButton.backgroundColor = UIColor.clearColor()
        
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
        clearButton.addTarget(self, action: "onClickMyButton:", forControlEvents: .TouchUpInside)
        
        stopButton.setTitle("×", forState: .Normal)
        stopButton.backgroundColor = UIColor.redColor()
        
        //ラベルの設定
        timeLabel.text = NSString(format: "%0.2f" , Double(timeNum)/100)
        timeLabel.frame = CGRectMake(0, 0, self.view.frame.width/2, 70)
        timeLabel.layer.position = CGPoint(x:self.view.frame.width/2, y:self.view.frame.height/2 - 210)
        timeLabel.textAlignment = NSTextAlignment.Center
        timeLabel.layer.masksToBounds = true
        timeLabel.backgroundColor = UIColor.whiteColor()
        timeLabel.layer.cornerRadius = 10.0
        
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
        
        self.view.addSubview(clearButton)
        
        self.view.addSubview(stopButton)
        
        self.view.addSubview(resetCoverLabel)
        self.view.addSubview(yesButton)
        self.view.addSubview(noButton)
        
        yesButton.hidden = true
        noButton.hidden = true
        resetCoverLabel.hidden = true
        clearButton.hidden = true
        
        timer = NSTimer.scheduledTimerWithTimeInterval(0.01, target: self, selector: "onUpdate:", userInfo: nil, repeats: true)
        
        reset()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func onUpdate(timer : NSTimer){
        
        timeNum += 1
        timeLabel.text = NSString(format: "%0.2f" , Double(timeNum)/100)
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
            button1.backgroundColor = UIColor(red:redNum,green:greenNum,blue:blueNum,alpha:CGFloat((alphaNum - 1) / 2 + 1) / 8)
        case 2:
            button2.backgroundColor = UIColor(red:redNum,green:greenNum,blue:blueNum,alpha:CGFloat((alphaNum - 1) / 2 + 1) / 8)
        case 3:
            button3.backgroundColor = UIColor(red:redNum,green:greenNum,blue:blueNum,alpha:CGFloat((alphaNum - 1) / 2 + 1) / 8)
        case 4:
            button4.backgroundColor = UIColor(red:redNum,green:greenNum,blue:blueNum,alpha:CGFloat((alphaNum - 1) / 2 + 1) / 8)
        case 5:
            button5.backgroundColor = UIColor(red:redNum,green:greenNum,blue:blueNum,alpha:CGFloat((alphaNum - 1) / 2 + 1) / 8)
        case 6:
            button6.backgroundColor = UIColor(red:redNum,green:greenNum,blue:blueNum,alpha:CGFloat((alphaNum - 1) / 2 + 1) / 8)
        case 7:
            button7.backgroundColor = UIColor(red:redNum,green:greenNum,blue:blueNum,alpha:CGFloat((alphaNum - 1) / 2 + 1) / 8)
        case 8:
            button8.backgroundColor = UIColor(red:redNum,green:greenNum,blue:blueNum,alpha:CGFloat((alphaNum - 1) / 2 + 1) / 8)
        case 9:
            button9.backgroundColor = UIColor(red:redNum,green:greenNum,blue:blueNum,alpha:CGFloat((alphaNum - 1) / 2 + 1) / 8)
        case 10:
            button10.backgroundColor = UIColor(red:redNum,green:greenNum,blue:blueNum,alpha:CGFloat((alphaNum - 1) / 2 + 1) / 8)
        case 11:
            button11.backgroundColor = UIColor(red:redNum,green:greenNum,blue:blueNum,alpha:CGFloat((alphaNum - 1) / 2 + 1) / 8)
        case 12:
            button12.backgroundColor = UIColor(red:redNum,green:greenNum,blue:blueNum,alpha:CGFloat((alphaNum - 1) / 2 + 1) / 8)
        case 13:
            button13.backgroundColor = UIColor(red:redNum,green:greenNum,blue:blueNum,alpha:CGFloat((alphaNum - 1) / 2 + 1) / 8)
        case 14:
            button14.backgroundColor = UIColor(red:redNum,green:greenNum,blue:blueNum,alpha:CGFloat((alphaNum - 1) / 2 + 1) / 8)
        case 15:
            button15.backgroundColor = UIColor(red:redNum,green:greenNum,blue:blueNum,alpha:CGFloat((alphaNum - 1) / 2 + 1) / 8)
        case 16:
            button16.backgroundColor = UIColor(red:redNum,green:greenNum,blue:blueNum,alpha:CGFloat((alphaNum - 1) / 2 + 1) / 8)
        default:
            println("errorB")
        }
    }
    
    //ボタンの状態をリセットする
    func reset(){
        randRgb()
        count = 0
        randColors()
        for i in 0...15{
            changeColor(i+1,redNum: 0.2,greenNum: 0.2,blueNum: 0.2 ,alphaNum: 16)
        }
    }
    //memo 
    //changeColor(i+1,redNum: redRand,greenNum: greenRand,blueNum: blueRand ,alphaNum: colors[i])
    func switchingAllButton(){
        resetCoverLabel.hidden = !resetCoverLabel.hidden
        yesButton.hidden = !yesButton.hidden
        noButton.hidden = !noButton.hidden
        stopButton.hidden = !stopButton.hidden
        timeLabel.hidden = !timeLabel.hidden
        if timeLabel.hidden {
            hiddenCardButton()
        }
        else{
            returnCardButton()
        }
    }
    
    func returnCardButton(){
        button1.hidden = successButtonFlag[0]
        button2.hidden = successButtonFlag[1]
        button3.hidden = successButtonFlag[2]
        button4.hidden = successButtonFlag[3]
        button5.hidden = successButtonFlag[4]
        button6.hidden = successButtonFlag[5]
        button7.hidden = successButtonFlag[6]
        button8.hidden = successButtonFlag[7]
        button9.hidden = successButtonFlag[8]
        button10.hidden = successButtonFlag[9]
        button11.hidden = successButtonFlag[10]
        button12.hidden = successButtonFlag[11]
        button13.hidden = successButtonFlag[12]
        button14.hidden = successButtonFlag[13]
        button15.hidden = successButtonFlag[14]
        button16.hidden = successButtonFlag[15]
    }
    
    func hiddenCardButton(){
        button1.hidden = true
        button2.hidden = true
        button3.hidden = true
        button4.hidden = true
        button5.hidden = true
        button6.hidden = true
        button7.hidden = true
        button8.hidden = true
        button9.hidden = true
        button10.hidden = true
        button11.hidden = true
        button12.hidden = true
        button13.hidden = true
        button14.hidden = true
        button15.hidden = true
        button16.hidden = true
    }
    
    //ボタンを押したときの処理
    func onClickMyButton(sender: UIButton){
        if sender.tag == 0 {
            timer.invalidate()
            switchingAllButton()
        }
        else if sender.tag == 17{
            timer.invalidate()
            //let myReturnViewController: UIViewController = ModeChoiceViewController()
            //self.presentViewController(myReturnViewController, animated: false, completion: nil)
        }
        else if sender.tag == 18{
            timer = NSTimer.scheduledTimerWithTimeInterval(0.01, target: self, selector: "onUpdate:", userInfo: nil, repeats: true)
            switchingAllButton()
        }
        else if sender.tag == 19 {
            if successFlag {
                successButtonFlag[firstTouchNum - 1] = true
                successButtonFlag[secondTouchNum - 1] = true
                count += 1
                if count == 8 {
                    timer.invalidate()
                }
                returnCardButton()
            }
            else{
                changeColor(firstTouchNum, redNum: 0.2,greenNum: 0.2,blueNum: 0.2 ,alphaNum: 16)
                changeColor(secondTouchNum, redNum: 0.2,greenNum: 0.2,blueNum: 0.2 ,alphaNum: 16)
            }
            clearButton.hidden = true
            successFlag = false
        }
        else {
            changeColor(sender.tag, redNum: redRand, greenNum: greenRand, blueNum: blueRand, alphaNum: colors[sender.tag - 1])
            if !secondTouchFlag {
                firstTouchNum = sender.tag
                secondTouchFlag = true
            }
            else if firstTouchNum != sender.tag{
                secondTouchNum = sender.tag
                if (colors[firstTouchNum - 1] + 1)/2 == (colors[sender.tag - 1] + 1)/2 {
                    successFlag = true
                }
                clearButton.hidden = false
                secondTouchFlag = false
            }
        }
    }
}



