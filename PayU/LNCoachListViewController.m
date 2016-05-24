//
//  LNCoachListViewController.m
//  PayUMoney
//
//  Created by Amit kumar on 30/04/16.
//  Copyright © 2016 Amit kumar. All rights reserved.
//

#import "LNCoachListViewController.h"
#import "TRWebServiceManger.h"

@interface LNCoachListViewController ()

@end

@implementation LNCoachListViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self getDieticieneList];
    
    
    
    // Create the data model
    _pageTitles = @[@"Over 200 Tips and Tricks", @"Discover Hidden Features", @"Bookmark Favorite Tip", @"Free Regular Update"];
    _pageImages = @[@"Kat1.png", @"Kat2.png", @"Kat3.png", @"Kat3.png"];
    
    // Create page view controller
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main"
                                                         bundle: nil];
    self.pageViewController = [storyboard instantiateViewControllerWithIdentifier:@"PageViewController"];
    self.pageViewController.dataSource = self;
    
    PageContentViewController *startingViewController = [self viewControllerAtIndex:0];
    NSArray *viewControllers = @[startingViewController];
    [self.pageViewController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    
    // Change the size of page view controller
    self.pageViewController.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - 30);
    
    [self addChildViewController:_pageViewController];
    [self.view addSubview:_pageViewController.view];
    [self.pageViewController didMoveToParentViewController:self];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)startWalkthrough:(id)sender {
    PageContentViewController *startingViewController = [self viewControllerAtIndex:0];
    NSArray *viewControllers = @[startingViewController];
    [self.pageViewController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionReverse animated:NO completion:nil];
}

- (PageContentViewController *)viewControllerAtIndex:(NSUInteger)index
{
    if (([self.pageTitles count] == 0) || (index >= [self.pageTitles count])) {
        return nil;
    }
    
    // Create a new view controller and pass suitable data.
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main"
                                                         bundle: nil];
    PageContentViewController *pageContentViewController = [storyboard instantiateViewControllerWithIdentifier:@"PageContentViewController"];
    pageContentViewController.imageFile = self.pageImages[index];
    pageContentViewController.titleText = self.pageTitles[index];
    pageContentViewController.pageIndex = index;
    
    return pageContentViewController;
}

#pragma mark - Page View Controller Data Source

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    NSUInteger index = ((PageContentViewController*) viewController).pageIndex;
    
    if ((index == 0) || (index == NSNotFound)) {
        return nil;
    }
    
    index--;
    return [self viewControllerAtIndex:index];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    NSUInteger index = ((PageContentViewController*) viewController).pageIndex;
    
    if (index == NSNotFound) {
        return nil;
    }
    
    index++;
    if (index == [self.pageTitles count]) {
        return nil;
    }
    return [self viewControllerAtIndex:index];
}

- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController
{
    return [self.pageTitles count];
}

- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController
{
    return 0;
}


-(void)getDieticieneList{
//
    
    
    TRWebServiceManger *serviceManager = [TRWebServiceManger sharedManager];
    
    
    NSDictionary *dataDictionary = [NSDictionary dictionaryWithObject:@"1" forKey:@"IsActive"];
    
    [serviceManager makeRequestWithURL:@"http://52.24.100.222/LiveNutriFitWebService/patient.asmx/Dietician_List" andParameter:dataDictionary andCompletionHandler:^(NSDictionary* response){
        
        
        
        
        
        
        if (response) {
            
            
//            if ([[[response objectForKey:@"Status"] objectForKey:@"Status"] boolValue] == true) {
//                
//                
//                for (NSDictionary *dic in [response objectForKey:@"PackageFeatureDetails"]) {
//                    
//                    LNPackageFeature *pack = [[LNPackageFeature alloc] initWithDictionary:dic];
//                    [arrayPackage addObject:pack];
//                    
//                    
//                }
//                
//                dispatch_async(dispatch_get_main_queue(), ^{
//                    
//                    
//                    [_planTableView reloadData];
//                });
//            }else{
//                
//                
//                
//                //                dispatch_async(dispatch_get_main_queue(), ^{
//                //
//                //
//                //                });
//            }
        }else
        {
            
        }
        
    }];

}

@end
