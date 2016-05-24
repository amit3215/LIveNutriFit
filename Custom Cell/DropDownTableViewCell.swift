//
//  DropDownTableViewCell.swift
//  LIveNutriFit
//
//  Created by pragya on 24/04/16.
//  Copyright © 2016 ankit deshwal. All rights reserved.
//

import UIKit

class DropDownTableViewCell: UITableViewCell {
    @IBOutlet weak var lblCellHeader: UILabel!
    @IBOutlet weak var lblNoofDrinks: UILabel!
    @IBOutlet weak var imgviewDropDown: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
