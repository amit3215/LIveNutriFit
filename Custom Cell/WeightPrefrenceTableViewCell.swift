//
//  WeightPrefrenceTableViewCell.swift
//  LIveNutriFit
//
//  Created by pragya on 14/04/16.
//  Copyright © 2016 ankit deshwal. All rights reserved.
//

import UIKit

class WeightPrefrenceTableViewCell: UITableViewCell {
    
    @IBOutlet weak var lblCellTitle: UILabel!
    
    
  //  @IBOutlet weak var btnWeightPrefrence: UIButton!
    
    
    @IBOutlet weak var lblWeightPrefrence: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
