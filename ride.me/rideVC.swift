//
//  rideVC.swift
//  ride.me
//
//  Created by Aditya Dhingra on 8/12/15.
//  Copyright (c) 2015 Aditya Dhingra. All rights reserved.
//

import Foundation
import UIKit
import Parse

class rideVC: UIViewController {
    
    var Day = NSDate()
    
    // TO INPUTS
    
    @IBAction func resignKeyboard(sender: AnyObject) {
        sender.resignFirstResponder()
    }
    
    @IBOutlet var addto: UITextField!
    @IBOutlet var cityto: UITextField!
    @IBOutlet var stateto: UITextField!
    @IBOutlet var zipto: UITextField!
    
    // FROM INPUTS
    
    @IBOutlet var addfrom: UITextField!
    @IBOutlet var cityfrom: UITextField!
    @IBOutlet var statefrom: UITextField!
    @IBOutlet var zipfrom: UITextField!
    
    // DATE INPUT
    
    @IBOutlet var datepick: UIDatePicker!
    @IBAction func datepicker(sender: AnyObject) {
        var date:NSDate = datepick.date
        Day = NSCalendar.currentCalendar().startOfDayForDate(date)
        println(date)
        println(Day)
    }
    
    @IBAction func done(sender: AnyObject) {
        
        post_ride()
        
    }
    
    func post_ride(){
        
        var currentUser = PFUser.currentUser()?.username
        var driveuser = PFObject(className:"ride")
        driveuser["username"] = currentUser
        driveuser["date"] = Day as NSDate
        driveuser["addto"] = addto.text!
        driveuser["cityto"] = cityto.text!
        driveuser["stateto"] = stateto.text!
        driveuser["zipto"] = zipto.text!
        driveuser["addfrom"] = addfrom.text!
        driveuser["cityfrom"] = cityfrom.text!
        driveuser["statefrom"] = statefrom.text!
        driveuser["zipfrom"] = zipfrom.text!
        
    }


    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}