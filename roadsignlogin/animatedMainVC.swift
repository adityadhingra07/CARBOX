//
//  ViewController.swift
//  ride.me
//
//  Created by Aditya Dhingra on 8/2/15.
//  Copyright (c) 2015 Aditya Dhingra. All rights reserved.
//

import Foundation
import UIKit

class ANMTDmainviewController: UIViewController,MainviewViewDelegate {
    
    @IBOutlet var mainview: MainviewView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        mainview.mainviewViewDelegate = self
        mainview.addLoadanimationAnimation()
        
    }
    
    func loginbtnPressed(loginbtn: UIButton){
        
        let vc : AnyObject! = self.storyboard!.instantiateViewControllerWithIdentifier("loginanimatedVC")
        self.showViewController(vc as! UIViewController, sender: vc)
        
    }
    
    func signupbtnPressed(signupbtn: UIButton){
        
        let vc : AnyObject! = self.storyboard!.instantiateViewControllerWithIdentifier("signupanimatedVC")
        self.showViewController(vc as! UIViewController, sender: vc)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

