//
//  ThankYouViewController.swift
//  LIveNutriFit
//
//  Created by pragya on 24/04/16.
//  Copyright © 2016 ankit deshwal. All rights reserved.
//

import UIKit

class ThankYouViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var btnFinish: UIButton!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    // iboutlet
    
    @IBAction func finishButtonActionTapped(sender: AnyObject) {
        self.performSegueWithIdentifier(kSegue_TwoStepAway, sender: self)
        
    }
    

 // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == kSegue_TwoStepAway{
            let nextViewController  = segue.destinationViewController as! TwoStepAwayViewController
            nextViewController.title = "title"
        }

        
    }

}
