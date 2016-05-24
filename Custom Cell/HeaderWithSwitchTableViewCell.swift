//
//  HeaderWithSwitchTableViewCell.swift
//  LIveNutriFit
//
//  Created by pragya on 24/04/16.
//  Copyright © 2016 ankit deshwal. All rights reserved.
//

import UIKit
protocol lifestyleSwitch {
    func cellSwitchValueChanged(Index: Int,typeOfSender switchValue:Bool)
}

class HeaderWithSwitchTableViewCell: UITableViewCell {
    @IBOutlet weak var lblCellHeader: UILabel!

    @IBOutlet weak var switchButton: UISwitch!
    var delegate: lifestyleSwitch!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func selfSwitchValueChange(sender: AnyObject) {
        if switchButton.on {
            delegate.cellSwitchValueChanged(switchButton.tag, typeOfSender:true)
        } else {
            delegate.cellSwitchValueChanged(switchButton.tag, typeOfSender:false)
        }
    }

}
