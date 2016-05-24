//
//  BMIStatusTableViewCell.swift
//  LIveNutriFit
//
//  Created by pragya on 12/05/16.
//  Copyright © 2016 ankit deshwal. All rights reserved.
//

import UIKit

class BMIStatusTableViewCell: UITableViewCell {
    @IBOutlet weak var bodyImgView: UIImageView!
    
    @IBOutlet weak var lblStepText: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
