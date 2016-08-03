//
//  ViewController.swift
//  PushUP
//
//  Created by Nehemiah Reese on 6/30/16.
//  Copyright © 2016 Nehemiah Reese. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var counterLabel: UILabel!
    
    var timer: NSTimer?
    
    var accumulator = 0
    
    @IBOutlet weak var labelForCounter: UILabel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.labelForCounter?.text = "Hardwork and Dedication"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func pushUpTapped(sender: AnyObject) {
        self.labelForCounter?.text = "Start your work out!"
        if (timer == nil) {
        timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: Selector("update") , userInfo: nil, repeats: true)
        }
    }

    @IBAction func resetCounter(sender: AnyObject) {
        accumulator = 0
        counterLabel.text = "\(accumulator)"
        if timer != nil {
            timer!.invalidate()
            timer = nil
        }
     labelForCounter?.text = "Tap to start your work out!"

    }
    
    func update() {
        dispatch_async(dispatch_get_main_queue()) { () -> Void in
            self.accumulator += 1
            self.counterLabel.text = "\(self.accumulator)"
        }
    }

    @IBAction func stopButtonPressed(sender: AnyObject) {
        timer?.invalidate()
        
        switch (self.accumulator) {
        case 0...10: self.labelForCounter?.text = "Keep up the great work!"
        case 11...30: self.labelForCounter?.text = "Your a titan!!!"
        case 40...100: self.labelForCounter!.text = "Beast Mode"
        default: self.labelForCounter?.text = "Your a different animal 💪!!!"
        
        }
      
        
    }




}

