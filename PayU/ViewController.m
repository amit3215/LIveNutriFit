//
//  ViewController.m
//  PayUMoney
//
//  Created by Amit kumar on 26/04/16.
//  Copyright © 2016 Amit kumar. All rights reserved.
//

#import "ViewController.h"
#import "TRWebServiceManger.h"
#import "LNPackageFeature.h"
#import "LNChoosePlanViewController.h"





@interface ViewController (){
    NSMutableArray *arrayPackage;
}
@property (weak, nonatomic) IBOutlet UITableView *planTableView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    arrayPackage = [[NSMutableArray alloc] init];
    [self uploadData];
    
    [_planTableView setTableFooterView:[[UIView alloc] initWithFrame:CGRectZero]];
    // Do any additional setup after loading the view, typically from a nib.
    
//    [self addBackButtonWithTitle:@"back"];
    
    
  
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"SimpleTableItem";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    if (arrayPackage.count  >0) {
        LNPackageFeature *pack = (LNPackageFeature*)[arrayPackage objectAtIndex:indexPath.row];
        cell.textLabel.textColor = [Utiity colorFromHexString:pack.colourCode];
        cell.textLabel.text = pack.packagePlanName;
    }
   
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    LNPackageFeature *pack = (LNPackageFeature*)[arrayPackage objectAtIndex:indexPath.row];
    
    [self performSegueWithIdentifier:@"choose_plan_segue" sender:pack];
    
}



-(void)uploadData{
    
   
    
    
    TRWebServiceManger *serviceManager = [TRWebServiceManger sharedManager];
    
    
    NSMutableDictionary *dataDictionary = [NSMutableDictionary dictionaryWithObject:@"" forKey:@"PackageType"];
    [dataDictionary setObject:@"0" forKey:@"MentorId"];
    
    [serviceManager makeRequestWithURL:@"http://52.24.100.222/LiveNutriFitWebService/patient.asmx/GetPackageFeatureDetailsV1" andParameter:dataDictionary andCompletionHandler:^(NSDictionary* response){
        
        
        
        
   
        
        if (response) {
            
            
            if ([[[response objectForKey:@"Status"] objectForKey:@"Status"] boolValue] == true) {
                
                
                for (NSDictionary *dic in [response objectForKey:@"PackageFeatureDetails"]) {
                    
                    LNPackageFeature *pack = [[LNPackageFeature alloc] initWithDictionary:dic];
                    [arrayPackage addObject:pack];
                    
                    
                }
                
                dispatch_async(dispatch_get_main_queue(), ^{
                    
           
                    [_planTableView reloadData];
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


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([[segue identifier] isEqualToString:@"choose_plan_segue"]){
        // Get reference to the destination view controller
        
        LNPackageFeature *pack = (LNPackageFeature*)sender;
        LNChoosePlanViewController *vc = [segue destinationViewController];
        vc.planFeatureList = pack.planFeatureList;
          vc.currentPack = pack;
        
    }
    
}



@end
