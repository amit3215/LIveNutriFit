//
//  EightbuttonTableViewCell.swift
//  LIveNutriFit
//
//  Created by pragya on 24/04/16.
//  Copyright © 2016 ankit deshwal. All rights reserved.
//

import UIKit

class EightbuttonTableViewCell: UITableViewCell {
    
    @IBOutlet weak var lblCellHeader: UILabel!
    
    @IBOutlet weak var btn1: UIButton!
     @IBOutlet weak var btn2: UIButton!
     @IBOutlet weak var btn3: UIButton!
     @IBOutlet weak var btn4: UIButton!
     @IBOutlet weak var btn5: UIButton!
     @IBOutlet weak var btn6: UIButton!
     @IBOutlet weak var btn7: UIButton!
     @IBOutlet weak var btn8: UIButton!
    

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
        btn6.backgroundColor = UIColor.whiteColor()
        btn6.selected = false
        btn6.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        btn7.backgroundColor = UIColor.whiteColor()
        btn7.selected = false
        btn7.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        btn8.backgroundColor = UIColor.whiteColor()
        btn8.selected = false
        btn8.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func btn1TappedActionMethod(sender: AnyObject) {
        if let button = sender as? UIButton {
            if !button.selected{
                btn1.selected = true
                btn1.backgroundColor = kColor_ButtonSelectedColor
                btn1.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Selected)
            }else{
                btn1.selected = false
                btn1.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
                btn1.backgroundColor = UIColor.whiteColor()
            }}
    }
    @IBAction func btn2TappedActionMethod(sender: AnyObject) {
        if let button = sender as? UIButton {
            if !button.selected{
                btn2.selected = true
                btn2.backgroundColor = kColor_ButtonSelectedColor
                btn2.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Selected)
            }else{
                btn2.selected = false
                btn2.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
                btn2.backgroundColor = UIColor.whiteColor()
            }}
    }
   
    @IBAction func btn3TappedActionMethod(sender: AnyObject) {
        if let button = sender as? UIButton {
            if !button.selected{
                btn3.selected = true
                btn3.backgroundColor = kColor_ButtonSelectedColor
                btn3.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Selected)
            }else{
                btn3.selected = false
                btn3.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
                btn3.backgroundColor = UIColor.whiteColor()
            }}
    }
    @IBAction func btn4TappedActionMethod(sender: AnyObject) {
        if let button = sender as? UIButton {
            if !button.selected{
                btn4.selected = true
                btn4.backgroundColor = kColor_ButtonSelectedColor
                btn4.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Selected)
            }else{
                btn4.selected = false
                btn4.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
                btn4.backgroundColor = UIColor.whiteColor()
            }}
    }
    @IBAction func btn5TappedActionMethod(sender: AnyObject) {
        if let button = sender as? UIButton {
            if !button.selected{
                btn5.selected = true
                btn5.backgroundColor = kColor_ButtonSelectedColor
                btn5.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Selected)
            }else{
                btn5.selected = false
                btn5.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
                btn5.backgroundColor = UIColor.whiteColor()
            }}
    }
    @IBAction func btn6TappedActionMethod(sender: AnyObject) {
        if let button = sender as? UIButton {
            if !button.selected{
                btn6.selected = true
                btn6.backgroundColor = kColor_ButtonSelectedColor
                btn6.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Selected)
            }else{
                btn6.selected = false
                btn6.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
                btn6.backgroundColor = UIColor.whiteColor()
            }}
    }
    @IBAction func btn7TappedActionMethod(sender: AnyObject) {
        if let button = sender as? UIButton {
            if !button.selected{
                btn7.selected = true
                btn7.backgroundColor = kColor_ButtonSelectedColor
                btn7.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Selected)
            }else{
                btn7.selected = false
                btn7.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
                btn7.backgroundColor = UIColor.whiteColor()
            }}
    }
    @IBAction func btn8TappedActionMethod(sender: AnyObject) {
        if let button = sender as? UIButton {
            if !button.selected{
                btn8.selected = true
                btn8.backgroundColor = kColor_ButtonSelectedColor
                btn8.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Selected)
            }else{
                btn8.selected = false
                btn8.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
                btn8.backgroundColor = UIColor.whiteColor()
            }}
    }

}
