//
//  LNPlanPriceTableViewCell.m
//  LIveNutriFit
//
//  Created by Amit kumar on 14/05/16.
//  Copyright © 2016 ankit deshwal. All rights reserved.
//

#import "LNPlanPriceTableViewCell.h"
#import <QuartzCore/QuartzCore.h>

@implementation LNPlanPriceTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    self.layer.borderColor = [UIColor grayColor].CGColor;
    self.layer.borderWidth = 1.f;
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
