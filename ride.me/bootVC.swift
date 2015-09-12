//
//  bootVC.swift
//  ride.me
//
//  Created by Aditya Dhingra on 9/12/15.
//  Copyright (c) 2015 Aditya Dhingra. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation

class bootVC: UIViewController {
    
    @IBOutlet var bootView: BootView!
    var audioPlayer = AVAudioPlayer()
    
    override func viewDidLoad() {
        
        let delay = 5 * Double(NSEC_PER_SEC)
        let time = dispatch_time(DISPATCH_TIME_NOW, Int64(delay))
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        bootView.addBootAnimation { (value:Bool) -> Void in
            dispatch_after(time, dispatch_get_main_queue()) {
            self.performSegueWithIdentifier("bootsegue", sender: self)
            }
        }
        var alertSound = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("Bass_Drop_04", ofType: "wav")!)
        println(alertSound)
        
        // Removed deprecated use of AVAudioSessionDelegate protocol
        AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback, error: nil)
        AVAudioSession.sharedInstance().setActive(true, error: nil)
        
        var error:NSError?
        audioPlayer = AVAudioPlayer(contentsOfURL: alertSound, error: &error)
        audioPlayer.prepareToPlay()
        audioPlayer.play()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}


