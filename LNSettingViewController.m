//
//  LNSettingViewController.m
//  LIveNutriFit
//
//  Created by Amit kumar on 13/05/16.
//  Copyright © 2016 ankit deshwal. All rights reserved.
//

#import "LNSettingViewController.h"

@interface LNSettingViewController ()
@property (weak, nonatomic) IBOutlet UITableView *settingTableView;

@end

@implementation LNSettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
//    self.navigationController.navigationBar.barTintColor = [UIColor redColor];
//    self.navigationController.navigationBar.translucent = NO;
    
    // Do any additional setup after loading the view.
    [_settingTableView setTableFooterView:[[UIView alloc] initWithFrame:CGRectZero]];
    

    
    CALayer *sublayer = [CALayer layer];
    sublayer.backgroundColor = [UIColor whiteColor].CGColor; // If you dont give this, shadow will not come, dont know why
    sublayer.shadowOffset = CGSizeMake(0, 3);
    sublayer.shadowRadius = 5.0;
    sublayer.shadowColor = [UIColor grayColor].CGColor;
    sublayer.shadowOpacity = 1.0;
    sublayer.cornerRadius = 5.0;
    sublayer.frame = CGRectMake(_settingTableView.frame.origin.x, _settingTableView.frame.origin.y, _settingTableView.frame.size.width, _settingTableView.frame.size.height);
    [self.view.layer addSublayer:sublayer];
    
    [self.view.layer addSublayer:_settingTableView.layer];
    self.automaticallyAdjustsScrollViewInsets = NO;
    _settingTableView.scrollEnabled = NO;
    
//    if ([[UIDevice currentDevice].systemVersion floatValue] >= 7){
//        _settingTableView.contentInset = UIEdgeInsetsMake(-80, 0, 0, 0);
//    }
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationItem.title = @"SETTINGS";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 6;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"SettingTableItem";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    

    if (indexPath.row == 0) {
        cell.textLabel.text = @"Notification";
        
        UISwitch *switchview = [[UISwitch alloc] initWithFrame:CGRectZero];
        cell.accessoryView = switchview;
    }else if (indexPath.row == 1){
        cell.textLabel.text = @"Reminder Sound";
        
        UISwitch *switchview = [[UISwitch alloc] initWithFrame:CGRectZero];
        cell.accessoryView = switchview;
    }else if (indexPath.row == 2){
        cell.textLabel.text = @"Motivation";
        
        UISwitch *switchview = [[UISwitch alloc] initWithFrame:CGRectZero];
        cell.accessoryView = switchview;
    }else if (indexPath.row == 3){
        cell.textLabel.text = @"Notification Vibration";
        
        UISwitch *switchview = [[UISwitch alloc] initWithFrame:CGRectZero];
        cell.accessoryView = switchview;
    }else if (indexPath.row == 4){
        cell.textLabel.text = @"Change Password";
    }else if (indexPath.row == 5){
        cell.textLabel.text = @"Sign Out";
    }


    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    
    return cell;
}
//- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//    // rows in section 0 should not be selectable
//    if ( indexPath.section == 0 ) return nil;
//    
//    // first 3 rows in any section should not be selectable
//    if ( indexPath.row <= 2 ) return nil;
//    
//    // By default, allow row to be selected
//    return indexPath;
//}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    if (indexPath.row == 4) {
       [self performSegueWithIdentifier:@"setting_to_password" sender:nil];
    }

}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    
    return 65;
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
