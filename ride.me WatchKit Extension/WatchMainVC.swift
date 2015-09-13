//
//  WatchMainVC.swift
//  ride.me
//
//  Created by Aditya Dhingra on 8/16/15.
//  Copyright (c) 2015 Aditya Dhingra. All rights reserved.
//

import WatchKit
import Foundation
import Parse

class WatchMainVC: WKInterfaceController {
    
    @IBOutlet var name: WKInterfaceLabel!
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        Parse.enableLocalDatastore()
        Parse.enableDataSharingWithApplicationGroupIdentifier("group.com.myexample.ride-me", containingApplication: "com.myexample.ride-me")
        
        Parse.setApplicationId("8HWVCwLAEWaLHmXBQ9hKl77YhmfHKPAoiZFJM4Ds", clientKey:"LbugyjO6Pr2GPM5m4JexSCahNMG5e4qjFBq85Yec")
        // Configure interface objects here.
        
        let currentUser = PFUser.currentUser()?.username
        name.setText("Hey, "+currentUser!+"!")
        
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
        
    }
    
}