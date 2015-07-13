//
//  StartViewController.swift
//  touchGradation
//
//  Created by Ryo on 2015/04/15.
//  Copyright (c) 2015年 Ryo. All rights reserved.
//

import UIKit

class StartViewController: UIViewController {
    
    var nextButton: UIButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.whiteColor()
        
        // ボタンの生成
        nextButton = UIButton(frame: CGRectMake(0,0,self.view.frame.width,self.view.frame.height))
        nextButton.setTitle("START", forState: .Normal)
        nextButton.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        nextButton.layer.position = CGPoint(x: self.view.frame.width/2 , y:self.view.frame.height/2)
        nextButton.addTarget(self, action: "onClickMyButton:", forControlEvents: .TouchUpInside)
        
        // ボタンを追加
        self.view.addSubview(nextButton);
        
    }
    
    //
    // ボタンイベント
    //
    func onClickMyButton(sender: UIButton){
        
        // 遷移するViewを定義する.
        var myNextViewController: UIViewController!
        var appDelegate:AppDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        
        switch appDelegate.modeNum {
        case 1:
            myNextViewController = EasyViewController()
        case 2:
            myNextViewController = NormalViewController()
        case 3:
            myNextViewController = HardViewController()
        default:
            println("error")
        }
        // Viewの移動
        self.presentViewController(myNextViewController, animated: false, completion: nil)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
}
