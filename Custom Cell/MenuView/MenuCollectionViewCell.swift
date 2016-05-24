//
//  MenuCollectionViewCell.swift
//  LIveNutriFit
//
//  Created by pragya on 14/05/16.
//  Copyright © 2016 ankit deshwal. All rights reserved.
//

import UIKit

class MenuCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var cellImgView: UIImageView!
    @IBOutlet weak var lblCellHeader: UILabel!
    @IBOutlet weak var btnIconImage: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
//        cellImgView.layer.borderColor = UIColor.whiteColor().CGColor
//        cellImgView.layer.cornerRadius = cellImgView.frame.size.width/7.5
//        cellImgView.layer.borderWidth = 2
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}
