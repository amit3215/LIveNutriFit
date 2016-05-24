//
//  DailySleepHoursTableViewCell.swift
//  LIveNutriFit
//
//  Created by pragya on 23/04/16.
//  Copyright © 2016 ankit deshwal. All rights reserved.
//

import UIKit

class DailySleepHoursTableViewCell: UITableViewCell {
    @IBOutlet weak var lblCellHeader: UILabel!
    
    @IBOutlet weak var btn1: UIButton!
     @IBOutlet weak var btn2: UIButton!
     @IBOutlet weak var btn3: UIButton!
     @IBOutlet weak var btn4: UIButton!
     @IBOutlet weak var btn5: UIButton!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        btn1.backgroundColor = UIColor.whiteColor()
        btn1.selected = false
        btn1.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        btn2.backgroundColor = UIColor.whiteColor()
        btn2.selected = false
        btn2.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        btn3.backgroundColor = UIColor.whiteColor()
        btn3.selected = false
        btn3.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        btn4.backgroundColor = UIColor.whiteColor()
        btn4.selected = false
        btn4.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        btn5.backgroundColor = UIColor.whiteColor()
        btn5.selected = false
        btn5.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func btn1TappedAction(sender: AnyObject) {
    if let button = sender as? UIButton {
        if !button.selected{
            // selected
            btn1.selected = true
            btn1.backgroundColor = kColor_ButtonSelectedColor
            btn1.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Selected)
            //unselected
            btn2.selected = false
            btn2.backgroundColor = UIColor.whiteColor()
            btn3.selected = false
            btn3.backgroundColor = UIColor.whiteColor()
            btn4.selected = false
            btn4.backgroundColor = UIColor.whiteColor()
            btn5.selected = false
            btn5.backgroundColor = UIColor.whiteColor()
        }
    }
    }
    @IBAction func btn2TappedAction(sender: AnyObject) {
    if let button = sender as? UIButton {
        if !button.selected{
            // selected
            btn2.selected = true
            btn2.backgroundColor = kColor_ButtonSelectedColor
            btn2.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Selected)
            //unselected
            btn1.selected = false
            btn1.backgroundColor = UIColor.whiteColor()
            btn3.selected = false
            btn3.backgroundColor = UIColor.whiteColor()
            btn4.selected = false
            btn4.backgroundColor = UIColor.whiteColor()
            btn5.selected = false
            btn5.backgroundColor = UIColor.whiteColor()
        }
    }
    }
    @IBAction func btn3TappedAction(sender: AnyObject) {
    if let button = sender as? UIButton {
        if !button.selected{
            // selected
            btn3.selected = true
            btn3.backgroundColor = kColor_ButtonSelectedColor
            btn3.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Selected)
            //unselected btn2.selected = false
            btn2.selected = false
            btn2.backgroundColor = UIColor.whiteColor()
            btn1.selected = false
            btn1.backgroundColor = UIColor.whiteColor()
            btn4.selected = false
            btn4.backgroundColor = UIColor.whiteColor()
            btn5.selected = false
            btn5.backgroundColor = UIColor.whiteColor()
        }
    }
    }
    @IBAction func btn4TappedAction(sender: AnyObject) {
    if let button = sender as? UIButton {
        if !button.selected{
            btn4.selected = true
            btn4.backgroundColor = kColor_ButtonSelectedColor
            btn4.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Selected)
            btn2.selected = false
            btn2.backgroundColor = UIColor.whiteColor()
            btn3.selected = false
            btn3.backgroundColor = UIColor.whiteColor()
            btn1.selected = false
            btn1.backgroundColor = UIColor.whiteColor()
            btn5.selected = false
            btn5.backgroundColor = UIColor.whiteColor()
        }
    }
    }
    @IBAction func btn5TappedAction(sender: AnyObject) {
    if let button = sender as? UIButton {
        if !button.selected{
            btn5.selected = true
            btn5.backgroundColor = kColor_ButtonSelectedColor
            btn5.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Selected)
            btn2.selected = false
            btn2.backgroundColor = UIColor.whiteColor()
            btn3.selected = false
            btn3.backgroundColor = UIColor.whiteColor()
            btn4.selected = false
            btn4.backgroundColor = UIColor.whiteColor()
            btn1.selected = false
            btn1.backgroundColor = UIColor.whiteColor()
        }
    }
    }
}
