//
//  PersonalViewController.swift
//  LIveNutriFit
//
//  Created by pragya on 10/04/16.
//  Copyright © 2016 ankit deshwal. All rights reserved.
//

import UIKit

class PersonalViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var tableView_PersonalDetail: UITableView!
    
    @IBOutlet weak var btnArrowToNext: UIButton!
    // personal
    override func viewDidLoad() {
        super.viewDidLoad()
      

        // Do any additional setup after loading the view.
    }
  // tableview delegate method
//    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
//        return 5
//    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        switch indexPath.row {
        case 0:
            let cellIdentifier = "gender"
            let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier) as! PersonalGenderTableViewCell
            cell.selected = false
            return cell
        default:
            let cellIdentifier = "enterDob"
            let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier) as! PersonalDobTableViewCell
            cell.selected = false
            return cell
        }
   }
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return 105
        case 1:
            return 100
        default:
            return 60
        }
    }
    // ib outlet button method
    
    @IBAction func arrowButtonTappedAction(sender: AnyObject) {
        let vc = self.storyboard?.instantiateViewControllerWithIdentifier("personal2") as! Personal2ViewController
        self.presentViewController(vc, animated: true, completion: nil)
        //performSegueWithIdentifier(kSegue_PersonalDetail2, sender: self)
    }
        
    
    
    // MARK: - Navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == kSegue_PersonalDetail2{
            let nextViewController  = segue.destinationViewController as! Personal2ViewController
            nextViewController.title = "title"
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
  
}
