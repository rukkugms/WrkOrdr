//
//  AddplanViewController.m
//  KontractWorkOrder
//
//  Created by Riya on 1/28/15.
//  Copyright (c) 2015 GMSIndia1. All rights reserved.
//

#import "AddplanViewController.h"

@interface AddplanViewController ()

@end

@implementation AddplanViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:226.0/255.0f blue:226.0/255.0f alpha:1];
    _detailstextview.layer.borderWidth=2;
    _detailstextview.layer.cornerRadius=10;
    _detailstextview.layer.borderColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1].CGColor;
    _Workperformtextview.layer.borderWidth=2;
    _Workperformtextview.layer.cornerRadius=10;
    _Workperformtextview.layer.borderColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1].CGColor;
    _scroll.frame=CGRectMake(0, 44, 1024, 724);
    _scroll.contentSize=CGSizeMake(1024, 800);
    _scaffoldtable.layer.borderWidth=2;
    _scaffoldtable.layer.borderColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1].CGColor;
    _scafoldtitle.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1];

     
    // Do any additional setup after loading the view from its nib.
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

- (IBAction)clsebtn:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)serviceselection:(id)sender {
    UIViewController* popoverContent = [[UIViewController alloc]init];
    UIView* popoverView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 200, 200)];
    // popoverView.backgroundColor = [UIColor whiteColor];
    _PopOvertableview=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, 200, 200)];
    _PopOvertableview.delegate=(id)self;
    _PopOvertableview.dataSource=(id)self
    ;
    _PopOvertableview.rowHeight= 40;
    _PopOvertableview.separatorStyle=UITableViewCellSeparatorStyleSingleLine;
    //_popovertableview.separatorColor=[UIColor blackColor];
    [popoverView addSubview:_PopOvertableview];
    popoverContent.view = popoverView;
    popoverContent.preferredContentSize = CGSizeMake(200, 200);
    
    
    //UITableView *table = (UITableView *)[cell superview];
    self.popoverctrlr = [[UIPopoverController alloc]initWithContentViewController:popoverContent];
    self.popoverctrlr.popoverContentSize=CGSizeMake(200.0f, 200.0f);
    self.popoverctrlr=_popoverctrlr;
    [self.popoverctrlr presentPopoverFromRect:_servicebtn.frame inView:self.scroll permittedArrowDirections:UIPopoverArrowDirectionUp animated:YES];
    
    

}
#pragma mark-Tableview Delegates
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(tableView==_PopOvertableview)
    {
    return 5;
    }
    if(tableView==_scaffoldtable)
    {
        return 5;
    }
    return YES;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    static NSString *cellidentifier=@"mycell";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellidentifier];
    if (cell==nil) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellidentifier];
        if (tableView==_scaffoldtable) {
            [[NSBundle mainBundle]loadNibNamed:@"Scaffoldcell" owner:self options:nil];
            cell=_scaffoldcell;
        }
    }
   
    return cell;
}

@end
