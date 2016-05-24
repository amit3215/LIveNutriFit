//
//  DescriptionTableViewCell.swift
//  LIveNutriFit
//
//  Created by pragya on 19/04/16.
//  Copyright © 2016 ankit deshwal. All rights reserved.
//

import UIKit

class DescriptionTableViewCell: UITableViewCell {

    @IBOutlet weak var lblDescription: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
       // kCellIdentifer_description
        lblDescription.layer.borderColor = UIColor.blackColor().CGColor
        lblDescription.layer.borderWidth = 2
        lblDescription.layer.cornerRadius = 5
        
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
