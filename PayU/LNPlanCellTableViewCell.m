//
//  LNPlanCellTableViewCell.m
//  PayUMoney
//
//  Created by Amit kumar on 28/04/16.
//  Copyright © 2016 Amit kumar. All rights reserved.
//

#import "LNPlanCellTableViewCell.h"

@implementation LNPlanCellTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setFrame:(CGRect)frame {
    
    frame.origin.x = 10;
    frame.origin.y += 8;
    frame.size.height -= 2 * 8;
    frame.size.width -= 2 * 10;
    [super setFrame:frame];
}

-(void)setNeedsDisplay{
    [super setNeedsDisplay];
    
}



@end
