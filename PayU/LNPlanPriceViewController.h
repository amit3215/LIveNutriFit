//
//  LNPlanPriceViewController.h
//  LIveNutriFit
//
//  Created by Amit kumar on 14/05/16.
//  Copyright © 2016 ankit deshwal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LNPackageFeature.h"


@interface LNPlanPriceViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) NSArray *planPriceList ;
@property (nonatomic, strong) LNPackageFeature *currentPack ;

@end
