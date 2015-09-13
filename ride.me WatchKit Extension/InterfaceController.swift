//
//  InterfaceController.swift
//  ride.me WatchKit Extension
//
//  Created by Aditya Dhingra on 8/15/15.
//  Copyright (c) 2015 Aditya Dhingra. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {
    
    @IBAction func interestedPressed() {
    }

    @IBAction func skipPressed() {
    }
    
    @IBAction func cancelPressed() {
    }
    
    @IBOutlet var mapObject: WKInterfaceMap!
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
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
