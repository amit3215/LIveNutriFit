//
//  WeightLossJourneyTableViewCell.swift
//  LIveNutriFit
//
//  Created by pragya on 19/04/16.
//  Copyright © 2016 ankit deshwal. All rights reserved.
//

import UIKit

class WeightLossJourneyTableViewCell: UITableViewCell {
    @IBOutlet weak var lblCellTitle: UILabel!
    // veryEasy 
    @IBOutlet weak var lbl_VeryEasy: UILabel!
    @IBOutlet weak var btnVeryEasy: UIButton!
    // easy
    @IBOutlet weak var lbl_Easy: UILabel!
    @IBOutlet weak var btn_Easy: UIButton!
    // medium
    @IBOutlet weak var lbl_Moderate: UILabel!
    @IBOutlet weak var btn_moderate: UIButton!
    // hard
    @IBOutlet weak var btn_hard: UIButton!
    @IBOutlet weak var lbl_hard: UILabel!
    // not recomended
    @IBOutlet weak var lbl_notRecomended: UILabel!
    @IBOutlet weak var btn_notRecomended: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        lbl_VeryEasy.text = "very Easy"
        btnVeryEasy.setTitle("Approx 1 - 2 Kg/Month", forState: UIControlState.Normal)
        lbl_Easy.text = "Easy"
         btn_Easy.setTitle("Approx 2 - 3 Kg/Month", forState: UIControlState.Normal)
        lbl_Moderate.text = "Moderate"
         btn_moderate.setTitle("Approx 4 - 6 Kg/Month", forState: UIControlState.Normal)
        lbl_hard.text = "Hard"
         btn_hard.setTitle("Approx 6 - 10 Kg/Month", forState: UIControlState.Normal)
        lbl_notRecomended.text = "Not\nRecommended"
         btn_notRecomended.setTitle("Not Recommended", forState: UIControlState.Normal)
       // SelectedButton(btnVeryEasy)
        let weightToLossPerMonth = LiveNutriFitApi.sharedInstance.weightToLoss/Double(LiveNutriFitApi.sharedInstance.noOFMonth)
        byDefaultSelectedWeightLoosJourny(weightToLossPerMonth)
        NSNotificationCenter.defaultCenter().addObserver(self, selector:#selector(heightPickerTableViewCell.methodOfReceivedNotification(_:)), name:"weightLossJourney" , object: nil)
    }
      func methodOfReceivedNotification(notification: NSNotification){
        let weightToLossPerMonth = LiveNutriFitApi.sharedInstance.weightToLoss/Double(LiveNutriFitApi.sharedInstance.noOFMonth)
        byDefaultSelectedWeightLoosJourny(weightToLossPerMonth)

    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func byDefaultSelectedWeightLoosJourny(noOfweightAtMonth:Double){
        switch noOfweightAtMonth {
        case 0...2:
            SelectedButton(btnVeryEasy)
            DeselectButton(btn_Easy)
            DeselectButton(btn_hard)
            DeselectButton(btn_moderate)
            DeselectButton(btn_notRecomended)
          case 2...3:
            SelectedButton(btn_Easy)
            // selected
            DeselectButton(btnVeryEasy)
            DeselectButton(btn_hard)
            DeselectButton(btn_moderate)
            DeselectButton(btn_notRecomended)
          case 4...6:
            SelectedButton(btn_moderate)
            // selected
            DeselectButton(btnVeryEasy)
            DeselectButton(btn_hard)
            DeselectButton(btn_Easy)
            DeselectButton(btn_notRecomended)
        case 6...10:
            SelectedButton(btn_hard)
            // selected
            DeselectButton(btnVeryEasy)
            DeselectButton(btn_moderate)
            DeselectButton(btn_Easy)
            DeselectButton(btn_notRecomended)
            
        default:
            SelectedButton(btn_notRecomended)
            // selected
            DeselectButton(btnVeryEasy)
            DeselectButton(btn_moderate)
            DeselectButton(btn_Easy)
            DeselectButton(btn_hard)
            
        }
    }

    @IBAction func VeryEasyButtonTappedAction(sender: AnyObject) {
        if let button = sender as? UIButton {
            if !button.selected{
                // selected
                SelectedButton(btnVeryEasy)
                // selected
                DeselectButton(btn_Easy)
                DeselectButton(btn_hard)
                DeselectButton(btn_moderate)
                DeselectButton(btn_notRecomended)
            }}
        
        //btnVeryEasy.titleLabel?.textColor = kColor_navigationBar
    }
    
    @IBAction func EasyButtonTappedAction(sender: AnyObject) {
        if let button = sender as? UIButton {
            if !button.selected{
                // selected
                SelectedButton(btn_Easy)
                // selected
                DeselectButton(btnVeryEasy)
                DeselectButton(btn_hard)
                DeselectButton(btn_moderate)
                DeselectButton(btn_notRecomended)
            }}
    }
    
    @IBAction func mediumButtonTappedAction(sender: AnyObject) {
        if let button = sender as? UIButton {
            if !button.selected{
                // selected
                SelectedButton(btn_moderate)
                // selected
                DeselectButton(btnVeryEasy)
                DeselectButton(btn_hard)
                DeselectButton(btn_Easy)
                DeselectButton(btn_notRecomended)
            }}
        
    }
    @IBAction func HardButtonTappedAction(sender: AnyObject) {
        if let button = sender as? UIButton {
            if !button.selected{
                // selected
                SelectedButton(btn_hard)
                // selected
                DeselectButton(btnVeryEasy)
                DeselectButton(btn_moderate)
                DeselectButton(btn_Easy)
                DeselectButton(btn_notRecomended)
            }}
    }
    @IBAction func NotRecomendedButtonTappedAction(sender: AnyObject) {
        if let button = sender as? UIButton {
            if !button.selected{
                // selected
                SelectedButton(btn_notRecomended)
                // selected
                DeselectButton(btnVeryEasy)
                DeselectButton(btn_moderate)
                DeselectButton(btn_Easy)
                DeselectButton(btn_hard)
            }}
    }
    func SelectedButton(button:UIButton){
        button.selected = true
        //btnVeryEasy.titleLabel?.textColor = kColor_navigationBar
        button.setTitleColor(kColor_navigationBar, forState: UIControlState.Selected)
        button.titleLabel!.font =  UIFont(name: "HelveticaNeue", size: 15)
    }
    func DeselectButton(button:UIButton){
        button.selected = false
        //btnVeryEasy.titleLabel?.textColor = kColor_navigationBar
        button.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        button.titleLabel!.font =  UIFont(name: "HelveticaNeue", size: 12)
    }
    
}
