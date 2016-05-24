//
//  LNHowitWorkViewController.h
//  LIveNutriFit
//
//  Created by Amit kumar on 22/05/16.
//  Copyright © 2016 ankit deshwal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LNBaseViewController.h"
typedef enum {
    LNWebViewTypeSelf,
    LNWebViewTypeOurCompany,
    LNWebViewTypeTermCondition,
    LNWebViewTypePrivacyPolicy,
    LNWebViewTypeContactUS,
    LNWebViewTypeMeetOurTeam,
    
    
}LNWebViewType;

@interface LNHowitWorkViewController : UIViewController
@property (nonatomic, assign) LNWebViewType noteType;
@end
