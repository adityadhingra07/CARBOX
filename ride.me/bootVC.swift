//
//  bootVC.swift
//  ride.me
//
//  Created by Aditya Dhingra on 9/12/15.
//  Copyright (c) 2015 Aditya Dhingra. All rights reserved.
//

import Foundation
import UIKit

class bootVC: UIViewController {
    
    @IBOutlet var bootView: BootView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        bootView.addBootAnimation { (value:Bool) -> Void in
            self.performSegueWithIdentifier("bootsegue", sender: self)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}


