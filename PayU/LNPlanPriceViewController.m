//
//  LNPlanPriceViewController.m
//  LIveNutriFit
//
//  Created by Amit kumar on 14/05/16.
//  Copyright © 2016 ankit deshwal. All rights reserved.
//

#import "LNPlanPriceViewController.h"
#import "LNPlanPriceTableViewCell.h"
#import "LNPlan.h"
#import "TRWebServiceManger.h"
#import "LIveNutriFit-Swift.h"

@interface LNPlanPriceViewController ()
@property (weak, nonatomic) IBOutlet UITableView *planPriceTableView;

@end

@implementation LNPlanPriceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.automaticallyAdjustsScrollViewInsets = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    if (_currentPack) {
        return _currentPack.planList.count;
    }
    
    return 3;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = nil;
    
    
    cellIdentifier = @"PlanPrice";
    // }
    
    LNPlanPriceTableViewCell* cell =  [tableView dequeueReusableCellWithIdentifier:@"PlanPrice"];
    
    
    if (cell == nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"LNPlanPriceTableViewCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    
    
    NSString *duration = [NSString stringWithFormat:@"%@",((LNPlan*)[_currentPack.planList objectAtIndex:indexPath.row]).PackageDuration];
     NSString *durationType = ((LNPlan*)[_currentPack.planList objectAtIndex:indexPath.row]).PackageDurationType;
    NSString *amount = [NSString stringWithFormat:@"%@",((LNPlan*)[_currentPack.planList objectAtIndex:indexPath.row]).PackageAmount];
    
    
    cell.priceAmountlabel.text =  [[[[[[duration stringByAppendingString:@" "] stringByAppendingString:durationType] stringByAppendingString:@" "] stringByAppendingString:@"Rs"] stringByAppendingString:@" "] stringByAppendingString:amount];
    
    
    NSString *price = [NSString stringWithFormat:@"%@",((LNPlan*)[_currentPack.planList objectAtIndex:indexPath.row]).PerDayCost];
    
    cell.perDayPriceLabel.text =  [[[@"Rs" stringByAppendingString:price] stringByAppendingString:@" "] stringByAppendingString:@"/Day"] ;
    
    //   [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    return cell;

}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *planId = ((LNPlan*)[_currentPack.planList objectAtIndex:indexPath.row]).PackageId;
    [self updatePlan:planId];
    
}

-(void)updatePlan:(NSString*)planId{
    TRWebServiceManger *serviceManager = [TRWebServiceManger sharedManager];
    
    
    NSMutableDictionary *dataDictionary = [NSMutableDictionary dictionaryWithObject:[LiveNutriFitApi sharedInstance].loginData.patientId forKey:@"PatientId"];
    [dataDictionary setObject:planId forKey:@"SelectedPlanid"];
    [dataDictionary setObject:@"0" forKey:@"ApplyPoint"];
    
    [serviceManager makeRequestWithURL:@"http://52.24.100.222/LiveNutriFitWebService/patient.asmx/GetPatientPlanDieticianV2" andParameter:dataDictionary andCompletionHandler:^(NSDictionary* response){
        
        
        
        
        
        
        if (response) {
            
            
            if ([[[response objectForKey:@"Status"] objectForKey:@"Status"] boolValue] == true) {
                
                
           
            
                
                dispatch_async(dispatch_get_main_queue(), ^{
                    
                    
               
                });
            }else{
                
                
                
                //                dispatch_async(dispatch_get_main_queue(), ^{
                //
                //
                //                });
            }
        }else
        {
            
        }
        
    }];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 90;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    return 10;
}
- (IBAction)proceedToPay:(id)sender {
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
