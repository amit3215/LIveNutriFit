//
//  OfferTableViewCell.swift
//  LIveNutriFit
//
//  Created by pragya on 05/06/16.
//  Copyright © 2016 ankit deshwal. All rights reserved.
//

import UIKit

class OfferTableViewCell: UITableViewCell {
    @IBOutlet weak var lblOfferCode: UILabel!
    @IBOutlet weak var lblExpDate: UILabel!
    @IBOutlet weak var lblDetailType: UILabel!
    @IBOutlet weak var lblPercentageDiscount: UILabel!
    let shapeLayer:CAShapeLayer = CAShapeLayer()
   
   
    override func awakeFromNib() {
        super.awakeFromNib()
     // image code 80 % fine
        
    }
    func updateBorder(){
        lblOfferCode.layer.cornerRadius = 4
        shapeLayer.strokeColor = UIColor.orangeColor().CGColor
        shapeLayer.lineWidth = 2
        shapeLayer.fillColor = nil
        shapeLayer.lineDashPattern = [4,4]
        lblOfferCode.layer.addSublayer(shapeLayer)
    }
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    override func layoutSubviews() {
    super.layoutSubviews()
    shapeLayer.path = UIBezierPath(rect:lblOfferCode.bounds).CGPath
    shapeLayer.frame = lblOfferCode.bounds
    }

}


