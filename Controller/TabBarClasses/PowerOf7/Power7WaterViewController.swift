//
//  Power7WaterViewController.swift
//  LIveNutriFit
//
//  Created by pragya on 07/05/16.
//  Copyright © 2016 ankit deshwal. All rights reserved.
//

import UIKit

class Power7WaterViewController: UIViewController {
  
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet var btnEditedReminder: UIButton!
    @IBOutlet weak var switchButton: UISwitch!
    @IBOutlet weak var lblHeader: UILabel!
      var stageId:Int!
    override func viewDidLoad() {
        super.viewDidLoad()
       imageView.image = UIImage(named: "img1")
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(animated: Bool) {
        let navigationBar = self.navigationController?.navigationBar
        navigationBar?.barStyle = UIBarStyle.Default
        navigationBar?.barTintColor = kColor_navigationBar
        navigationBar?.tintColor = UIColor.whiteColor()
        navigationBar?.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // iboutlet method
    @IBAction func reminderButtonEditedSelecterMethod(sender: AnyObject) {
        stageId = 2
        self.performSegueWithIdentifier(kSegue_ReminderSetting, sender: self)
       
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        self.navigationController?.navigationBarHidden = false
        if segue.identifier == kSegue_ReminderSetting{
            let nextViewController  = segue.destinationViewController as! ReminderViewController
             nextViewController.title = "Water"
             nextViewController.stageId = stageId
        }
    }


}
