
//
//  LNBaseViewController.m
//  LIveNutriFit
//
//  Created by Amit kumar on 20/05/16.
//  Copyright © 2016 ankit deshwal. All rights reserved.
//

#import "LNBaseViewController.h"
#import "Utiity.h"
#import "LIveNutriFit-Swift.h"

@interface LNBaseViewController ()<SlideMenuDelegate>

@end

@implementation LNBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    
    
    self.navigationController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"ic_menu_black"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]
                                                                                                  style:UIBarButtonItemStylePlain
                                                                                                  target:self
                                                                                                  action:@selector(toggleMenu)];
    [Utiity setNavigation:self backButtonEnable:nil];
    
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)toggleMenu{
    // write your code to prepare popview
    
    
    //    BaseViewController *vc = [[BaseViewController alloc] init];
    
    //    [vc onSlideMenuButtonPressed];
    
    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main"  bundle: nil];
    
    
    MenuViewController* svc =[mainStoryboard instantiateViewControllerWithIdentifier:@"MenuViewController"];
    svc.delegate = self;
    
    //    UIView *view = svc.view;
    //    view.tag = 5001;
    
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:svc];
    
    
    UIWindow *keyWindow = [[[UIApplication sharedApplication] delegate] window];
    
    keyWindow.rootViewController = navigationController;
    
    
}

-(void)slideMenuItemSelectedAtIndex:(NSInteger)index{
    
    
    switch (index) {
            
        case 0:{
            
            
           
            
            
            break;
        }
        case 1:{
            
            [self intiateNavigationControllerFromControllerId:@"PayU"];
            
            break;
        }
        case 2:{
            
            
            
            
            
            break;
        }case 3:{
            
            
            
            break;
        }case 4:{
            
            
            
            break;
        }case 5:{
            
            
            
            break;
        }case 6:{
            
            
            
            break;
        }case 7:{
            
            
            
            break;
        }case 8:{
            
            [self intiateNavigationControllerFromControllerId:@"free_food"];
            break;
        }case 9:{
            
            
            
            break;
        }case 10:{
            
            
            
            break;
        }
        case 11:{
            
             [self intiateNavigationControllerFromControllerId:@"about_lnf"];
            
            break;
        }case 12:{
            
            
            
            break;
        }case 13:{
            
            [self intiateNavigationControllerFromControllerId:@"how_work"];
            
            break;
        }case 14:{
            
            
            [self intiateNavigationControllerFromControllerId:@"setting_controller"];
            break;
        }
            
        default:
            break;
    }
    
}

-(void)intiateNavigationControllerFromControllerId:(NSString*)controllerId{
    
    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"MainPayU"  bundle: nil];
    UIWindow *keyWindow = [[[UIApplication sharedApplication] delegate] window];
    
    LNBaseViewController *payUController  = [mainStoryboard instantiateViewControllerWithIdentifier:controllerId];
    
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:payUController];
    
    keyWindow.rootViewController = navigationController;
    
}


/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
