//
//  sliderTableViewCell.swift
//  LIveNutriFit
//
//  Created by pragya on 18/04/16.
//  Copyright © 2016 ankit deshwal. All rights reserved.
//

import UIKit
protocol CustomSliderCellDelegate {
    func sliderDidChangeValue(newSliderValue: String,typeOfSender sender:AnyObject)
}
class sliderTableViewCell: UITableViewCell {
    
    @IBOutlet weak var sliderHeightSlider: CustomSliderView!
    
    @IBOutlet weak var lblCellTitle: UILabel!
    
    @IBOutlet weak var lblSliderValue: UILabel!
    
    
    var delegate: CustomSliderCellDelegate!
 
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        if sliderHeightSlider != nil {
            sliderHeightSlider.minimumValue = 1.0
            sliderHeightSlider.maximumValue = 100.0
            sliderHeightSlider.value = 0.0
            sliderHeightSlider.markColor = UIColor.whiteColor().colorWithAlphaComponent(0.5)
            sliderHeightSlider.markWidth = 0.5
            sliderHeightSlider.selectedBarColor = kColor_ButtonSelectedColor
            sliderHeightSlider.unselectedBarColor = UIColor.grayColor()
        }


    }
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func sliderValueChange(sender: AnyObject) {
        if delegate != nil {
            delegate.sliderDidChangeValue("\(Int(sliderHeightSlider.value))", typeOfSender: sender)
        }

    }

}
