//
//  SecondViewController.swift
//  Clicking
//
//  Created by Won Yong Ha on 10/11/16.
//  Copyright © 2016 A290 Spring 2016 - woha. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var rateTextBox: UILabel!
    
    @IBOutlet weak var btn_ug1: UIButton!
    
    @IBOutlet weak var btn_ug2: UIButton!
    
    @IBOutlet weak var btn_ug3: UIButton!
    
    @IBOutlet weak var btn_ug4: UIButton!
    
    
    //Double amound for clicking
    @IBAction func upgradeButton_1(sender: UIButton) {
        
        let stringKey = NSUserDefaults.standardUserDefaults()
        
        let addingNumNS = stringKey.stringForKey("savedAddingNum")
        
        var addingNum = 1
        
        if addingNumNS != nil {
            addingNum = Int(addingNumNS!)!
        }
        
        let num = stringKey.stringForKey("savedCount")
        var number = 0
        
        if num != "" {
            number = Int(num!)!
        }
        
        let cost = addingNum * 32
        print(cost)
        if number > cost {
            number -= cost
            
            addingNum *= 2
            
            NSUserDefaults.standardUserDefaults().setObject(String(addingNum), forKey: "savedAddingNum")
            NSUserDefaults.standardUserDefaults().setObject(String(number), forKey: "savedCount")
            NSUserDefaults.standardUserDefaults().synchronize()
            rateTextBox.text = "One Click for " + String(addingNum) + " & " + stringKey.stringForKey("savedRateNum")! + " Click per Second"
            
            
        } else {
            rateTextBox.text = "Not Enough Clicks!"
        }

    }
    
    @IBAction func upgradeButton_2(sender: UIButton) {
        let stringKey = NSUserDefaults.standardUserDefaults()
        
        let rateNumNS = stringKey.stringForKey("savedRateNum")
        var rate = 0
        if rateNumNS != nil {
            rate = Int(rateNumNS!)!
        } else {
            rate = 0
        }
        let num = stringKey.stringForKey("savedCount")
        var number = 0
        
        if num != "" {
            number = Int(num!)!
        }
        
        let cost = 60
        
        if number > cost {
            number -= cost
            rate += 1
            NSUserDefaults.standardUserDefaults().setObject(String(rate), forKey: "savedRateNum")
            NSUserDefaults.standardUserDefaults().setObject(String(number), forKey: "savedCount")
            NSUserDefaults.standardUserDefaults().synchronize()
            rateTextBox.text = "One Click for " + stringKey.stringForKey("savedAddingNum")! + " & " + String(rate) + " Click per Second"
        } else {
            rateTextBox.text = "Not Enough Clicks!"
        }
        
    }
    
    @IBAction func upgradeButton_3(sender: UIButton) {
        let stringKey = NSUserDefaults.standardUserDefaults()
        
        let rateNumNS = stringKey.stringForKey("savedRateNum")
        var rate = 0
        if rateNumNS != nil {
            rate = Int(rateNumNS!)!
        } else {
            rate = 0
        }
        let num = stringKey.stringForKey("savedCount")
        var number = 0
        
        if num != "" {
            number = Int(num!)!
        }
        
        let cost = 6000
        
        if number > cost {
            number -= cost
            rate += 100
            NSUserDefaults.standardUserDefaults().setObject(String(rate), forKey: "savedRateNum")
            NSUserDefaults.standardUserDefaults().setObject(String(number), forKey: "savedCount")
            NSUserDefaults.standardUserDefaults().synchronize()
            rateTextBox.text = "One Click for " + stringKey.stringForKey("savedAddingNum")! + " & " + String(rate) + " Click per Second"
        } else {
            rateTextBox.text = "Not Enough Clicks!"
        }
    }
    
    @IBAction func upgradeButton_4(sender: UIButton) {
        let stringKey = NSUserDefaults.standardUserDefaults()
        
        let rateNumNS = stringKey.stringForKey("savedRateNum")
        var rate = 0
        if rateNumNS != nil {
            rate = Int(rateNumNS!)!
        } else {
            rate = 0
        }
        let num = stringKey.stringForKey("savedCount")
        var number = 0
        
        if num != "" {
            number = Int(num!)!
        }
        
        let cost = 60000
        
        if number > cost {
            number -= cost
            rate += 1000
            NSUserDefaults.standardUserDefaults().setObject(String(rate), forKey: "savedRateNum")
            NSUserDefaults.standardUserDefaults().setObject(String(number), forKey: "savedCount")
            NSUserDefaults.standardUserDefaults().synchronize()
            rateTextBox.text = "One Click for " + stringKey.stringForKey("savedAddingNum")! + " & " + String(rate) + " Click per Second"
        } else {
            rateTextBox.text = "Not Enough Clicks!"
        }
    }
    
    @IBAction func resetButton(sender: UIButton) {
        NSUserDefaults.standardUserDefaults().setObject("1", forKey: "savedAddingNum")
        NSUserDefaults.standardUserDefaults().setObject("0", forKey: "savedCount")
        NSUserDefaults.standardUserDefaults().setObject("0", forKey: "savedRateNum")
        NSUserDefaults.standardUserDefaults().synchronize()
        
        rateTextBox.text = "One Click for " + "0" + " & " + "0" + " Click per Second"
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let stringKey = NSUserDefaults.standardUserDefaults()
        
        btn_ug1.setTitle("Double Your Clicking!", forState: .Normal)
        btn_ug2.setTitle("1 per Second : 60Clicks", forState: .Normal)
        btn_ug3.setTitle("100 per Second : 6000Clicks", forState: .Normal)
        btn_ug4.setTitle("1000 per Second : 60000Clicks", forState: .Normal)
        
        let addingNumNS = stringKey.stringForKey("savedAddingNum")
        
        var addingNum = 1
        
        if addingNumNS != nil {
            addingNum = Int(addingNumNS!)!
        }
        let rateNumNS = stringKey.stringForKey("savedRateNum")
        var rate = 0
        if rateNumNS != nil {
            rate = Int(rateNumNS!)!
        } else {
            rate = 0
        }
        
        rateTextBox.text = "One Click for " + String(addingNum) + " & " + String(rate) + " Click per Second"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}

