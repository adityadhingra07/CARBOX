//
//  usermenu.swift
//  ride.me
//
//  Created by Aditya Dhingra on 8/9/15.
//  Copyright (c) 2015 Aditya Dhingra. All rights reserved.
//

import Foundation
import UIKit

class usermenuVC: UIViewController, LoadmenuViewDelegate {
    
    @IBOutlet var usermenu: LoadmenuView!
    
    func drivePressed(drive: UIButton){
        var Storyboard = UIStoryboard(name: "Main", bundle: nil)
        var driveVC : UIViewController = Storyboard.instantiateViewControllerWithIdentifier("driveVC") as! UIViewController
        self.presentViewController(driveVC, animated: true, completion: nil)
    }
    
    func ridePressed(ride: UIButton){
        var Storyboard = UIStoryboard(name: "Main", bundle: nil)
        var rideVC : UIViewController = Storyboard.instantiateViewControllerWithIdentifier("rideVC") as! UIViewController
        self.presentViewController(rideVC, animated: true, completion: nil)
    }
    
    @IBAction func unwindToViewController(sender: UIStoryboardSegue) {
        self.dismissViewControllerAnimated(true, completion: nil)
        
        //This is for using the cancel button
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        usermenu.loadmenuViewDelegate = self
        usermenu.addLoadmenuAnimation()
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}