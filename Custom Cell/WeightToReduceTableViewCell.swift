//
//  WeightToReduceTableViewCell.swift
//  LIveNutriFit
//
//  Created by pragya on 19/04/16.
//  Copyright © 2016 ankit deshwal. All rights reserved.
//

import UIKit

class WeightToReduceTableViewCell: UITableViewCell {
    @IBOutlet weak var lblCellTitle: UILabel!
    
    @IBOutlet weak var lblDetailText: UILabel!
    var weightToReduce:Double!
    var unitPrefrence:String!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        weightToReduce = LiveNutriFitApi.sharedInstance.currentWeight - LiveNutriFitApi.sharedInstance.targerWeight
        LiveNutriFitApi.sharedInstance.weightToLoss = weightToReduce
        if LiveNutriFitApi.sharedInstance.weightPrefredUnit{
            unitPrefrence = "kg"
        }else{
            unitPrefrence = "lbs"
        }
        
        if weightToReduce > 0{
            
           lblDetailText.text = "\(weightToReduce) \(unitPrefrence)"
        }else{
             lblDetailText.text = "0 \(unitPrefrence)"
        }
        if weightToReduce == nil{
            lblDetailText.text = "0 \(unitPrefrence)"
        }
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
