//
//  PersonalDobTableViewCell.swift
//  LIveNutriFit
//
//  Created by pragya on 10/04/16.
//  Copyright © 2016 ankit deshwal. All rights reserved.
//

import UIKit

class PersonalDobTableViewCell: UITableViewCell,UITextFieldDelegate {
    
    @IBOutlet weak var lbl_cellTitle: UILabel!
    @IBOutlet weak var txtfld_DobPicker: MKTextField!
    override func awakeFromNib() {
        
        super.awakeFromNib()
        lbl_cellTitle.text = "Date of Birth"
        txtfld_DobPicker.layer.borderColor = UIColor.clearColor().CGColor
        txtfld_DobPicker.bottomBorderEnabled = true
        txtfld_DobPicker.tintAdjustmentMode = UIViewTintAdjustmentMode.Normal
        txtfld_DobPicker.placeholder = kPlaceholderDateOfBirth
        txtfld_DobPicker.floatingLabelTextColor =  kColor_navigationBar
        txtfld_DobPicker.isMandatory = false
        txtfld_DobPicker.delegate = self
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        resign()
  DatePickerDialog().show("Choose your Date", doneButtonTitle: "Done", cancelButtonTitle: "Cancel", datePickerMode: .Date) {
            (date) -> Void in
            let calendar = NSCalendar.currentCalendar()
            let components = calendar.components([.Day , .Month , .Year], fromDate: date)
            LiveNutriFitApi.sharedInstance.dateOfBirth = "\(components.day)-\(components.month)-\(components.year)"
            self.txtfld_DobPicker.text = "\(components.day)-\(components.month)-\(components.year)"
        }
     return false
    }
    func resign() {
        txtfld_DobPicker.resignFirstResponder()
    }
}
