//
//  WeightTypeSelectionTableViewCell.swift
//  LIveNutriFit
//
//  Created by pragya on 13/04/16.
//  Copyright © 2016 ankit deshwal. All rights reserved.
//
protocol personal2Delegate {
    func WeightvalueChanged()
}
import UIKit

class WeightTypeSelectionTableViewCell: UITableViewCell {
    @IBOutlet weak var lbl_cellTitle: UILabel!
    @IBOutlet weak var lbl_firstType: UILabel!
    @IBOutlet weak var lbl_SecondType: UILabel!
    @IBOutlet weak var btn_FisrtTypeSelection: UIButton!
    @IBOutlet weak var btn_SecondTypeSelection: UIButton!
    var delegate: personal2Delegate!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        btn_FisrtTypeSelection.setBackgroundImage(UIImage(named: "selectedRadioButton"), forState: UIControlState.Normal)
        btn_SecondTypeSelection.setBackgroundImage(UIImage(named: "unselectedRadioButton"), forState: UIControlState.Normal)
    }
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func FisrtRadioButtonSelection(sender: AnyObject) {
        if let button = sender as? UIButton {
        if !button.selected{
        btn_FisrtTypeSelection.setBackgroundImage(UIImage(named: "selectedRadioButton"), forState: UIControlState.Normal)
        btn_SecondTypeSelection.setBackgroundImage(UIImage(named: "unselectedRadioButton"), forState: UIControlState.Normal)
        LiveNutriFitApi.sharedInstance.weightPrefredUnit = true
            let currentWeightInkg:Double = LiveNutriFitApi.sharedInstance.currentWeight/2.2
            let TargetWeightInkg:Double = LiveNutriFitApi.sharedInstance.targerWeight/2.2
            LiveNutriFitApi.sharedInstance.currentWeight = currentWeightInkg
            LiveNutriFitApi.sharedInstance.targerWeight = TargetWeightInkg
            
            delegate.WeightvalueChanged()
        }
        }
    }
    @IBAction func SecondRadioButtonSelection(sender: AnyObject) {
        if let button = sender as? UIButton {
            if !button.selected{
                btn_SecondTypeSelection.setBackgroundImage(UIImage(named: "selectedRadioButton"), forState: UIControlState.Normal)
                btn_FisrtTypeSelection.setBackgroundImage(UIImage(named: "unselectedRadioButton"), forState: UIControlState.Normal)
                LiveNutriFitApi.sharedInstance.weightPrefredUnit = false
                let currentWeightInlbs:Double = Double(LiveNutriFitApi.sharedInstance.currentWeight)*2.2
                let TargetWeightInlbs:Double = Double(LiveNutriFitApi.sharedInstance.targerWeight)*2.2
                LiveNutriFitApi.sharedInstance.currentWeight = currentWeightInlbs
                LiveNutriFitApi.sharedInstance.targerWeight = TargetWeightInlbs
                 delegate.WeightvalueChanged()
            }
        }
    }
}
