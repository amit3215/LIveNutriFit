//
//  DashBoardPower7TableViewCell.swift
//  LIveNutriFit
//
//  Created by pragya on 12/05/16.
//  Copyright © 2016 ankit deshwal. All rights reserved.
//

import UIKit

class DashBoardPower7TableViewCell: UITableViewCell {
    
    @IBOutlet weak var lblNoOfSleep: UILabel!
    
    @IBOutlet weak var lblNoOfWater: UILabel!
    
    @IBOutlet weak var lblNoOfProten: UILabel!
    
    @IBOutlet weak var lblNoOfVegges: UILabel!
    
    @IBOutlet weak var lblNoOfFruits: UILabel!

    @IBOutlet weak var lblNoOfNuts: UILabel!
    @IBOutlet weak var lblNoOfExcercise: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
