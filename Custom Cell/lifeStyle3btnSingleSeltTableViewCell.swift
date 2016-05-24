//
//  lifeStyle3btnSingleSeltTableViewCell.swift
//  LIveNutriFit
//
//  Created by pragya on 22/04/16.
//  Copyright © 2016 ankit deshwal. All rights reserved.
//

import UIKit

class lifeStyle3btnSingleSeltTableViewCell: UITableViewCell {
    @IBOutlet weak var lblCellHeader: UILabel!
    
    @IBOutlet weak var btnFirst: UIButton!

    @IBOutlet weak var btnSecond: UIButton!
    
    @IBOutlet weak var btnThird: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        btnFirst.backgroundColor = UIColor.whiteColor()
        btnFirst.selected = false
        btnFirst.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        btnSecond.backgroundColor = UIColor.whiteColor()
        btnSecond.selected = false
        btnSecond.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        btnThird.backgroundColor = UIColor.whiteColor()
        btnThird.selected = false
        btnThird.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func btnFirstTappedAction(sender: AnyObject) {
        if let button = sender as? UIButton {
            if !button.selected{
                btnFirst.selected = true
                btnFirst.backgroundColor = kColor_ButtonSelectedColor
                btnFirst.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Selected)
                btnSecond.selected = false
                btnSecond.backgroundColor = UIColor.whiteColor()
                btnThird.selected = false
                btnThird.backgroundColor = UIColor.whiteColor()
            }
        }
    }
    @IBAction func btnSecondTappedAction(sender: AnyObject) {
        if let button = sender as? UIButton {
            if !button.selected{
                btnFirst.selected = false
                btnFirst.backgroundColor = UIColor.whiteColor()
                btnSecond.selected = true
                btnSecond.backgroundColor = kColor_ButtonSelectedColor
                btnSecond.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Selected)
                btnThird.selected = false
                btnThird.backgroundColor = UIColor.whiteColor()
            }
        }
    }
    @IBAction func btnThirdTappedAction(sender: AnyObject) {
        if let button = sender as? UIButton {
            if !button.selected{
                btnFirst.selected = false
                btnFirst.backgroundColor = UIColor.whiteColor()
                btnSecond.selected = false
                btnSecond.backgroundColor = UIColor.whiteColor()
                btnThird.selected = true
                btnThird.backgroundColor = kColor_ButtonSelectedColor
                btnThird.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Selected)
                
            }
        }
    }
    
 

}
