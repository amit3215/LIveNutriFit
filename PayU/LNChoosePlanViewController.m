//
//  LNChoosePlanViewController.m
//  PayUMoney
//
//  Created by Amit kumar on 27/04/16.
//  Copyright © 2016 Amit kumar. All rights reserved.
//

#import "LNChoosePlanViewController.h"
#import "LNPlanFeature.h"
#import  "QuartzCore/QuartzCore.h"
#import "LNPlanPriceViewController.h"


@interface LNChoosePlanViewController ()
@property (weak, nonatomic) IBOutlet UITableView *planActivityTableView;
@property (weak, nonatomic) IBOutlet UIView *upperViewLnfFree;

@end

@implementation LNChoosePlanViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    _planActivityTableView.layer.borderWidth = 2.0;
//    _planActivityTableView.layer.borderColor = [UIColor grayColor].CGColor;
    
    _planActivityTableView.layer.shadowColor = [UIColor grayColor].CGColor;
    _planActivityTableView.layer.shadowOffset = CGSizeMake(2.0, 2.0);
    _planActivityTableView.layer.shadowOpacity = 1.0;
    _planActivityTableView.layer.shadowRadius = 2;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _planFeatureList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"SimpleTableItem";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    if (_planFeatureList.count  >0) {
        
        LNPlanFeature *planFeature = (LNPlanFeature*)[_planFeatureList objectAtIndex:indexPath.row];
//        cell.textLabel.textColor = [Utiity colorFromHexString:pack.colourCode];
        cell.textLabel.text = planFeature.featureName;
    }
    
    return cell;
}

- (IBAction)continuePlanPrice:(id)sender {
    
    [self performSegueWithIdentifier:@"planPriceSegue" sender:nil];
}




#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([[segue identifier] isEqualToString:@"planPriceSegue"]){
        // Get reference to the destination view controller
        
        
        LNPlanPriceViewController *vc = [segue destinationViewController];
        vc.currentPack = _currentPack;
        
    }
 

    
}


@end
