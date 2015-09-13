//
//  ViewController.swift
//  ride.me
//
//  Created by Aditya Dhingra on 8/2/15.
//  Copyright (c) 2015 Aditya Dhingra. All rights reserved.
//

import UIKit
import MediaPlayer

class ViewController: UIViewController {
    
    var moviePlayer : MPMoviePlayerController?
    
    func playVideo() ->Bool {
        
        let path = NSBundle.mainBundle().pathForResource("bgvideo-quicktime", ofType:"mov")
        //take path of video
        
        let url = NSURL.fileURLWithPath(path!)
        
        moviePlayer = MPMoviePlayerController(contentURL: url)
        //asigning video to moviePlayer
        
        if let player = moviePlayer {
            player.view.frame = self.view.bounds
            //setting the video size to the view size
            
            player.controlStyle = MPMovieControlStyle.None
            //Hiding the Player controls
            
            
            player.prepareToPlay()
            //Playing the video
            
            
            player.repeatMode = .One
            //Repeating the video
            
            player.scalingMode = .AspectFill
            //setting the aspect ratio of the player
            
            self.view.addSubview(player.view)
            //adding the player view to viewcontroller
            return true
        }
        return false
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        //moviePlayer!.stop()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.playVideo()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

