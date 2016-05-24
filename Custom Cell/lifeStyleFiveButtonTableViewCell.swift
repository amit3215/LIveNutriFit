//
//  lifeStyleFiveButtonTableViewCell.swift
//  LIveNutriFit
//
//  Created by pragya on 11/04/16.
//  Copyright © 2016 ankit deshwal. All rights reserved.
//

import UIKit

class lifeStyleFiveButtonTableViewCell: UITableViewCell {
    
    @IBOutlet weak var lbl_CellTitle: UILabel!
    
    @IBOutlet weak var btn_firstPrefrence: UIButton!
    
    @IBOutlet weak var btn_SecondPrefrence: UIButton!
    
    @IBOutlet weak var btn_ThirdPrefrence: UIButton!
    
    @IBOutlet weak var btn_ForthPrefrence: UIButton!
    
    @IBOutlet weak var btn_FifthPrefrence: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        btn_firstPrefrence.backgroundColor = UIColor.whiteColor()
        btn_firstPrefrence.selected = false
        btn_firstPrefrence.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        btn_SecondPrefrence.backgroundColor = UIColor.whiteColor()
        btn_SecondPrefrence.selected = false
        btn_SecondPrefrence.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        btn_ThirdPrefrence.backgroundColor = UIColor.whiteColor()
        btn_ThirdPrefrence.selected = false
        btn_ThirdPrefrence.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        btn_ForthPrefrence.backgroundColor = UIColor.whiteColor()
        btn_ForthPrefrence.selected = false
        btn_ForthPrefrence.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        btn_FifthPrefrence.backgroundColor = UIColor.whiteColor()
        btn_FifthPrefrence.selected = false
        btn_FifthPrefrence.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func firstButtonSelected(sender: AnyObject) {
       if let button = sender as? UIButton {
        if !button.selected{
           btn_firstPrefrence.selected = true
           btn_firstPrefrence.backgroundColor = kColor_ButtonSelectedColor
           btn_firstPrefrence.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Selected)
           btn_SecondPrefrence.selected = false
           btn_SecondPrefrence.backgroundColor = UIColor.whiteColor()
           btn_ThirdPrefrence.selected = false
           btn_ThirdPrefrence.backgroundColor = UIColor.whiteColor()
           btn_ForthPrefrence.selected = false
           btn_ForthPrefrence.backgroundColor = UIColor.whiteColor()
           btn_FifthPrefrence.selected = false
           btn_FifthPrefrence.backgroundColor = UIColor.whiteColor()
        }}
    }
    @IBAction func secondButtonSelected(sender: AnyObject) {
        if let button = sender as? UIButton {
            if !button.selected{
                btn_firstPrefrence.selected = false
                btn_firstPrefrence.backgroundColor = UIColor.whiteColor()
                btn_SecondPrefrence.selected = true
                btn_SecondPrefrence.backgroundColor = kColor_ButtonSelectedColor
                btn_SecondPrefrence.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Selected)
                btn_ThirdPrefrence.selected = false
                btn_ThirdPrefrence.backgroundColor = UIColor.whiteColor()
                btn_ForthPrefrence.selected = false
                btn_ForthPrefrence.backgroundColor = UIColor.whiteColor()
                btn_FifthPrefrence.selected = false
                btn_FifthPrefrence.backgroundColor = UIColor.whiteColor()
            }}
    }
    @IBAction func thirdButtonSelected(sender: AnyObject) {
        if let button = sender as? UIButton {
            if !button.selected{
                btn_firstPrefrence.selected = false
                btn_firstPrefrence.backgroundColor = UIColor.whiteColor()
                btn_SecondPrefrence.selected = false
                btn_SecondPrefrence.backgroundColor = UIColor.whiteColor()
                btn_ThirdPrefrence.selected = true
                btn_ThirdPrefrence.backgroundColor = kColor_ButtonSelectedColor
                btn_ThirdPrefrence.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Selected)
                btn_ForthPrefrence.selected = false
                btn_ForthPrefrence.backgroundColor = UIColor.whiteColor()
                btn_FifthPrefrence.selected = false
                btn_FifthPrefrence.backgroundColor = UIColor.whiteColor()
            }}
    }
    @IBAction func forthButtonSelected(sender: AnyObject) {
        if let button = sender as? UIButton {
            if !button.selected{
                btn_firstPrefrence.selected = false
                btn_firstPrefrence.backgroundColor = UIColor.whiteColor()
                btn_SecondPrefrence.selected = false
                btn_SecondPrefrence.backgroundColor = UIColor.whiteColor()
                btn_ThirdPrefrence.selected = false
                btn_ThirdPrefrence.backgroundColor = UIColor.whiteColor()
                btn_ForthPrefrence.selected = true
                btn_ForthPrefrence.backgroundColor = kColor_ButtonSelectedColor
                btn_ForthPrefrence.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Selected)
                btn_FifthPrefrence.selected = false
                btn_FifthPrefrence.backgroundColor = UIColor.whiteColor()
            }}
    }
    @IBAction func fifthButtonSelected(sender: AnyObject) {
        if let button = sender as? UIButton {
            if !button.selected{
                btn_firstPrefrence.selected = false
                btn_firstPrefrence.backgroundColor = UIColor.whiteColor()
                btn_SecondPrefrence.selected = false
                btn_SecondPrefrence.backgroundColor = UIColor.whiteColor()
                btn_ThirdPrefrence.selected = false
                btn_ThirdPrefrence.backgroundColor = UIColor.whiteColor()
                btn_ForthPrefrence.selected = false
                btn_ForthPrefrence.backgroundColor = UIColor.whiteColor()
                btn_FifthPrefrence.selected = true
                btn_FifthPrefrence.backgroundColor = kColor_ButtonSelectedColor
                btn_FifthPrefrence.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Selected)
            }}
    }
    
    

}
