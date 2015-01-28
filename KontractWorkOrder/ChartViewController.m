//
//  ChartViewController.m
//  KontractWorkOrder
//
//  Created by GMSIndia 2 on 28/01/15.
//  Copyright (c) 2015 GMSIndia1. All rights reserved.
//

#import "ChartViewController.h"

@interface ChartViewController ()

@end

@implementation ChartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    _titleview.backgroundColor = [UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f];
    _charttable.layer.borderWidth=2.0f;
    _charttable.layer.borderColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f].CGColor;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
#pragma mark-tableview datasource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 6;
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"mycell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        [[NSBundle mainBundle]loadNibNamed:@"ChartcellView" owner:self options:nil];
        cell=_chartcell;
    }
    
    cell.textLabel.font=[UIFont fontWithName:@"Helvetica Neue" size:12];
    // cell.textLabel.text=@"WO0001";
    
    return cell;
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    //alternating cell back ground color
    if(tableView==_charttable)
    {
        if (indexPath.row%2 == 0) {
            [cell setBackgroundColor:[UIColor whiteColor]];
            
        }else
        {
            
            //[cell setBackgroundColor:[UIColor colorWithRed:247.0/255.0f green:247.0/255.0f blue:247.0/255.0f alpha:1.0f]];
            [cell setBackgroundColor:[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f]];
            
            
        }
    }
}

- (IBAction)addplanbtn:(id)sender {
    self.addplanVCtrl=[[AddplanViewController alloc]initWithNibName:@"AddplanViewController" bundle:nil];
    
    
    //  _AddWCtrl.modalPresentationStyle = UIModalPresentationPageSheet;
    [self presentViewController:_addplanVCtrl
                       animated:YES completion:NULL];
    
}
- (IBAction)clsebtn:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
