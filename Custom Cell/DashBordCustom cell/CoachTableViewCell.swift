//
//  CoachTableViewCell.swift
//  LIveNutriFit
//
//  Created by pragya on 15/05/16.
//  Copyright © 2016 ankit deshwal. All rights reserved.
//

import UIKit

class CoachTableViewCell: UITableViewCell {

    @IBOutlet weak var CellTitleLable: UILabel!
    @IBOutlet weak var cellBtnUpdateToProCoach: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func UpdateProCoachSelected(sender: AnyObject) {
        
    }
    

}
