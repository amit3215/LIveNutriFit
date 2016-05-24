//
//  LNPlanViewController.m
//  PayUMoney
//
//  Created by Amit kumar on 28/04/16.
//  Copyright © 2016 Amit kumar. All rights reserved.
//

#import "LNPlanViewController.h"
#import "LNPlanCellTableViewCell.h"
#import "LNCoachListViewController.h"

@interface LNPlanViewController ()
@property (weak, nonatomic) IBOutlet UITableView *planTableView;

@end

@implementation LNPlanViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//        _planTableView.layer.borderWidth = 2.0;
//        _planTableView.layer.borderColor = [UIColor grayColor].CGColor;
    
      [_planTableView setTableFooterView:[[UIView alloc] initWithFrame:CGRectZero]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
 
    return 3;
}




- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    static NSString *cellIdentifier = nil;
    
 
    cellIdentifier = @"ExpandingCellIdentifier";
    // }
    
    LNPlanCellTableViewCell* cell =  [tableView dequeueReusableCellWithIdentifier:@"ExpandingCellIdentifier"];
    
    
    if (cell == nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"LNPlanCellTableViewCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    
//   [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    return cell;

}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 150;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    return 10;
}

- (IBAction)continueButtonTapped:(id)sender {
    
    LNCoachListViewController *vc = [[LNCoachListViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
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
