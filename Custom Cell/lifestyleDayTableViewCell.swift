//
//  lifestyleDayTableViewCell.swift
//  LIveNutriFit
//
//  Created by pragya on 22/04/16.
//  Copyright © 2016 ankit deshwal. All rights reserved.
//

import UIKit

class lifestyleDayTableViewCell: UITableViewCell {
    @IBOutlet weak var lblcellHeader: UILabel!

    @IBOutlet weak var btnDay1: UIButton!
    @IBOutlet weak var btnDay2: UIButton!
    @IBOutlet weak var btnDay3: UIButton!
    @IBOutlet weak var btnDay4: UIButton!
    @IBOutlet weak var btnDay5: UIButton!
    @IBOutlet weak var btnDay6: UIButton!
    @IBOutlet weak var btnDay7: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func btn1TappedAction(sender: AnyObject) {
        if let button = sender as? UIButton {
        if !button.selected{
            //selected
            btnDay1.selected = true
            btnDay1.backgroundColor = kColor_ButtonSelectedColor
            btnDay1.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Selected)
            //un selected
            btnDay2.selected = false
            btnDay2.backgroundColor = UIColor.whiteColor()
            btnDay3.selected = false
            btnDay3.backgroundColor = UIColor.whiteColor()
            btnDay4.selected = false
            btnDay4.backgroundColor = UIColor.whiteColor()
            btnDay5.selected = false
            btnDay5.backgroundColor = UIColor.whiteColor()
            btnDay6.selected = false
            btnDay6.backgroundColor = UIColor.whiteColor()
            btnDay7.selected = false
            btnDay7.backgroundColor = UIColor.whiteColor()
        }}
    }
    @IBAction func btn2TappedAction(sender: AnyObject) {
        if let button = sender as? UIButton {
            if !button.selected{
                //selected
                btnDay2.selected = true
                btnDay2.backgroundColor = kColor_ButtonSelectedColor
                btnDay2.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Selected)
                //un selected
                btnDay1.selected = false
                btnDay1.backgroundColor = UIColor.whiteColor()
                btnDay3.selected = false
                btnDay3.backgroundColor = UIColor.whiteColor()
                btnDay4.selected = false
                btnDay4.backgroundColor = UIColor.whiteColor()
                btnDay5.selected = false
                btnDay5.backgroundColor = UIColor.whiteColor()
                btnDay6.selected = false
                btnDay6.backgroundColor = UIColor.whiteColor()
                btnDay7.selected = false
                btnDay7.backgroundColor = UIColor.whiteColor()
            }}
    }
    @IBAction func btn3TappedAction(sender: AnyObject) {
        if let button = sender as? UIButton {
            if !button.selected{
                //selected
                btnDay3.selected = true
                btnDay3.backgroundColor = kColor_ButtonSelectedColor
                btnDay3.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Selected)
                //un selected
                btnDay1.selected = false
                btnDay1.backgroundColor = UIColor.whiteColor()
                btnDay2.selected = false
                btnDay2.backgroundColor = UIColor.whiteColor()
                btnDay4.selected = false
                btnDay4.backgroundColor = UIColor.whiteColor()
                btnDay5.selected = false
                btnDay5.backgroundColor = UIColor.whiteColor()
                btnDay6.selected = false
                btnDay6.backgroundColor = UIColor.whiteColor()
                btnDay7.selected = false
                btnDay7.backgroundColor = UIColor.whiteColor()
            }}
    }
    @IBAction func btn4TappedAction(sender: AnyObject) {
        if let button = sender as? UIButton {
            if !button.selected{
                //selected
                btnDay4.selected = true
                btnDay4.backgroundColor = kColor_ButtonSelectedColor
                btnDay4.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Selected)
                //un selected
                btnDay1.selected = false
                btnDay1.backgroundColor = UIColor.whiteColor()
                btnDay2.selected = false
                btnDay2.backgroundColor = UIColor.whiteColor()
                btnDay3.selected = false
                btnDay3.backgroundColor = UIColor.whiteColor()
                btnDay5.selected = false
                btnDay5.backgroundColor = UIColor.whiteColor()
                btnDay6.selected = false
                btnDay6.backgroundColor = UIColor.whiteColor()
                btnDay7.selected = false
                btnDay7.backgroundColor = UIColor.whiteColor()
            }}
    }
    @IBAction func btn5TappedAction(sender: AnyObject) {
        if let button = sender as? UIButton {
            if !button.selected{
                //selected
                btnDay5.selected = true
                btnDay5.backgroundColor = kColor_ButtonSelectedColor
                btnDay5.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Selected)
                //un selected
                btnDay1.selected = false
                btnDay1.backgroundColor = UIColor.whiteColor()
                btnDay2.selected = false
                btnDay2.backgroundColor = UIColor.whiteColor()
                btnDay3.selected = false
                btnDay3.backgroundColor = UIColor.whiteColor()
                btnDay4.selected = false
                btnDay4.backgroundColor = UIColor.whiteColor()
                btnDay6.selected = false
                btnDay6.backgroundColor = UIColor.whiteColor()
                btnDay7.selected = false
                btnDay7.backgroundColor = UIColor.whiteColor()
            }}
    }
    @IBAction func btn6TappedAction(sender: AnyObject) {
        if let button = sender as? UIButton {
            if !button.selected{
                //selected
                btnDay6.selected = true
                btnDay6.backgroundColor = kColor_ButtonSelectedColor
                btnDay6.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Selected)
                //un selected
                btnDay1.selected = false
                btnDay1.backgroundColor = UIColor.whiteColor()
                btnDay2.selected = false
                btnDay2.backgroundColor = UIColor.whiteColor()
                btnDay3.selected = false
                btnDay3.backgroundColor = UIColor.whiteColor()
                btnDay4.selected = false
                btnDay4.backgroundColor = UIColor.whiteColor()
                btnDay5.selected = false
                btnDay5.backgroundColor = UIColor.whiteColor()
                btnDay7.selected = false
                btnDay7.backgroundColor = UIColor.whiteColor()
            }}
    }
    @IBAction func btn7TappedAction(sender: AnyObject) {
        if let button = sender as? UIButton {
            if !button.selected{
                //selected
                btnDay7.selected = true
                btnDay7.backgroundColor = kColor_ButtonSelectedColor
                btnDay7.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Selected)
                //un selected
                btnDay1.selected = false
                btnDay1.backgroundColor = UIColor.whiteColor()
                btnDay2.selected = false
                btnDay2.backgroundColor = UIColor.whiteColor()
                btnDay3.selected = false
                btnDay3.backgroundColor = UIColor.whiteColor()
                btnDay4.selected = false
                btnDay4.backgroundColor = UIColor.whiteColor()
                btnDay5.selected = false
                btnDay5.backgroundColor = UIColor.whiteColor()
                btnDay6.selected = false
                btnDay6.backgroundColor = UIColor.whiteColor()
                
            }}
    }
    

}
