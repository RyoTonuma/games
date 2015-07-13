//
//  ViewController.swift
//  catan_count
//
//  Created by Ryo on 2015/04/05.
//  Copyright (c) 2015年 Ryo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let redUpButton: UIButton = UIButton()
    let redDownButton: UIButton = UIButton()
    let whiteUpButton: UIButton = UIButton()
    let whiteDownButton: UIButton = UIButton()
    let orangeUpButton: UIButton = UIButton()
    let orangeDownButton: UIButton = UIButton()
    let blueUpButton: UIButton = UIButton()
    let blueDownButton: UIButton = UIButton()
    let resetButton:UIButton = UIButton()
    
    let redLabel: UILabel = UILabel()
    let whiteLabel: UILabel = UILabel()
    let orangeLabel: UILabel = UILabel()
    let blueLabel: UILabel = UILabel()
    
    var countRed:Int = 2
    var countWhite:Int = 2
    var countOrange:Int = 2
    var countBlue:Int = 2
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        redUpButton.frame = CGRectMake(0,0,self.view.frame.width/2,self.view.frame.height/6)
        redDownButton.frame = CGRectMake(0,0,self.view.frame.width/2,self.view.frame.height/6)
        whiteUpButton.frame = CGRectMake(0,0,self.view.frame.width/2,self.view.frame.height/6)
        whiteDownButton.frame = CGRectMake(0,0,self.view.frame.width/2,self.view.frame.height/6)
        orangeUpButton.frame = CGRectMake(0,0,self.view.frame.width/2,self.view.frame.height/6)
        orangeDownButton.frame = CGRectMake(0,0,self.view.frame.width/2,self.view.frame.height/6)
        blueUpButton.frame = CGRectMake(0,0,self.view.frame.width/2,self.view.frame.height/6)
        blueDownButton.frame = CGRectMake(0,0,self.view.frame.width/2,self.view.frame.height/6)
        resetButton.frame = CGRectMake(0,0,self.view.frame.width/4,self.view.frame.height/12)
        
        resetButton.layer.masksToBounds = true
        resetButton.layer.cornerRadius = 20.0
        
        redLabel.frame = CGRectMake(0,0,self.view.frame.width,self.view.frame.height/6)
        whiteLabel.frame = CGRectMake(0,0,self.view.frame.width,self.view.frame.height/6)
        orangeLabel.frame = CGRectMake(0,0,self.view.frame.width,self.view.frame.height/6)
        blueLabel.frame = CGRectMake(0,0,self.view.frame.width,self.view.frame.height/6)
        
        redUpButton.backgroundColor = UIColor.clearColor()
        redDownButton.backgroundColor = UIColor.clearColor()
        whiteUpButton.backgroundColor = UIColor.clearColor()
        whiteDownButton.backgroundColor = UIColor.clearColor()
        orangeUpButton.backgroundColor = UIColor.clearColor()
        orangeDownButton.backgroundColor = UIColor.clearColor()
        blueUpButton.backgroundColor = UIColor.clearColor()
        blueDownButton.backgroundColor = UIColor.clearColor()
        resetButton.backgroundColor = UIColor.blackColor()
        
        redLabel.backgroundColor = UIColor.redColor()
        whiteLabel.backgroundColor = UIColor.whiteColor()
        orangeLabel.backgroundColor = UIColor.orangeColor()
        blueLabel.backgroundColor = UIColor.blueColor()
        
        redUpButton.setTitle("∧", forState: UIControlState.Normal)
        redUpButton.contentHorizontalAlignment = UIControlContentHorizontalAlignment.Left
        redDownButton.setTitle("∨", forState: UIControlState.Normal)
        redDownButton.contentHorizontalAlignment = UIControlContentHorizontalAlignment.Right
        whiteUpButton.setTitle("∧", forState: UIControlState.Normal)
        whiteUpButton.contentHorizontalAlignment = UIControlContentHorizontalAlignment.Left
        whiteDownButton.setTitle("∨", forState: UIControlState.Normal)
        whiteDownButton.contentHorizontalAlignment = UIControlContentHorizontalAlignment.Right
        orangeUpButton.setTitle("∧", forState: UIControlState.Normal)
        orangeUpButton.contentHorizontalAlignment = UIControlContentHorizontalAlignment.Left
        orangeDownButton.setTitle("∨", forState: UIControlState.Normal)
        orangeDownButton.contentHorizontalAlignment = UIControlContentHorizontalAlignment.Right
        blueUpButton.setTitle("∧", forState: UIControlState.Normal)
        blueUpButton.contentHorizontalAlignment = UIControlContentHorizontalAlignment.Left
        blueDownButton.setTitle("∨", forState: UIControlState.Normal)
        blueDownButton.contentHorizontalAlignment = UIControlContentHorizontalAlignment.Right
        resetButton.setTitle("reset", forState: UIControlState.Normal)
        
        redLabel.text = String(countRed)
        redLabel.textColor = UIColor.blackColor()
        redLabel.textAlignment = NSTextAlignment.Center
        whiteLabel.text = String(countWhite)
        whiteLabel.textColor = UIColor.blackColor()
        whiteLabel.textAlignment = NSTextAlignment.Center
        orangeLabel.text = String(countOrange)
        orangeLabel.textColor = UIColor.blackColor()
        orangeLabel.textAlignment = NSTextAlignment.Center
        blueLabel.text = String(countBlue)
        blueLabel.textColor = UIColor.blackColor()
        blueLabel.textAlignment = NSTextAlignment.Center
        
        redUpButton.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        redDownButton.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        whiteUpButton.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        whiteDownButton.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        orangeUpButton.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        orangeDownButton.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        blueUpButton.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        blueDownButton.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        resetButton.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        
        redUpButton.layer.position = CGPoint(x: self.view.frame.width/4, y:self.view.frame.height*3/12)
        redDownButton.layer.position = CGPoint(x: self.view.frame.width*3/4, y:self.view.frame.height*3/12)
        
        whiteUpButton.layer.position = CGPoint(x: self.view.frame.width/4, y:self.view.frame.height*5/12)
        whiteDownButton.layer.position = CGPoint(x: self.view.frame.width*3/4, y:self.view.frame.height*5/12)
        orangeUpButton.layer.position = CGPoint(x: self.view.frame.width/4, y:self.view.frame.height*7/12)
        orangeDownButton.layer.position = CGPoint(x: self.view.frame.width*3/4, y:self.view.frame.height*7/12)
        blueUpButton.layer.position = CGPoint(x: self.view.frame.width/4, y:self.view.frame.height*9/12)
        blueDownButton.layer.position = CGPoint(x: self.view.frame.width*3/4, y:self.view.frame.height*9/12)
        resetButton.layer.position = CGPoint(x: self.view.frame.width/2, y:self.view.frame.height/12)
        
        redLabel.layer.position = CGPoint(x: self.view.frame.width/2, y:self.view.frame.height*3/12)
        whiteLabel.layer.position = CGPoint(x: self.view.frame.width/2, y:self.view.frame.height*5/12)
        orangeLabel.layer.position = CGPoint(x: self.view.frame.width/2, y:self.view.frame.height*7/12)
        blueLabel.layer.position = CGPoint(x: self.view.frame.width/2, y:self.view.frame.height*9/12)
        
        resetButton.tag = 0
        redUpButton.tag = 1
        redDownButton.tag = 2
        whiteUpButton.tag = 3
        whiteDownButton.tag = 4
        orangeUpButton.tag = 5
        orangeDownButton.tag = 6
        blueUpButton.tag = 7
        blueDownButton.tag = 8
        
        resetButton.addTarget(self, action: "onClickMyButton:", forControlEvents: .TouchUpInside)
        redUpButton.addTarget(self, action: "onClickMyButton:", forControlEvents: .TouchUpInside)
        redDownButton.addTarget(self, action: "onClickMyButton:", forControlEvents: .TouchUpInside)
        whiteUpButton.addTarget(self, action: "onClickMyButton:", forControlEvents: .TouchUpInside)
        whiteDownButton.addTarget(self, action: "onClickMyButton:", forControlEvents: .TouchUpInside)
        orangeUpButton.addTarget(self, action: "onClickMyButton:", forControlEvents: .TouchUpInside)
        orangeDownButton.addTarget(self, action: "onClickMyButton:", forControlEvents: .TouchUpInside)
        blueUpButton.addTarget(self, action: "onClickMyButton:", forControlEvents: .TouchUpInside)
        blueDownButton.addTarget(self, action: "onClickMyButton:", forControlEvents: .TouchUpInside)
        
        
        self.view.addSubview(redLabel)
        self.view.addSubview(whiteLabel)
        self.view.addSubview(orangeLabel)
        self.view.addSubview(blueLabel)
        
        self.view.addSubview(resetButton)
        self.view.addSubview(redUpButton)
        self.view.addSubview(redDownButton)
        self.view.addSubview(whiteUpButton)
        self.view.addSubview(whiteDownButton)
        self.view.addSubview(orangeUpButton)
        self.view.addSubview(orangeDownButton)
        self.view.addSubview(blueUpButton)
        self.view.addSubview(blueDownButton)
        self.view.addSubview(whiteUpButton)
        self.view.addSubview(whiteDownButton)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func onClickMyButton(sender: UIButton){
        switch sender.tag {
        case 0:
            countRed = 2
            countWhite = 2
            countOrange = 2
            countBlue = 2
            redLabel.text = String(countRed)
            whiteLabel.text = String(countWhite)
            orangeLabel.text = String(countOrange)
            blueLabel.text = String(countBlue)
            
        case 1:
            countRed += 1
            redLabel.text = String(countRed)
        
        case 2:
            if countRed>0 {
                countRed -= 1
                redLabel.text = String(countRed)
            }
        
        case 3:
            countWhite += 1
            whiteLabel.text = String(countWhite)
        
        case 4:
            if countWhite>0 {
                countWhite -= 1
                whiteLabel.text = String(countWhite)
            }
            
        case 5:
            countOrange += 1
            orangeLabel.text = String(countOrange)
            
        case 6:
            if countOrange>0 {
                countOrange -= 1
                orangeLabel.text = String(countOrange)
            }
            
        case 7:
            countBlue += 1
            blueLabel.text = String(countBlue)
            
        case 8:
            if countBlue>0 {
                countBlue -= 1
                blueLabel.text = String(countBlue)
            }
            
        default:
            println("error")
        }
        
    }



}

