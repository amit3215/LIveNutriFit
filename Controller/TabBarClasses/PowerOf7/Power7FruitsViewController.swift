//
//  Power7FruitsViewController.swift
//  LIveNutriFit
//
//  Created by pragya on 07/05/16.
//  Copyright © 2016 ankit deshwal. All rights reserved.
//

import UIKit

class Power7FruitsViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource{
@IBOutlet weak var collectionView: UICollectionView!
@IBOutlet var btnEditedReminder: UIButton!
    @IBOutlet weak var switchButton: UISwitch!
    @IBOutlet weak var lblHeader: UILabel!
     var stageId:Int!
     private let reuseIdentifier = "collectionViewCell"
    override func viewDidLoad() {
        super.viewDidLoad()

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
    
    
     // collection view delegate method
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return 6
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath)
        cell.setNeedsLayout()
        cell.layoutIfNeeded()
        
        return cell
    }
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
            let itemSizeWidth = self.collectionView.frame.size.width - 5
            let itemSizeheight = self.collectionView.frame.size.height - 5
            return CGSizeMake(itemSizeWidth/2, itemSizeheight/2)
    }

    


    // iboutlet method
    @IBAction func reminderButtonEditedSelecterMethod(sender: AnyObject) {
       
        stageId = 5
        self.performSegueWithIdentifier(kSegue_ReminderSetting, sender: self)
       
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        self.navigationController?.navigationBarHidden = false
        if segue.identifier == kSegue_ReminderSetting{
            let nextViewController  = segue.destinationViewController as! ReminderViewController
            nextViewController.title = "Fruits"
            nextViewController.stageId = stageId
        }
    }

}
