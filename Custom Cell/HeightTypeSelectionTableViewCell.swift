//
//  HeightTypeSelectionTableViewCell.swift
//  LIveNutriFit
//
//  Created by pragya on 17/04/16.
//  Copyright © 2016 ankit deshwal. All rights reserved.
//

import UIKit
protocol personal2Delegateheight {
    func heightPrefredValueChanged()
}
class HeightTypeSelectionTableViewCell: UITableViewCell {
    @IBOutlet weak var lblcellTitle: UILabel!
    @IBOutlet weak var btnInch: UIButton!
    @IBOutlet weak var lblInches: UILabel!
    @IBOutlet weak var lblCms: UILabel!
    @IBOutlet weak var btnCms: UIButton!
     var delegate: personal2Delegateheight!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        btnInch.setBackgroundImage(UIImage(named: "selectedRadioButton"), forState: UIControlState.Normal)
        btnCms.setBackgroundImage(UIImage(named: "unselectedRadioButton"), forState: UIControlState.Normal)
    }
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func inchesButtonTappedAction(sender: AnyObject) {
        if let button = sender as? UIButton {
            if !button.selected{
                btnInch.setBackgroundImage(UIImage(named: "selectedRadioButton"), forState: UIControlState.Normal)
                btnCms.setBackgroundImage(UIImage(named: "unselectedRadioButton"), forState: UIControlState.Normal)
                LiveNutriFitApi.sharedInstance.heightPrefredUnit = true
                
                delegate.heightPrefredValueChanged()
            }
        }
    }
    
    @IBAction func cmsButtonTappedAction(sender: AnyObject) {
        if let button = sender as? UIButton {
            if !button.selected{
                btnCms.setBackgroundImage(UIImage(named: "selectedRadioButton"), forState: UIControlState.Normal)
                btnInch.setBackgroundImage(UIImage(named: "unselectedRadioButton"), forState: UIControlState.Normal)
                LiveNutriFitApi.sharedInstance.heightPrefredUnit = false
                delegate.heightPrefredValueChanged()
            }
        }
    }
}
