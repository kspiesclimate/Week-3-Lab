//
//  CanvasViewController.swift
//  Week 3 Lab
//
//  Created by Katie Spies on 10/1/15.
//  Copyright (c) 2015 Katie Spies. All rights reserved.
//

import UIKit

class CanvasViewController: UIViewController {

    @IBOutlet weak var trayImage: UIView!
    var trayOriginalCenter: CGPoint!
    var openPosition: CGFloat!
    var closedPosition: CGFloat!
    var newlyCreatedFace: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        openPosition = trayImage.frame.origin.y
        closedPosition = 530.0
        
        // Do any additional setup after loading the view.
    
    }
    @IBAction func panGestureRecognizer(sender: UIPanGestureRecognizer) {
        
        var location = sender.locationInView(view)
        NSLog("location \(location.x) \(location.y)")
        
        var translation = sender.translationInView(view)
        NSLog("translation \(translation.x) \(translation.y)")
        
        var velocity = sender.velocityInView(view)
        NSLog("velocity \(velocity.x) \(velocity.y)")
        
        if sender.state == UIGestureRecognizerState.Began {
            println("gesture began!")
        trayOriginalCenter = trayImage.center
            
        }
        else if sender.state == UIGestureRecognizerState.Changed{
            println("gesture changed!")
            trayImage.center.y = location.y
            
        }
        else if sender.state == UIGestureRecognizerState.Ended{
            println("gesture ended!")
            
            trayImage.center = CGPoint(x: trayOriginalCenter.x, y: trayOriginalCenter.y + translation.y)
            
            if (velocity.y >= 0){
                //tray is moving down
                
                UIView.animateWithDuration(0.3, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0, options: nil, animations: { () -> Void in
                    //animation code
                    
                    self.trayImage.frame.origin.y = self.closedPosition
                    }, completion: { (completed) -> Void in
                        //completed
                })
                
            }
            else {
                //tray is moving up
            
                
                UIView.animateWithDuration(0.3, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0, options: nil, animations: { () -> Void in
                    //animation code
                    
                    self.trayImage.frame.origin.y = self.openPosition
                }, completion: { (completed) -> Void in
                    //completed
                })
               
            }}
    }

    
    @IBAction func deadPan(sender: UIPanGestureRecognizer) {
        
        if sender.state == UIGestureRecognizerState.Began {
            //create new variable for the image that was gestured on
            var imageView = sender.view as UIImageView
            newlyCreatedFace = UIImageView(image: imageView.image)
            view.addSubview(newlyCreatedFace)
            newlyCreatedFace.center = imageView.center
            newlyCreatedFace.center.y += trayView.frame.origin.y
            
            
        }
        
        else if sender.state == UIGestureRecognizerState.Changed{
        }
        
        else if sender.state == UIGestureRecognizerState.Ended{
        }
        
    }
    
        
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
