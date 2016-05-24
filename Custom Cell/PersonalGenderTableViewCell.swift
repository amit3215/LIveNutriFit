//
//  PersonalGenderTableViewCell.swift
//  LIveNutriFit
//
//  Created by pragya on 10/04/16.
//  Copyright © 2016 ankit deshwal. All rights reserved.
//

import UIKit
class PersonalGenderTableViewCell: UITableViewCell {
    @IBOutlet weak var lbl_CellTitle: UILabel!
    @IBOutlet weak var lbl_maleGender: UILabel!
    
    @IBOutlet weak var button_maleGender: UIButton!
    @IBOutlet weak var lbl_femaleGender: UILabel!
    
    @IBOutlet weak var btn_femaleGender: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        lbl_CellTitle.text = "Gender"
        lbl_maleGender.text = "Male"
        lbl_femaleGender.text = "Female"
        btn_femaleGender.selected = false
        button_maleGender.selected = true
        button_maleGender.backgroundColor = kColor_ButtonSelectedColor
        btn_femaleGender.backgroundColor = UIColor.whiteColor()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func maleGenderButtonSelectOrDeselect(sender: AnyObject) {
            button_maleGender.selected = true
            button_maleGender.backgroundColor = kColor_ButtonSelectedColor
            btn_femaleGender.selected = false
            btn_femaleGender.backgroundColor = UIColor.whiteColor()
        LiveNutriFitApi.sharedInstance.genderType = true

    }
    @IBAction func femaleButtonSelectOrdeselect(sender: AnyObject) {
            btn_femaleGender.selected = true
            btn_femaleGender.backgroundColor = kColor_ButtonSelectedColor
            button_maleGender.selected = false
            button_maleGender.backgroundColor = UIColor.whiteColor()
            LiveNutriFitApi.sharedInstance.genderType = false
    }
}
