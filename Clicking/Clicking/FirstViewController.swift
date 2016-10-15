//
//  FirstViewController.swift
//  Clicking
//
//  Created by Won Yong Ha on 10/11/16.
//  Copyright © 2016 A290 Spring 2016 - woha. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    var count = 0
    var addingNum = 1
    var timer = NSTimer()
    var i = 0
    
    @IBOutlet weak var btn_Score: UIButton!
    
    @IBOutlet var unitTypeLabel:UILabel!
    
    
    @IBAction func scoreButton(sender: UIButton) {
        
    }
    
    
    // clickingMainButton Function
    // The major action when the user press the button
    // return: void
    @IBAction func clickingMainButton(sender: UIButton) {
        
        let stringKey = NSUserDefaults.standardUserDefaults()
        
        let num = stringKey.stringForKey("savedCount")
        var number = 0
        
        if num != "" {
            number = Int(num!)!
        }
        
        let addingNumNS = stringKey.stringForKey("savedAddingNum")
        if addingNumNS != nil {
            addingNum = Int(addingNumNS!)!
        } else {
            addingNum = 1
        }
        count = number
        count += addingNum
        
        btn_Score.setTitle(String(count), forState: .Normal)
        
        let text = btn_Score.titleLabel!.text
        NSUserDefaults.standardUserDefaults().setObject(count, forKey: "savedCount")
        NSUserDefaults.standardUserDefaults().synchronize()
        
        
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewDidLoad()
        let stringKey = NSUserDefaults.standardUserDefaults()
        
        let addingNumNS = stringKey.stringForKey("savedAddingNum")
        if addingNumNS != nil {
            addingNum = Int(addingNumNS!)!
        } else {
            addingNum = 1
        }
        let num = stringKey.stringForKey("savedCount")
        var number = 0
        
        if num != nil {
            number = Int(num!)!
        } else {
            number = 0
        }
        count = 0
        count = number
        print(number)
        NSUserDefaults.standardUserDefaults().setObject(String(number), forKey: "savedCount")
        NSUserDefaults.standardUserDefaults().synchronize()
        
        btn_Score.setTitle(String(number), forState: .Normal)
        
        super.viewWillAppear(animated)
        refreshFields()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let stringKey = NSUserDefaults.standardUserDefaults()
        
        let addingNumNS = stringKey.stringForKey("savedAddingNum")
        if addingNumNS != nil {
            addingNum = Int(addingNumNS!)!
        } else {
            addingNum = 1
        }
        let num = stringKey.stringForKey("savedCount")
        var number = 0
        
        if num != nil {
            number = Int(num!)!
        } else {
            number = 0
        }
        
        count = number
        
        btn_Score.setTitle(String(number), forState: .Normal)
        
        timer = NSTimer(timeInterval: 1.0, target: self, selector: "update", userInfo: nil, repeats: true)
        NSRunLoop.currentRunLoop().addTimer(timer, forMode: NSRunLoopCommonModes)
    }

    func update() {
        let stringKey = NSUserDefaults.standardUserDefaults()
        
        let num = stringKey.stringForKey("savedCount")
        var number = 0
        
        if num != "" {
            number = Int(num!)!
        }

        
        let rateNumNS = stringKey.stringForKey("savedRateNum")
        var rate = 0
        if rateNumNS != nil {
            rate = Int(rateNumNS!)!
        } else {
            rate = 0
        }
        
        count = number
        
        count += rate
        
        btn_Score.setTitle(String(count), forState: .Normal)
        
        NSUserDefaults.standardUserDefaults().setObject(String(count), forKey: "savedCount")
        NSUserDefaults.standardUserDefaults().synchronize()
        
        print(rate)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func refreshFields(){
        let myDefaults = NSUserDefaults.standardUserDefaults()
        unitTypeLabel.text = myDefaults.stringForKey(unitTypeKey)
        myDefaults.synchronize()
    }

}

