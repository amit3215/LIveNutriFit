//
//  CoachSliderTableViewCell.swift
//  LIveNutriFit
//
//  Created by pragya on 15/05/16.
//  Copyright © 2016 ankit deshwal. All rights reserved.
//

import UIKit

class CoachSliderTableViewCell: UITableViewCell {
    @IBOutlet weak var lblCellHeader: UILabel!
    @IBOutlet weak var slider: CustomSliderView!
    @IBOutlet weak var lblCellContent: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        if slider != nil {
            slider.minimumValue = 0.0
            slider.maximumValue = 100.0
            slider.value = 0.0
           // slider.markColor = UIColor.whiteColor().colorWithAlphaComponent(0.5)
           // slider.markWidth = 0.5
            slider.selectedBarColor = kColorGreen
            slider.unselectedBarColor = UIColor.lightGrayColor()
          //  slider.setThumbImage(nil, forState: UIControlState.Normal)
        }
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
