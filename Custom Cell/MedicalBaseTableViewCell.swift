//
//  MedicalBaseTableViewCell.swift
//  LIveNutriFit
//
//  Created by pragya on 11/04/16.
//  Copyright © 2016 ankit deshwal. All rights reserved.
//

import UIKit
protocol medicalBaseDelegate {
    func selfSwitchValueChanged(Index: Int,typeOfSender switchValue:Bool)
    func familySwitchValueChanged(Index: Int,typeOfSender switchValue:Bool)
}
class MedicalBaseTableViewCell: UITableViewCell {
    
    @IBOutlet weak var lbl_DiseasesTitle: UILabel!
    @IBOutlet weak var switch_self: UISwitch!
    @IBOutlet weak var switch_Family: UISwitch!
    var delegate: medicalBaseDelegate!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func selfSwitchValueChange(sender: AnyObject) {
        if switch_self.on {
           delegate.selfSwitchValueChanged(switch_self.tag, typeOfSender:true)
        } else {
            delegate.selfSwitchValueChanged(switch_self.tag, typeOfSender:false)
        }
    }
    
    @IBAction func familySwitchValueChange(sender: AnyObject) {
        if switch_Family.on {
           delegate.familySwitchValueChanged(switch_Family.tag, typeOfSender:true)
        } else {
          delegate.familySwitchValueChanged(switch_Family.tag, typeOfSender:false)
        }
        
    }
}
