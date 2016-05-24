//
//  MedicalCellTableViewCell.swift
//  LIveNutriFit
//
//  Created by pragya on 11/04/16.
//  Copyright © 2016 ankit deshwal. All rights reserved.
//

import UIKit
protocol medicalHeaderDelegate {
    func selfSwitchValueChanged(Index: Int,typeOfSender switchValue:Bool)
    func familySwitchValueChanged(Index: Int,typeOfSender switchValue:Bool)
}
class MedicalCellTableViewCell: UITableViewCell {

    @IBOutlet weak var lbl_DiseasesTitle: UILabel!
    
    @IBOutlet weak var switch_self: UISwitch!
    
    @IBOutlet weak var switch_Family: UISwitch!
    
    @IBOutlet weak var lbl_SelfHeader: UILabel!
    
    @IBOutlet weak var lbl_FamilyHeader: UILabel!
    var delegate: medicalHeaderDelegate!

    override func awakeFromNib() {
        super.awakeFromNib()
        lbl_SelfHeader.text = "Self"
        lbl_SelfHeader.backgroundColor = kColor_ButtonSelectedColor
        lbl_FamilyHeader.text = "Family"
        lbl_FamilyHeader.backgroundColor = kColor_ButtonSelectedColor
        
        // Initialization code
    }
//    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
//        super.init(style: style, reuseIdentifier: reuseIdentifier)
//       print(reuseIdentifier)
//    }
//    
//    required init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//       // fatalError("init(coder:) has not been implemented")
//    }

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
