//
//  LNCoachListViewController.h
//  PayUMoney
//
//  Created by Amit kumar on 30/04/16.
//  Copyright © 2016 Amit kumar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PageContentViewController.h"

@interface LNCoachListViewController : UIViewController<UIPageViewControllerDataSource>

- (IBAction)startWalkthrough:(id)sender;
@property (strong, nonatomic) UIPageViewController *pageViewController;
@property (strong, nonatomic) NSArray *pageTitles;
@property (strong, nonatomic) NSArray *pageImages;

@end
