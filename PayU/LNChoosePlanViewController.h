//
//  LNChoosePlanViewController.h
//  PayUMoney
//
//  Created by Amit kumar on 27/04/16.
//  Copyright © 2016 Amit kumar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LNBaseViewController.h"
#import "LNPackageFeature.h"

@interface LNChoosePlanViewController : UIViewController
@property (nonatomic, strong) NSMutableArray *planFeatureList ;
@property (nonatomic, strong) LNPackageFeature *currentPack ;

@end
