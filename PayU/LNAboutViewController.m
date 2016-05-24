
//
//  LNAboutViewController.m
//  LIveNutriFit
//
//  Created by Amit kumar on 22/05/16.
//  Copyright © 2016 ankit deshwal. All rights reserved.
//

#import "LNAboutViewController.h"
#import "QuartzCore/QuartzCore.h"
#import "LNHowitWorkViewController.h"

@interface LNAboutViewController ()<UITableViewDelegate>{
  
    LNWebViewType type;
}
@property (weak, nonatomic) IBOutlet UITableView *aboutContentTableView;
@property (strong, nonatomic) NSArray *aboutTitle;
@property (strong, nonatomic) NSArray *aboutImages;

@end

@implementation LNAboutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _aboutTitle = [[NSArray alloc] init];
    _aboutTitle = @[@"Watch Video", @"Our Company", @"Meet Our Team", @"Terms & conditions",@"Privacy Policy",@"Follow Us",@"ContactUs",@"Rate Us"];
    _aboutImages = @[@"Kat1.png", @"Kat2.png", @"Kat3.png", @"Kat3.png"];
 

    
//    _aboutContentTableView.layer.shadowColor = [UIColor grayColor].CGColor;
//    _aboutContentTableView.layer.shadowOffset = CGSizeMake(2.0, 2.0);
//    _aboutContentTableView.layer.shadowOpacity = 1.0;
//    _aboutContentTableView.layer.shadowRadius = 2;
    
    _aboutContentTableView.layer.borderWidth = 2.0;
    _aboutContentTableView.layer.borderColor = (__bridge CGColorRef _Nullable)([UIColor redColor]);
    [_aboutContentTableView setTableFooterView:[[UIView alloc] initWithFrame:CGRectZero]];
    self.automaticallyAdjustsScrollViewInsets = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 8;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    static NSString *simpleTableIdentifier = @"SimpleTableItem";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    cell.textLabel.text = [_aboutTitle objectAtIndex:[indexPath row]];
    cell.imageView.image = [UIImage imageNamed:@"FirstAidIcon"];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    if (indexPath.row ==  0) {
        
        
    }if (indexPath.row ==  1) {
        type = LNWebViewTypeOurCompany;
        
    }
    if (indexPath.row ==  2) {
         type = LNWebViewTypeMeetOurTeam;
        
    }
    if (indexPath.row == 3) {
        type = LNWebViewTypeTermCondition;
        
    }
    if (indexPath.row ==  4) {
        type = LNWebViewTypePrivacyPolicy;
        
    }
    if (indexPath.row ==  5) {
        
    }
    if (indexPath.row ==  6) {
         type = LNWebViewTypeContactUS;
        
    }
    if (indexPath.row ==  7) {
        
    }
    
    [self performSegueWithIdentifier:@"to_web_View" sender:[NSNumber numberWithInt:type]];
    
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
   
    
    
    if ([[segue identifier] isEqualToString:@"to_web_View"]){
        // Get reference to the destination view controller
     
      
        LNHowitWorkViewController *vc = [segue destinationViewController];
        vc.noteType = [(NSNumber*)sender intValue];
        
    
        
    }

}


@end
