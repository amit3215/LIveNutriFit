//
//  WeightLossHeaderTableViewCell.swift
//  LIveNutriFit
//
//  Created by pragya on 15/05/16.
//  Copyright © 2016 ankit deshwal. All rights reserved.
//

import UIKit

class WeightLossHeaderTableViewCell: UITableViewCell {

    @IBOutlet weak var cellHeaderWithData: UILabel!
    @IBOutlet weak var cellTypeOfJourney: UILabel!
    @IBOutlet weak var cellChangeJourneyBtn: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

 
    @IBAction func changeJourneyButtonTappedAction(sender: AnyObject) {
        
    }
}
