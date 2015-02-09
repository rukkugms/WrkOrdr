//
//  PlanningViewController.m
//  Newproject
//
//  Created by GMSIndia1 on 2/12/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import "PlanningViewController.h"

@interface PlanningViewController ()

@end

@implementation PlanningViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
                   
        
       
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
     _cmpxtyofwrk=[[NSMutableArray alloc]initWithObjects:@"Easy",@"Moderate",@"Difficult", nil];
    self.view.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:226/255.0f blue:226/255.0f alpha:1.0f];
    _addplanview.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:226/255.0f blue:226/255.0f alpha:1.0f];
    // Do any additional setup after loading the view from its nib.
      _titleview.backgroundColor = [UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f];
     _tabletitleview.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f];
      _tabletitleview2.backgroundColor = [UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f];
  
    _plangtable.layer.borderWidth=2.0f;
    _plangtable.layer.borderColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f].CGColor;
   
        _tabletitleview.hidden=NO;
    
         _disclosurearry=[[NSMutableArray alloc]initWithObjects:@"Work Entry",@"Create New Plan",nil];
        _addbtn.hidden=NO;
        _deletebtn.hidden=NO;
        _plnnavitem.title=@"Planning";
    [self.navigationItem setHidesBackButton:YES animated:YES];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    
       // _editbtn.hidden=NO;
   
    
    [self WorkTypeSelect];
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
   
           _searchbar=[[UISearchBar alloc]initWithFrame:CGRectMake(0, 0, 220, 44)];
        _searchbar.delegate=(id)self;
        _searchbar.tintColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f];
        self.plangtable.tableHeaderView=_searchbar;
        UISearchDisplayController *searchctrlr=[[UISearchDisplayController alloc]initWithSearchBar:_searchbar contentsController:self];
        searchctrlr.searchResultsDelegate=(id)self;
        searchctrlr.searchResultsDataSource=(id)self;
        searchctrlr.delegate=(id)self;
    [self UserRightsforparticularmoduleselect];


         [self SelectAllPlans];
    
    
    
}

-(void)workreload{
    
    
     [self SelectAllPlans];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark-Tableview
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    // Return the number of sections.
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
   
    if(tableView==_plangtable)
    {
        return [_planlistarray count];
    }
    if(tableView==_popovertableview)
    {
        switch (poptype) {
                case 1:
                if (newpoptype==2) {
                      return [_planslectionarray count];
                }
                else if (newpoptype==3){
                    return [_typelistarray count];
                }
                else if (newpoptype==4){
                    return [_cmpxtyofwrk count];
                }

              
                break;
                case 2:
                return[_disclosurearry count];
                break;
//               case 3:
//              return[_typelistarray count];
//               break;
                
            default:
                break;
        }
    }
    return YES;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellidentifier=@"mycell";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellidentifier];
    if (cell==nil) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellidentifier];
    
    if(tableView==_plangtable)
    {
       
            [[NSBundle mainBundle]loadNibNamed:@"customplancell" owner:self options:nil];
            cell=_planingcell;
        
    }
    }
    if(tableView==_popovertableview)
    {
        
        
        cell.textLabel.font = [UIFont fontWithName:@"Helvetica Neue Light" size:12];
        cell.textLabel.font = [UIFont systemFontOfSize:12.0];

    

        switch (poptype) {
            case 1:
                if (newpoptype==2) {
                      cell.textLabel.text=[_planslectionarray objectAtIndex:indexPath.row];
                }
                else if (newpoptype==3){
                    cell.textLabel.text=[_typelistarray objectAtIndex:indexPath.row];

                }
                else if (newpoptype==4){
                    cell.textLabel.text=[_cmpxtyofwrk objectAtIndex:indexPath.row];
                    
                }

             break;
            case 2:
                cell.textLabel.text=[_disclosurearry objectAtIndex:indexPath.row];
                break;
           
            default:
                break;
        }
    }
     if(tableView==_plangtable)
         
         
     {
        
         planmodel*planmdl=(planmodel *)[_planlistarray objectAtIndex:indexPath.row];
         _organizationname=(UILabel*)[cell viewWithTag:1];
         cell.textLabel.font=[UIFont fontWithName:@"Helvetica Neue" size:12];
         _organizationname.text=planmdl.customername;
//              UITapGestureRecognizer *tapGesture =
//              [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(labelTap:)];
//              [_organizationname addGestureRecognizer:tapGesture];

//         _leadlabel=(UILabel*)[cell viewWithTag:2];
//         NSString *led=[NSString stringWithFormat:@"%d",planmdl.leadid];
//         _leadlabel.text=led;
          _planidlabel=(UILabel*)[cell viewWithTag:3];
          _planidlabel.text=planmdl.planid;
         _locationlbl=(UILabel*)[cell viewWithTag:5];
         _locationlbl.text=planmdl.location;
         _complexitywrklbl=(UILabel*)[cell viewWithTag:6];
         _complexitywrklbl.text=planmdl.complexity;
         _sitefactrlbl=(UILabel*)[cell viewWithTag:7];
         _sitefactrlbl.text=[NSString stringWithFormat:@"%d",[planmdl.sitefactor integerValue]];
              _wrktypelabel=(UILabel*)[cell viewWithTag:8];
              _wrktypelabel.text=planmdl.worktype;
              _pmanhrslbl=(UILabel*)[cell viewWithTag:9];
              _pmanhrslbl.text=[NSString stringWithFormat:@"%.2f",[planmdl.manhrs doubleValue]];;
              _peqhrslbl=(UILabel*)[cell viewWithTag:10];
              _peqhrslbl.text=[NSString stringWithFormat:@"%.2f",[planmdl.equphrs doubleValue]];
              _pmatqty=(UILabel*)[cell viewWithTag:11];
              _pmatqty.text=[NSString stringWithFormat:@"%d",[planmdl.mathrs integerValue]];
              _masterplanlabel=(UILabel*)[cell viewWithTag:12];
              _masterplanlabel.text=planmdl.masterplan;

         
     }
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView==_popovertableview) {
        
        
        
        switch (poptype) {
                
            case 1:
                if (newpoptype==2) {
                     [_planselectionbtn setTitle:[_planslectionarray objectAtIndex:indexPath.row]forState:UIControlStateNormal];
                    NSString *checkvalue=[_leadbiddict objectForKey:[_planslectionarray objectAtIndex:indexPath.row]];
                    NSLog(@"%@",checkvalue);
                           NSLog(@"%@",_planselectionbtn.titleLabel.text);
                    if ([checkvalue isEqualToString:@"true"]) {
                        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:@"This lead is already changed as a customer" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                        [alert show];
                    }
                    else
                    {
                        
                    }
                    
                }
                else if (newpoptype==3){
                     [_typebtnlbl setTitle:[_typelistarray objectAtIndex:indexPath.row]forState:UIControlStateNormal];
                    
                 
                    
                }
                else if (newpoptype==4){
                    [_cmplexitybtnlbl setTitle:[_cmpxtyofwrk objectAtIndex:indexPath.row]forState:UIControlStateNormal];
                    
                    
                }
                
        

               
                

                
                
                break;
            
            case 2:
                
                    
            if (indexPath.row==0) {
                 
                        self.tilctrl=[[PlngTileViewController alloc]initWithNibName:@"PlngTileViewController" bundle:nil];
                
                _tilctrl.modalPresentationStyle=UIModalPresentationFormSheet;
                    [self dismissViewControllerAnimated:YES completion:^{    [self presentViewController:_tilctrl
                                                                                                animated:YES completion:NULL];
                    }];
                    _searchbar.text=@"";
                    [self SelectAllPlans];
                
                                   }
                if (indexPath.row==1) {
                    
                    planmodel*planmdl=(planmodel *)[_planlistarray objectAtIndex:btnindex];
                    Existplanstrg=[NSString stringWithFormat:@"Are you sure to create a new plan under-%@",planmdl.planid];
                    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:[NSString stringWithFormat:@"Are you sure to create a new plan under-%@",planmdl.planid] delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK",nil];
                    [alert show];
                    
                    
                }
                break;

             
    }
    
        [self.popovercontroller dismissPopoverAnimated:YES];

    
    
    }
    
    
}


-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (editingStyle==UITableViewCellEditingStyleDelete) {
        path=indexPath.row;
        [self UserLogmaindelete];
        Rightscheck*rightsmodel=(Rightscheck *)[_userrightsarray objectAtIndex:0];
        
        
        if (rightsmodel.DeleteModule==0) {
            
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:@"You dont have rights to delete a record" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
            
        }
        else
        {

        [self DeletePlan];
        [_planlistarray removeObject:indexPath];
        }
        
        
        
        
        
    }
    
}
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(tableView==_plangtable)
        
    {
        if (_plntype==1) {
            
        }
        else
        {
        return self.editing ;
        }
    }
    if(tableView==_popovertableview)
        
    {
        return self.editing ;
    }

    return YES;
    
}



-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    //alternating cell back ground color
    if(tableView==_plangtable)
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




#pragma mark-Button Actions
- (IBAction)logout:(id)sender {
    _updatebtn.enabled=YES;
     _addplanview.hidden=YES;
    UIAlertView*alert=[[UIAlertView alloc]initWithTitle:@"" message:@"Are you sure you want to logout" delegate:self cancelButtonTitle:@"Yes" otherButtonTitles:@"No", nil];
    [alert show];
    [alert resignFirstResponder];

}

- (IBAction)addplan:(id)sender {
     _updatebtn.enabled=YES;
    _plangtable.userInteractionEnabled=NO;
    _planslectionarray=[[NSMutableArray alloc]init];
    optionidentifier=1;
    self.navabar.title = @"Create";
    _cancelbtn.enabled=YES;
    //[self SelectAllCustomer];
    _addplanview.hidden=NO;
    _planselectionbtn.enabled=NO;
    [_leadcheckbtn setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
     [_custcheckbtn setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
     [_planselectionbtn setTitle:@"Select" forState:UIControlStateNormal];
     [_typebtnlbl setTitle:@"Select" forState:UIControlStateNormal];
     [_cmplexitybtnlbl setTitle:@"Select" forState:UIControlStateNormal];
    _sitefactortxtfld.text=@"";
    _loctntxtfld.text=@"";
    _ziptxtfld.text=@"";
    _selectionlabel.hidden=YES;
    _typebtnlbl.enabled=YES;
  

}
-(IBAction)closeaddview:(id)sender
{
     _updatebtn.enabled=YES;
    _addplanview.hidden=YES;
     _selectionlabel.hidden=YES;
    _plangtable.userInteractionEnabled=YES;
    
}
-(IBAction)deleteplan:(id)sender
{
  
    if (self.editing) {
        [super setEditing:NO animated:NO];
        [_plangtable setEditing:NO animated:NO];
        [_plangtable reloadData];
        
        
        
    }
    
    else{
        [super setEditing:YES animated:YES];
        [_plangtable setEditing:YES animated:YES];
        [_plangtable reloadData];
        
    }
    

}
-(IBAction)checkleadaction:(id)sender
{
    [_planselectionbtn setTitle:@"Select" forState:UIControlStateNormal];
    leadclicked=@"Clicked";
    if(leadcheck==0)
    {
        [_popovertableview reloadData];
        [_leadcheckbtn setImage:[UIImage imageNamed:@"cb_mono_on"] forState:UIControlStateNormal];
        [_custcheckbtn setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
        _planselectionbtn.enabled=YES;

        leadcheck=1;
          customercheck=0;
          _selectionlabel.hidden=NO;
        _selectionlabel.text=@"Lead";
        _planslectionarray=[[NSMutableArray alloc]init];
        [self SelectAllLeads];
        //_customerselectionBtn.enabled=NO;
        
    }
    else
    {
        [_leadcheckbtn setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
        leadcheck=0;
        _planselectionbtn.enabled=NO;
        _selectionlabel.hidden=YES;
        //_customerselectionBtn.enabled=YES;
    }
    
}
-(IBAction)checkcustomeraction:(id)sender
{    [_planselectionbtn setTitle:@"Select" forState:UIControlStateNormal];
    customerclicked=@"clicked";
    if(customercheck==0)
    {      [_popovertableview reloadData];
        [_custcheckbtn setImage:[UIImage imageNamed:@"cb_mono_on"] forState:UIControlStateNormal];
         [_leadcheckbtn setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
        customercheck=1;
        leadcheck=0;
        _planselectionbtn.enabled=YES;

        _selectionlabel.hidden=NO;
        _selectionlabel.text=@"Customer";
        _planslectionarray=[[NSMutableArray alloc]init];
        [self SelectAllCustomer];
        //_leadselectionBtn.enabled=NO;
    }
    else
    {
        [_custcheckbtn setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
        customercheck=0;
        //_leadselectionBtn.enabled=YES;
          _planselectionbtn.enabled=NO;
        _selectionlabel.hidden=YES;
    }
    
}
-(IBAction)planselection:(id)sender
{
    //[self SelectAllLeads];
   [_planselectionbtn setTitle:@"Select" forState:UIControlStateNormal];
    poptype=1;
    newpoptype=2;
    UIViewController *popovercontent=[[UIViewController alloc]init];
    UIView *popoverview=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 210, 200)];
    popoverview.backgroundColor=[UIColor whiteColor];
    _popovertableview=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, 210, 200)];
    _popovertableview.delegate=(id)self;
    _popovertableview.dataSource=(id)self;
    _popovertableview.rowHeight=32;
    _popovertableview.separatorStyle=UITableViewCellSeparatorStyleSingleLine;
    [popoverview addSubview:_popovertableview];
    popovercontent.view=popoverview;
    popovercontent.preferredContentSize=CGSizeMake(210, 200);
    self.popovercontroller=[[UIPopoverController alloc]initWithContentViewController:popovercontent];
    self.popovercontroller.popoverContentSize=CGSizeMake(210.0f, 200.0f);
    self.popovercontroller=_popovercontroller;
    [self.popovercontroller presentPopoverFromRect:_planselectionbtn.frame inView:_addplanview permittedArrowDirections:UIPopoverArrowDirectionUp animated:YES];
    
    
    
}
-(IBAction)selectdisclosure:(id)sender
{
    poptype=2;
   
        
    
    UIViewController* popoverContent = [[UIViewController alloc]init];
    UIView* popoverView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 135, 60)];
    popoverView.backgroundColor = [UIColor whiteColor];
    _popovertableview=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, 135, 60)];
    _popovertableview.delegate=(id)self;
    _popovertableview.dataSource=(id)self;
    _popovertableview.rowHeight= 31;
    //_popovertableview.separatorColor=[UIColor blackColor];
    [popoverView addSubview:_popovertableview];
    popoverContent.view = popoverView;
    popoverContent.preferredContentSize = CGSizeMake(135, 60);
    
    button = (UIButton *)sender;
    UITableViewCell *cell = (UITableViewCell *)[[button superview] superview];
    CGPoint center= button.center;
    CGPoint rootViewPoint = [button.superview convertPoint:center toView:self.plangtable];
    NSIndexPath *textFieldIndexPath = [self.plangtable indexPathForRowAtPoint:rootViewPoint];
    NSLog(@"textFieldIndexPath%d",textFieldIndexPath.row);
    btnindex=textFieldIndexPath.row;
    
    //UITableView *table = (UITableView *)[cell superview];
    self.popovercontroller = [[UIPopoverController alloc]initWithContentViewController:popoverContent];
        self.popovercontroller.popoverContentSize=CGSizeMake(135.0f, 60.0f);
        self.popovercontroller=_popovercontroller;
    [self.popovercontroller presentPopoverFromRect:_disclosurebtn.frame inView:cell permittedArrowDirections:UIPopoverArrowDirectionLeft animated:YES];
    
       //[_popovertableview reloadData];
}

-(IBAction)updateplanning:(id)sender
{
    if(optionidentifier==1)
    {
        _updatebtn.enabled=NO;
        [self UserLogmaininsert];
    }
    else if(optionidentifier==2)
    {
        [self UserLogmainupdate];
           }

    Rightscheck*rightsmodel=(Rightscheck *)[_userrightsarray objectAtIndex:0];
    
    if (rightsmodel.EditModule==0) {
        if (optionidentifier==1) {
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:@"You dont have rights to add a record" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
        }else if(optionidentifier==2)
        {
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:@"You dont have rights to edit this record" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
        }
        
    }
    else
    {
        

    
//    Validation*val=[[Validation alloc]init];
//    int value1=[val isNumeric:_ziptxtfld.text];
//    int value2=[val isNumeric:_sitefactortxtfld.text];
//   
//    
//    if(value1==0){
//        
//        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:@"Invalid Zip" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
//        [alert show];
//        
//    }
//    else if(value2==0){
//        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:@"Invalid Site Factor" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
//        [alert show];
//    }

     if([_planselectionbtn.titleLabel.text isEqualToString:@"Select"]||[_planselectionbtn.titleLabel.text isEqualToString:@""])
    {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:@"Lead/Customer is required" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
    else if([_typebtnlbl.titleLabel.text isEqualToString:@"Select"]||[_typebtnlbl.titleLabel.text isEqualToString:@""])
    {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:@"Work Type is required" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
    else
    {
    
        
  if(optionidentifier==1)
  {
      _updatebtn.enabled=NO;
      [self insertplans];
  }
    else if(optionidentifier==2)
    {
         _updatebtn.enabled=NO;
        [self UpdatePlan];
    }
    }
    }
}
-(IBAction)cancelplanning:(id)sender
{
    
     _selectionlabel.hidden=YES;
    [_leadcheckbtn setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
    [_custcheckbtn setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
    [_planselectionbtn setTitle:@"Select" forState:UIControlStateNormal];
      [_typebtnlbl setTitle:@"Select" forState:UIControlStateNormal];
    _sitefactortxtfld.text=@"";
    _ziptxtfld.text=@"";
    [_cmplexitybtnlbl setTitle:@"Select" forState:UIControlStateNormal];
 _planselectionbtn.enabled=NO;
    _loctntxtfld.text=@"";
    


}
-(IBAction)Editaction:(id)sender
{
    
    [self WorkTypecountSelect];
    
    
    
    optionidentifier=2;
     _updatebtn.enabled=YES;
    _plangtable.userInteractionEnabled=NO;
    self.navabar.title = @"Edit";
      _addplanview.hidden=NO;
     _selectionlabel.hidden=NO;
    button = (UIButton *)sender;
    CGPoint center= button.center;
    _planselectionbtn.enabled=YES;
    _cancelbtn.enabled=NO;
   
    _cancelbtn.titleLabel.textColor=[UIColor grayColor];
    CGPoint rootViewPoint = [button.superview convertPoint:center toView:self.plangtable];
    NSIndexPath *textFieldIndexPath = [self.plangtable indexPathForRowAtPoint:rootViewPoint];
    NSLog(@"textFieldIndexPath%d",textFieldIndexPath.row);
    btnindex=textFieldIndexPath.row;
    
    planmodel*planmdl=(planmodel *)[_planlistarray objectAtIndex:textFieldIndexPath.row];
    NSLog(@"ld%d",planmdl.leadid);
    NSLog(@"cust%d",planmdl.customerid);
    if (planmdl.leadid==0) {
        [_leadcheckbtn setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
        
    }
    else{
        [_leadcheckbtn setImage:[UIImage imageNamed:@"cb_mono_on"] forState:UIControlStateNormal];
        [self SelectAllLeads];
    }
    if (planmdl.customerid==0) {
        [_custcheckbtn setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
        
    }
    else{
        [_custcheckbtn setImage:[UIImage imageNamed:@"cb_mono_on"] forState:UIControlStateNormal];
       [self SelectAllCustomer];
    }
    [_planselectionbtn setTitle:planmdl.customername forState:UIControlStateNormal];
    
    _sitefactortxtfld.text=planmdl.sitefactor;
    NSLog(@"%@",_revtypelistdict);
      NSLog(@"%@",planmdl.worktypeid);
     //planmodel*planmdl=(planmodel *)[_planlistarray objectAtIndex:textFieldIndexPath.row];
    if([planmdl.masterplan stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]].length==0)
    {
        _leadcheckbtn.enabled=YES;
        _custcheckbtn.enabled=YES;
        _planselectionbtn.enabled=YES;
        _typebtnlbl.enabled=YES;
        //_typebtnlbl.userInteractionEnabled=YES;
        [_typebtnlbl setTitle:planmdl.worktype forState:UIControlStateNormal];
        
    }
    else
    {
        
        _leadcheckbtn.enabled=NO;
        _custcheckbtn.enabled=NO;
        _planselectionbtn.enabled=NO;
        _typebtnlbl.enabled=NO;
        //_typebtnlbl.userInteractionEnabled=NO;
        [_typebtnlbl setTitle:planmdl.worktype forState:UIControlStateDisabled];
        
    }

   
    _loctntxtfld.text=planmdl.location;
    _ziptxtfld.text=planmdl.zip;
    
    if ([planmdl.complexity isEqualToString:@""]) {
        [_cmplexitybtnlbl setTitle:@"Select" forState:UIControlStateNormal];
        
    }
    else{
      [_cmplexitybtnlbl setTitle:planmdl.complexity forState:UIControlStateNormal];
    }
    


}
- (IBAction)cmplxitywrkbtn:(id)sender {
    poptype=1;
    newpoptype=4;
    UIViewController *popovercontent=[[UIViewController alloc]init];
    UIView *popoverview=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 210, 120)];
    popoverview.backgroundColor=[UIColor whiteColor];
    _popovertableview=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, 210, 120)];
    _popovertableview.delegate=(id)self;
    _popovertableview.dataSource=(id)self;
    _popovertableview.rowHeight=32;
    _popovertableview.separatorStyle=UITableViewCellSeparatorStyleSingleLine;
    [popoverview addSubview:_popovertableview];
    popovercontent.view=popoverview;
    popovercontent.preferredContentSize=CGSizeMake(210, 120);
    self.popovercontroller=[[UIPopoverController alloc]initWithContentViewController:popovercontent];
    self.popovercontroller.popoverContentSize=CGSizeMake(210.0f, 120.0f);
    self.popovercontroller=_popovercontroller;

    [self.popovercontroller presentPopoverFromRect:_cmplexitybtnlbl.frame inView:_addplanview permittedArrowDirections:UIPopoverArrowDirectionUp animated:YES];
    [_popovertableview reloadData];

}
- (IBAction)typebtn:(id)sender {
    poptype=1;
    newpoptype=3;
    UIViewController *popovercontent=[[UIViewController alloc]init];
    UIView *popoverview=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 210, 200)];
    popoverview.backgroundColor=[UIColor whiteColor];
    _popovertableview=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, 210, 200)];
    _popovertableview.delegate=(id)self;
    _popovertableview.dataSource=(id)self;
    _popovertableview.rowHeight=32;
    _popovertableview.separatorStyle=UITableViewCellSeparatorStyleSingleLine;
    [popoverview addSubview:_popovertableview];
    popovercontent.view=popoverview;
    popovercontent.preferredContentSize=CGSizeMake(210, 200);
    self.popovercontroller=[[UIPopoverController alloc]initWithContentViewController:popovercontent];
    self.popovercontroller.popoverContentSize=CGSizeMake(210.0f, 200.0f);
    self.popovercontroller=_popovercontroller;

    [self.popovercontroller presentPopoverFromRect:_typebtnlbl.frame inView:_addplanview permittedArrowDirections:UIPopoverArrowDirectionUp animated:YES];
    
    [self WorkTypeSelect];
    
    
}

#pragma mark - SearchBar

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    _searchstring=_searchbar.text;
    //NSLog(@"search%@",searchstring);
    [self SearchPlan];
    [searchBar resignFirstResponder];
    
}
- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar{
    [self SelectAllPlans];
    
}
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    if ([_searchbar.text length]==0) {
        
        [self SelectAllPlans];
        // [searchBar resignFirstResponder];
        
        
    }
    //[searchBar resignFirstResponder];
    
}
#pragma mark-webservices
#pragma mark- WebService

-(void)UserRightsforparticularmoduleselect{
    webtype=10;
    recordResults = FALSE;
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    userid = [defaults objectForKey:@"Userid"];
    moduleid=5;
    
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<UserRightsforparticularmoduleselect xmlns=\"http://ios.kontract360.com/\">\n"
                   "<UserId>%d</UserId>\n"
                   "<ModuleId>%d</ModuleId>\n"
                   "</UserRightsforparticularmoduleselect>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",[userid integerValue],moduleid];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    //   NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    //   NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/UserRightsforparticularmoduleselect" forHTTPHeaderField:@"Soapaction"];
    
    [theRequest addValue: msgLength forHTTPHeaderField:@"Content-Length"];
    [theRequest setHTTPMethod:@"POST"];
    [theRequest setHTTPBody: [soapMessage dataUsingEncoding:NSUTF8StringEncoding]];
    
    
    NSURLConnection *theConnection = [[NSURLConnection alloc] initWithRequest:theRequest delegate:self];
  
    
    if( theConnection )
    {
        _webData = [NSMutableData data];
    }
    else
    {
        ////NSLog(@"theConnection is NULL");
    }
    
}

-(void)SelectAllPlans
{
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<SelectAllPlans xmlns=\"http://ios.kontract360.com/\">\n"
                   
                   "</SelectAllPlans>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n"];
    NSLog(@"soapmsg%@",soapMessage);
    
    
 //   NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];

     NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/SelectAllPlans" forHTTPHeaderField:@"Soapaction"];
    
    [theRequest addValue: msgLength forHTTPHeaderField:@"Content-Length"];
    [theRequest setHTTPMethod:@"POST"];
    [theRequest setHTTPBody: [soapMessage dataUsingEncoding:NSUTF8StringEncoding]];
    
    
    NSURLConnection *theConnection = [[NSURLConnection alloc] initWithRequest:theRequest delegate:self];
    
    if( theConnection )
    {
        _webData = [NSMutableData data];
    }
    else
    {
        ////NSLog(@"theConnection is NULL");
    }
    
}

-(void)SelectAllCustomer{
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<SelectAllCustomer xmlns=\"http://ios.kontract360.com/\">\n"
                   
                   "</SelectAllCustomer>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n"];
    NSLog(@"soapmsg%@",soapMessage);
      NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
 //   NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/SelectAllCustomer" forHTTPHeaderField:@"Soapaction"];
    
    [theRequest addValue: msgLength forHTTPHeaderField:@"Content-Length"];
    [theRequest setHTTPMethod:@"POST"];
    [theRequest setHTTPBody: [soapMessage dataUsingEncoding:NSUTF8StringEncoding]];
    
    
    NSURLConnection *theConnection = [[NSURLConnection alloc] initWithRequest:theRequest delegate:self];
    
    if( theConnection )
    {
        _webData = [NSMutableData data];
    }
    else
    {
        ////NSLog(@"theConnection is NULL");
    }
    
}
-(void)SelectAllLeads{
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<SelectAllLeads xmlns=\"http://ios.kontract360.com/\">\n"
                   
                   "</SelectAllLeads>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n"];
    NSLog(@"soapmsg%@",soapMessage);
    
      NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
  //  NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/SelectAllLeads" forHTTPHeaderField:@"Soapaction"];
    
    [theRequest addValue: msgLength forHTTPHeaderField:@"Content-Length"];
    [theRequest setHTTPMethod:@"POST"];
    [theRequest setHTTPBody: [soapMessage dataUsingEncoding:NSUTF8StringEncoding]];
    
    
    NSURLConnection *theConnection = [[NSURLConnection alloc] initWithRequest:theRequest delegate:self];
    
    if( theConnection )
    {
        _webData = [NSMutableData data];
    }
    else
    {
        ////NSLog(@"theConnection is NULL");
    }
    
}
-(void)insertplans
{
    webtype=1;
    NSString *ledid;
    NSString *custid;
    NSInteger lead=0;
    NSInteger customer=0;
    
    recordResults = FALSE;
    
    
    NSString *soapMessage;
  
    if (leadcheck==0)
    {
        ledid=0;
        lead=0;
    }
    else if(leadcheck==1)
    {
        ledid=[_leaddict objectForKey:_planselectionbtn.titleLabel.text];
        lead=1;
    }
    if(customercheck==0)
    {
        custid=0;
        customer=0;
    }
    else if(customercheck==1)
    {
        custid=[_customerdict objectForKey:_planselectionbtn.titleLabel.text];
         customer=1;
        
    }
    NSString*complex;
    if ([_cmplexitybtnlbl.titleLabel.text isEqualToString:@"Select"]) {
        complex=@"";
        
    }
    else{
        complex=_cmplexitybtnlbl.titleLabel.text;
        
    }
   
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<InsertPlan xmlns=\"http://ios.kontract360.com/\">\n"
                   "<customername>%@</customername>\n"
                   "<leadid>%d</leadid>\n"
                   "<cusid>%d</cusid>\n"
                   "<id>%d</id>\n"
                   "<Fold_ID>%d</Fold_ID>\n"
                   "<WorkType>%d</WorkType>\n"
                   "<SiteFactor>%f</SiteFactor>\n"
                   "<Location>%@</Location>\n"
                   "<Zip>%@</Zip>\n"
                   "<Complexity>%@</Complexity>\n"
                   "<lead>%d</lead>\n"
                   "<customer>%d</customer>\n"
                   "</InsertPlan>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_planselectionbtn.titleLabel.text,[ledid integerValue],[custid integerValue],0,0,[[_typelistdict objectForKey:_typebtnlbl.titleLabel.text]integerValue],[_sitefactortxtfld.text floatValue],_loctntxtfld.text,_ziptxtfld.text,complex,lead,customer];
    NSLog(@"soapmsg%@",soapMessage);
    
      NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
//NSURL *url = [NSURL URLWithString:@"testUSA.kontract360.com/service.asmx"];
 //   NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/InsertPlan" forHTTPHeaderField:@"Soapaction"];
    
    [theRequest addValue: msgLength forHTTPHeaderField:@"Content-Length"];
    [theRequest setHTTPMethod:@"POST"];
    [theRequest setHTTPBody: [soapMessage dataUsingEncoding:NSUTF8StringEncoding]];
    
    
    NSURLConnection *theConnection = [[NSURLConnection alloc] initWithRequest:theRequest delegate:self];
    
    if( theConnection )
    {
        _webData = [NSMutableData data];
    }
    else
    {
        ////NSLog(@"theConnection is NULL");
    }

}
-(void)CreateFolderforPlan
{
    webtype=1;
    NSString *ledid;
    NSString *custid;
    NSInteger lead=0;
    NSInteger customer=0;
    
    recordResults = FALSE;
    
    
    NSString *soapMessage;
    
    if (leadcheck==0)
    {
        ledid=0;
        lead=0;
    }
    else if(leadcheck==1)
    {
        ledid=[_leaddict objectForKey:_planselectionbtn.titleLabel.text];
        lead=1;
    }
    if(customercheck==0)
    {
        custid=0;
        customer=0;
    }
    else if(customercheck==1)
    {
        custid=[_customerdict objectForKey:_planselectionbtn.titleLabel.text];
        customer=1;
        
    }
    NSString*complex;
    if ([_cmplexitybtnlbl.titleLabel.text isEqualToString:@"Select"]) {
        complex=@"";
        
    }
    else{
        complex=_cmplexitybtnlbl.titleLabel.text;
        
    }
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<CreateFolderforPlan xmlns=\"http://ios.kontract360.com/\">\n"
                   "<planid>%@</planid>\n"
                   "<customername>%@</customername>\n"
                   "<lead>%d</lead>\n"
                   "<customer>%d</customer>\n"
                   "</CreateFolderforPlan>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",floderplan,_planselectionbtn.titleLabel.text,lead,customer];
    NSLog(@"soapmsg%@",soapMessage);
    
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    //NSURL *url = [NSURL URLWithString:@"testUSA.kontract360.com/service.asmx"];
    //   NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/CreateFolderforPlan" forHTTPHeaderField:@"Soapaction"];
    
    [theRequest addValue: msgLength forHTTPHeaderField:@"Content-Length"];
    [theRequest setHTTPMethod:@"POST"];
    [theRequest setHTTPBody: [soapMessage dataUsingEncoding:NSUTF8StringEncoding]];
    
    
    NSURLConnection *theConnection = [[NSURLConnection alloc] initWithRequest:theRequest delegate:self];
    
    if( theConnection )
    {
        _webData = [NSMutableData data];
    }
    else
    {
        ////NSLog(@"theConnection is NULL");
    }
    
}




-(void)UpdatePlan
{
    webtype=1;
    NSInteger lead;
    NSInteger cust;
    
    NSInteger newlead;
    NSInteger newcust;

    recordResults = FALSE;
    NSString *soapMessage;
     planmodel*plmdl=(planmodel *)[_planlistarray objectAtIndex:btnindex];
   if([leadclicked isEqualToString:@"Clicked"])
   {
       NSString *ledid;
      
    if (leadcheck==0)
    {
        ledid=0;
        newlead=0;
        lead=[ledid integerValue];
    }
    else //if(leadcheck==1)
    {
        ledid=[_leaddict objectForKey:_planselectionbtn.titleLabel.text];
        lead=[ledid integerValue];
        newlead=1;
    }
}
    else
    {
        lead=plmdl.leadid;
         newlead=1;
    }
    if([customerclicked isEqualToString:@"clicked"])
    {
         NSString *custid;
    if(customercheck==0)
    {
        custid=0;
        cust=[custid integerValue];
        newcust=0;
    }
    else //if(customercheck==1)
    {
        custid=[_customerdict objectForKey:_planselectionbtn.titleLabel.text];
        cust=[custid integerValue];
        newcust=1;
    }
    }
    else
    {
        cust=plmdl.customerid;
         newcust=1;
    }
    
    
    NSString*complex;
    if ([_cmplexitybtnlbl.titleLabel.text isEqualToString:@"Select"]) {
        complex=@"";
        
    }
    else{
        complex=_cmplexitybtnlbl.titleLabel.text;
        
    }

    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<UpdatePlan xmlns=\"http://ios.kontract360.com/\">\n"
                   "<planid>%@</planid>\n"
                   "<customername>%@</customername>\n"
                   "<leadid>%d</leadid>\n"
                   "<cusid>%d</cusid>\n"
                   "<Fold_ID>%d</Fold_ID>\n"
                   "<WorkType>%d</WorkType>\n"
                   "<SiteFactor>%f</SiteFactor>\n"
                   "<Location>%@</Location>\n"
                   "<Zip>%@</Zip>\n"
                   "<Complexity>%@</Complexity>\n"
                   "<lead>%d</lead>\n"
                   "<customer>%d</customer>\n"
                   "</UpdatePlan>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",plmdl.planid,_planselectionbtn.titleLabel.text,lead,cust,0,[[_typelistdict objectForKey:_typebtnlbl.titleLabel.text]integerValue ],[_sitefactortxtfld.text floatValue],_loctntxtfld.text,_ziptxtfld.text,complex,newlead,newcust];
    NSLog(@"soapmsg%@",soapMessage);
    
      NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
  //  NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/UpdatePlan" forHTTPHeaderField:@"Soapaction"];
    
    [theRequest addValue: msgLength forHTTPHeaderField:@"Content-Length"];
    [theRequest setHTTPMethod:@"POST"];
    [theRequest setHTTPBody: [soapMessage dataUsingEncoding:NSUTF8StringEncoding]];
    
    
    NSURLConnection *theConnection = [[NSURLConnection alloc] initWithRequest:theRequest delegate:self];
    
    if( theConnection )
    {
        _webData = [NSMutableData data];
    }
    else
    {
        ////NSLog(@"theConnection is NULL");
    }
    
}

-(void)DeletePlan
{
    webtype=3;
    
    recordResults = FALSE;
    NSString *soapMessage;
    
   planmodel*plnmdl=(planmodel *)[_planlistarray objectAtIndex:path];
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   "<DeletePlan xmlns=\"http://ios.kontract360.com/\">\n"
                   "<planid>%@</planid>\n"
                   "</DeletePlan>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",plnmdl.planid];
    NSLog(@"soapmsg%@",soapMessage);
    
      NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
  //  NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/DeletePlan" forHTTPHeaderField:@"Soapaction"];
    
    [theRequest addValue: msgLength forHTTPHeaderField:@"Content-Length"];
    [theRequest setHTTPMethod:@"POST"];
    [theRequest setHTTPBody: [soapMessage dataUsingEncoding:NSUTF8StringEncoding]];
    
    
    NSURLConnection *theConnection = [[NSURLConnection alloc] initWithRequest:theRequest delegate:self];
    
    if( theConnection )
    {
        _webData = [NSMutableData data];
    }
    else
    {
        ////NSLog(@"theConnection is NULL");
    }
    
}
-(void)SearchPlan
{
   // webtype=1;
    
    recordResults = FALSE;
    NSString *soapMessage;
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   "<SearchPlan xmlns=\"http://ios.kontract360.com/\">\n"
                    "<searchtext>%@</searchtext>\n"
                   "</SearchPlan>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_searchstring];
    NSLog(@"soapmsg%@",soapMessage);
    
      NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
  //  NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/SearchPlan" forHTTPHeaderField:@"Soapaction"];
    
    [theRequest addValue: msgLength forHTTPHeaderField:@"Content-Length"];
    [theRequest setHTTPMethod:@"POST"];
    [theRequest setHTTPBody: [soapMessage dataUsingEncoding:NSUTF8StringEncoding]];
    
    
    NSURLConnection *theConnection = [[NSURLConnection alloc] initWithRequest:theRequest delegate:self];
    
    if( theConnection )
    {
        _webData = [NSMutableData data];
    }
    else
    {
        ////NSLog(@"theConnection is NULL");
    }
    
}
-(void)WorkTypeSelect{
    
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<WorkTypeSelect xmlns=\"http://ios.kontract360.com/\">\n"
                   "</WorkTypeSelect>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n"];
    NSLog(@"soapmsg%@",soapMessage);
    
      NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
  //  NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/WorkTypeSelect" forHTTPHeaderField:@"Soapaction"];
    [theRequest addValue: msgLength forHTTPHeaderField:@"Content-Length"];
    [theRequest setHTTPMethod:@"POST"];
    [theRequest setHTTPBody: [soapMessage dataUsingEncoding:NSUTF8StringEncoding]];
    
    
    NSURLConnection *theConnection = [[NSURLConnection alloc] initWithRequest:theRequest delegate:self];
    
    if( theConnection )
    {
        _webData = [NSMutableData data];
    }
    else
    {
        ////NSLog(@"theConnection is NULL");
    }
    
}
-(void)UserLogmaininsert{
    
    recordResults = FALSE;
    
    NSDate *date = [NSDate date];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    NSTimeZone *zone = [NSTimeZone localTimeZone];
    [formatter setTimeZone:zone];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    // NSLog(@"Date %@",[formatter stringFromDate:date]);
    NSString*curntdate=[formatter stringFromDate:date];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    NSString*useridname = [defaults objectForKey:@"Userid"];
    NSString*extnalip=[defaults objectForKey:@"Externalip"];
    NSString*intrnalip=[defaults objectForKey:@"Internalip"];
    NSString*Udid=[defaults objectForKey:@"UDID"];
    
    
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<UserLogmaininsert xmlns=\"http://ios.kontract360.com/\">\n"
                   "<dateandtime>%@</dateandtime>\n"
                   "<userid>%d</userid>\n"
                   "<moduleid>%d</moduleid>\n"
                   "<Action>%@</Action>\n"
                   "<platform>%@</platform>\n"
                   "<externalip>%@</externalip>\n"
                   "<internalip>%@</internalip>\n"
                   "<devicenumber>%@</devicenumber>\n"
                   "<documentId>%d</documentId>\n"
                   "</UserLogmaininsert>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",curntdate,[useridname integerValue],43,@"Create",@"iOS",extnalip,intrnalip,Udid,0];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    //   NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
      NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/UserLogmaininsert" forHTTPHeaderField:@"Soapaction"];
    
    [theRequest addValue: msgLength forHTTPHeaderField:@"Content-Length"];
    [theRequest setHTTPMethod:@"POST"];
    [theRequest setHTTPBody: [soapMessage dataUsingEncoding:NSUTF8StringEncoding]];
    
    
    NSURLConnection *theConnection = [[NSURLConnection alloc] initWithRequest:theRequest delegate:self];
    
    if( theConnection )
    {
        _webData = [NSMutableData data];
    }
    else
    {
        ////NSLog(@"theConnection is NULL");
    }
    
}

-(void)UserLogmainupdate{
    
    recordResults = FALSE;
    
    NSDate *date = [NSDate date];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    NSTimeZone *zone = [NSTimeZone localTimeZone];
    [formatter setTimeZone:zone];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    // NSLog(@"Date %@",[formatter stringFromDate:date]);
    NSString*curntdate=[formatter stringFromDate:date];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    NSString*useridname = [defaults objectForKey:@"Userid"];
    NSString*extnalip=[defaults objectForKey:@"Externalip"];
    NSString*intrnalip=[defaults objectForKey:@"Internalip"];
    NSString*Udid=[defaults objectForKey:@"UDID"];
    
    
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<UserLogmaininsert xmlns=\"http://ios.kontract360.com/\">\n"
                   "<dateandtime>%@</dateandtime>\n"
                   "<userid>%d</userid>\n"
                   "<moduleid>%d</moduleid>\n"
                   "<Action>%@</Action>\n"
                   "<platform>%@</platform>\n"
                   "<externalip>%@</externalip>\n"
                   "<internalip>%@</internalip>\n"
                   "<devicenumber>%@</devicenumber>\n"
                   "<documentId>%d</documentId>\n"
                   "</UserLogmaininsert>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",curntdate,[useridname integerValue],43,@"Edit",@"iOS",extnalip,intrnalip,Udid,0];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    //   NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
      NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/UserLogmaininsert" forHTTPHeaderField:@"Soapaction"];
    
    [theRequest addValue: msgLength forHTTPHeaderField:@"Content-Length"];
    [theRequest setHTTPMethod:@"POST"];
    [theRequest setHTTPBody: [soapMessage dataUsingEncoding:NSUTF8StringEncoding]];
    
    
    NSURLConnection *theConnection = [[NSURLConnection alloc] initWithRequest:theRequest delegate:self];
    
    if( theConnection )
    {
        _webData = [NSMutableData data];
    }
    else
    {
        ////NSLog(@"theConnection is NULL");
    }
    
}

-(void)UserLogmaindelete{
    
    recordResults = FALSE;
    
    NSDate *date = [NSDate date];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    NSTimeZone *zone = [NSTimeZone localTimeZone];
    [formatter setTimeZone:zone];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    // NSLog(@"Date %@",[formatter stringFromDate:date]);
    NSString*curntdate=[formatter stringFromDate:date];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    NSString*useridname = [defaults objectForKey:@"Userid"];
    NSString*extnalip=[defaults objectForKey:@"Externalip"];
    NSString*intrnalip=[defaults objectForKey:@"Internalip"];
    NSString*Udid=[defaults objectForKey:@"UDID"];
    
    
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<UserLogmaininsert xmlns=\"http://ios.kontract360.com/\">\n"
                   "<dateandtime>%@</dateandtime>\n"
                   "<userid>%d</userid>\n"
                   "<moduleid>%d</moduleid>\n"
                   "<Action>%@</Action>\n"
                   "<platform>%@</platform>\n"
                   "<externalip>%@</externalip>\n"
                   "<internalip>%@</internalip>\n"
                   "<devicenumber>%@</devicenumber>\n"
                   "<documentId>%d</documentId>\n"
                   "</UserLogmaininsert>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",curntdate,[useridname integerValue],43,@"Delete",@"iOS",extnalip,intrnalip,Udid,0];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    //   NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
      NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/UserLogmaininsert" forHTTPHeaderField:@"Soapaction"];
    
    [theRequest addValue: msgLength forHTTPHeaderField:@"Content-Length"];
    [theRequest setHTTPMethod:@"POST"];
    [theRequest setHTTPBody: [soapMessage dataUsingEncoding:NSUTF8StringEncoding]];
    
    
    NSURLConnection *theConnection = [[NSURLConnection alloc] initWithRequest:theRequest delegate:self];
    
    if( theConnection )
    {
        _webData = [NSMutableData data];
    }
    else
    {
        ////NSLog(@"theConnection is NULL");
    }
    
}

-(void)WorkTypecountSelect{
     planmodel*plmdl=(planmodel *)[_planlistarray objectAtIndex:btnindex];
    
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<WorkTypecountSelect xmlns=\"http://ios.kontract360.com/\">\n"
                    "<PlanId>%@</PlanId>\n"
                   "</WorkTypecountSelect>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",plmdl.planid];
    NSLog(@"soapmsg%@",soapMessage);
    
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    //  NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/WorkTypecountSelect" forHTTPHeaderField:@"Soapaction"];
    [theRequest addValue: msgLength forHTTPHeaderField:@"Content-Length"];
    [theRequest setHTTPMethod:@"POST"];
    [theRequest setHTTPBody: [soapMessage dataUsingEncoding:NSUTF8StringEncoding]];
    
    
    NSURLConnection *theConnection = [[NSURLConnection alloc] initWithRequest:theRequest delegate:self];
    
    if( theConnection )
    {
        _webData = [NSMutableData data];
    }
    else
    {
        ////NSLog(@"theConnection is NULL");
    }
    
}
-(void)CreateNewPlanFromExisting{
    planmodel*plmdl=(planmodel *)[_planlistarray objectAtIndex:btnindex];
    
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<CreateNewPlanFromExisting xmlns=\"http://ios.kontract360.com/\">\n"
                   "<plID>%@</plID>\n"
                   "</CreateNewPlanFromExisting>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",plmdl.planid];
    NSLog(@"soapmsg%@",soapMessage);
    
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    //  NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/CreateNewPlanFromExisting" forHTTPHeaderField:@"Soapaction"];
    [theRequest addValue: msgLength forHTTPHeaderField:@"Content-Length"];
    [theRequest setHTTPMethod:@"POST"];
    [theRequest setHTTPBody: [soapMessage dataUsingEncoding:NSUTF8StringEncoding]];
    
    
    NSURLConnection *theConnection = [[NSURLConnection alloc] initWithRequest:theRequest delegate:self];
    
    if( theConnection )
    {
        _webData = [NSMutableData data];
    }
    else
    {
        ////NSLog(@"theConnection is NULL");
    }
    
}
-(void)Logoutselect{
    recordResults = FALSE;
    NSDate *date = [NSDate date];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    NSTimeZone *zone = [NSTimeZone localTimeZone];
    [formatter setTimeZone:zone];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    // NSLog(@"Date %@",[formatter stringFromDate:date]);
    NSString*curntdate=[formatter stringFromDate:date];
    
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<Logoutselect xmlns=\"http://ios.kontract360.com/\">\n"
                   "<UserName>%@</UserName>\n"
                   "<LogOutTime>%@</LogOutTime>\n"
                   "</Logoutselect>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_username,curntdate];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    //   NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    //    NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/Logoutselect" forHTTPHeaderField:@"Soapaction"];
    
    [theRequest addValue: msgLength forHTTPHeaderField:@"Content-Length"];
    [theRequest setHTTPMethod:@"POST"];
    [theRequest setHTTPBody: [soapMessage dataUsingEncoding:NSUTF8StringEncoding]];
    
    
    NSURLConnection *theConnection = [[NSURLConnection alloc] initWithRequest:theRequest delegate:self];
    
    if( theConnection )
    {
        _webData = [NSMutableData data];
    }
    else
    {
        ////NSLog(@"theConnection is NULL");
    }
    
}


#pragma mark - Connection
-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
	[_webData setLength: 0];
}
-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
   	[_webData appendData:data];
}
-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    UIAlertView *  Alert=[[UIAlertView alloc]initWithTitle:@"" message:@"Please Check Your Connection" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    
    [Alert show];
}
-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSLog(@"DONE. Received Bytes: %d", [_webData length]);
	NSString *theXML = [[NSString alloc] initWithBytes: [_webData mutableBytes] length:[_webData length] encoding:NSUTF8StringEncoding];
	NSLog(@"xml===== %@",theXML);
	
	
	if( _xmlParser )
	{
		
	}
	
	_xmlParser = [[NSXMLParser alloc] initWithData: _webData];
	[_xmlParser setDelegate:(id)self];
	[_xmlParser setShouldResolveExternalEntities: YES];
	[_xmlParser parse];
    [_popovertableview reloadData];
    [_plangtable reloadData];
//    if(webtype==1||webtype==3)
//    {
//        [self SelectAllPlans];
//        _searchbar.text=@"";
//        webtype=0;
//    }
    
}
#pragma mark-xml parser
-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *) namespaceURI qualifiedName:(NSString *)qName
   attributes: (NSDictionary *)attributeDict{
    if([elementName isEqualToString:@"UserRightsforparticularmoduleselectResponse"])
    {
        
        checkws=2;
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    
    
    if([elementName isEqualToString:@"EntryId"])
    {
        _userrightsarray=[[NSMutableArray alloc]init];
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"UserId"])
    {
        
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"ModuleId"])
    {
        
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"ViewModule"])
    {
        
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"EditModule"])
    {
        
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"DeleteModule"])
    {
        
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"PrintModule"])
    {
        
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    

    if([elementName isEqualToString:@"LogoutselectResponse"])
    {
        
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"message"])
    {
        
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }

    if([elementName isEqualToString:@"SelectAllLeadsResult"])
    {
        _planslectionarray=[[NSMutableArray alloc]init];
        _leaddict=[[NSMutableDictionary alloc]init];
        _leadbiddict=[[NSMutableDictionary alloc]init];
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"LeadId"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"BidStatus"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }

    if([elementName isEqualToString:@"CompanyName"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"SelectAllCustomerResult"])
    {
        _planslectionarray=[[NSMutableArray alloc]init];
        _customerdict=[[NSMutableDictionary alloc]init];
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"Id"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"CustomerName"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"SelectAllPlansResult"])
    {
        _planlistarray=[[NSMutableArray alloc]init];
       
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"planid"])
    {
       
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"customername"])
    {
       
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"leadid"])
    {
        
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"customerid"])
    {
        
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"id"])
    {
        
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"PlanWorkType"])
    {
        
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"Worktype"])
    {
        
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }

    if([elementName isEqualToString:@"SiteFactor"])
    {
        
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"Location"])
    {
        
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"Zip"])
    {
        
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"masterplan"])
    {
        
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }

    if([elementName isEqualToString:@"Complexity"])
    {
        
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"manhrs"])
    {
        
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"eqphrs"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"Mathrs"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }

    if([elementName isEqualToString:@"DeletePlanResult"])
    {

        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;


    }
    if([elementName isEqualToString:@"Column1"])
    {
        
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
        
    }
    
    if([elementName isEqualToString:@"result"])
    {
        
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
        
    }

    if([elementName isEqualToString:@"SearchPlanResponse"])
    {
        _planlistarray=[[NSMutableArray alloc]init];
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;

    }
    if([elementName isEqualToString:@"entryid"])
    {
       
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }

    if([elementName isEqualToString:@"WorkTypeSelectResult"])
    {
        _typelistarray=[[NSMutableArray alloc]init];
        _typelistdict=[[NSMutableDictionary alloc]init];
        _revtypelistdict=[[NSMutableDictionary alloc]init];

        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    if([elementName isEqualToString:@"ID"])
    {
       
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    if([elementName isEqualToString:@"WorkType"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    if([elementName isEqualToString:@"result1"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"WorkTypecountSelectResponse"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"WorkTypecountSelectResponse"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }

    if([elementName isEqualToString:@"CreateNewPlanFromExistingResponse"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"records"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }

}

-(void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    
    
    
	if( recordResults )
        
	{
        [_soapResults appendString: string];
    }
}
-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    if([elementName isEqualToString:@"EntryId"])
    {
        
        
        recordResults = FALSE;
        _rights=[[Rightscheck alloc]init];
        _rights.entryid=[_soapResults integerValue];
        
        _soapResults=nil;
    }
//    if([elementName isEqualToString:@"result"])
//    {
//        
//        
//        recordResults = FALSE;
//        
//        _result=@"Not yet set";
//        //        if ([_soapResults isEqualToString:@"0"]) {
//        //            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:@"You don’t have right to view this form" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
//        //            [alert show];
//        //        }
//        
//        _soapResults=nil;
//    }
    
    if([elementName isEqualToString:@"UserId"])
    {
        
        
        recordResults = FALSE;
        
        _rights.userid=[_soapResults integerValue];
        
        _soapResults=nil;
    }
    
    if([elementName isEqualToString:@"ModuleId"])
    {
        
        
        recordResults = FALSE;
        
        _rights.moduleid=[_soapResults integerValue];
        
        _soapResults=nil;
        
    }
    if([elementName isEqualToString:@"ViewModule"])
    {
        
        recordResults = FALSE;
        
        if ([_soapResults isEqualToString:@"true"]) {
            _rights.ViewModule=1;
            
            
        }
        else{
            _rights.ViewModule=0;
            
        }
        
        
        
        _soapResults=nil;
        
        
    }
    if([elementName isEqualToString:@"EditModule"])
    {
        recordResults = FALSE;
        if ([_soapResults isEqualToString:@"true"]) {
            _rights.EditModule=1;
            
            
        }
        else{
            _rights.EditModule=0;
            
        }
        _soapResults=nil;
        
        
    }
    if([elementName isEqualToString:@"DeleteModule"])
    {
        recordResults = FALSE;
        if ([_soapResults isEqualToString:@"true"]) {
            _rights.DeleteModule=1;
            
            
        }
        else{
            _rights.DeleteModule=0;
            
        }
        _soapResults=nil;
        
    }
    if([elementName isEqualToString:@"PrintModule"])
    {
        recordResults = FALSE;
        if ([_soapResults isEqualToString:@"true"]) {
            _rights.PrintModule=1;
            
            
        }
        else{
            _rights.PrintModule=0;
            
        }
        
        
        
        [_userrightsarray addObject:_rights];
        _soapResults=nil;
        
    }

    
    if([elementName isEqualToString:@"message"]){
        
        recordResults = FALSE;
        [self.navigationController popToRootViewControllerAnimated:YES];
        
        
        _soapResults=nil;
    }

    if([elementName isEqualToString:@"SelectAllLeadsResult"])
    {
        
        recordResults = FALSE;
        
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"LeadId"])
    {
        
        recordResults = FALSE;
        _leadstring=_soapResults;
        _soapResults = nil;
    }
       if([elementName isEqualToString:@"CompanyName"])
    {
        
        recordResults = FALSE;
        [_leaddict setObject:_leadstring forKey:_soapResults];
         bidstring=_soapResults;
        [_planslectionarray addObject:_soapResults];
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"BidStatus"])
    {
        
        recordResults = FALSE;
       
        [_leadbiddict setObject:_soapResults forKey:bidstring];
        _soapResults = nil;
    }

    if([elementName isEqualToString:@"SelectAllLeadsResult"])
    {
        
        recordResults = FALSE;
        
        _soapResults = nil;
    } if([elementName isEqualToString:@"Id"])
    {
        
        recordResults = FALSE;
        _customerstring=_soapResults;
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"CustomerName"])
    {
        
        recordResults = FALSE;
        [_customerdict setObject:_customerstring forKey:_soapResults];
        [_planslectionarray addObject:_soapResults];

        _soapResults = nil;
    }
    if([elementName isEqualToString:@"SelectAllPlansResult"])
    {
        
        recordResults = FALSE;
        
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"entryid"])
    {
        
        recordResults = FALSE;
        
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"planid"])
    {
        
        recordResults = FALSE;
        _plnmdl=[[planmodel alloc]init];
        _plnmdl.planid=_soapResults;
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"customername"])
    {
        
        recordResults = FALSE;
        _plnmdl.customername=_soapResults;
        _soapResults = nil;
    }

    if([elementName isEqualToString:@"leadid"])
    {
        
        recordResults = FALSE;
        _plnmdl.leadid=[_soapResults integerValue];
        _soapResults = nil;
    }

    if([elementName isEqualToString:@"customerid"])
    {
        
        recordResults = FALSE;
        _plnmdl.customerid=[_soapResults integerValue];
        _soapResults = nil;
    }

    if([elementName isEqualToString:@"id"])
    {
        
        recordResults = FALSE;
        _plnmdl.idvalue=[_soapResults integerValue];
        
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"Fold_ID"])
    {
        
        
        recordResults = FALSE;
       
        _soapResults = nil;
    }

    if([elementName isEqualToString:@"PlanWorkType"])
    {
        
        
       recordResults = FALSE;
        _plnmdl.worktypeid=_soapResults;
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"Worktype"])
    {
        
        
        recordResults = FALSE;
        _plnmdl.worktype=_soapResults;
        _soapResults = nil;

    }

    if([elementName isEqualToString:@"SiteFactor"])
    {
        
        
        recordResults = FALSE;
        _plnmdl.sitefactor=_soapResults;
      

        _soapResults = nil;

    }
    if([elementName isEqualToString:@"Location"])
    {
        
        
        recordResults = FALSE;
        _plnmdl.location=_soapResults;
      
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"Zip"])
    {
        
        
        recordResults = FALSE;
        _plnmdl.zip=[_soapResults stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
        
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"masterplan"])
    {
        
        
        recordResults = FALSE;
        _plnmdl.masterplan=[_soapResults stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
        
        _soapResults = nil;
    }

    if([elementName isEqualToString:@"Complexity"])
    {
        
        
        recordResults = FALSE;
        _plnmdl.complexity=_soapResults;
        
          [_planlistarray addObject:_plnmdl];
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"manhrs"])
    {
        
        
        recordResults = FALSE;
        _plnmdl.manhrs=[_soapResults stringByReplacingOccurrencesOfString:@"-" withString:@""];
        
        
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"eqphrs"])
    {
        
        
        recordResults = FALSE;
        _plnmdl.equphrs=[_soapResults stringByReplacingOccurrencesOfString:@"-" withString:@""];
      
        
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"Mathrs"])
    {
        
        
        recordResults = FALSE;
        _plnmdl.mathrs=[_soapResults stringByReplacingOccurrencesOfString:@"-" withString:@""];
        
        
        _soapResults = nil;
    }

    if([elementName isEqualToString:@"DeletePlanResult"])
    {
        
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
        
    }


    if([elementName isEqualToString:@"Column1"])
    {
        _result=_soapResults;
        recordResults = FALSE;
        //if (webtype==3) {
            
        
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:_soapResults delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
       // }
        _soapResults = nil;
    }
    
    if([elementName isEqualToString:@"result1"])
    {
         recordResults = FALSE;
        floderplan=_soapResults;
        [self CreateFolderforPlan];
        _soapResults = nil;

    }
    if([elementName isEqualToString:@"result"])
    {
        
        _result=_soapResults;
        recordResults = FALSE;
         //if(webtype==1){
           
       // }

      //else
         if ([_soapResults isEqualToString:@"0"])  {
            _result=@"Not yet set";
        }
        else
        {
          if (webtype!=3) {
            
              
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:_soapResults delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
                [self SelectAllPlans];
                _searchbar.text=@"";
              
        
        }
        else if (webtype==3) {
            if ([_soapResults isEqualToString:@"deleted"]) {
                [self SelectAllPlans];
                _searchbar.text=@"";
                
            }
            else
            {
                UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:_result delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                [alert show];
                [self SelectAllPlans];
                _searchbar.text=@"";
            }
 
        }
        }
        _soapResults = nil;

        
    }
    
    
    if([elementName isEqualToString:@"ID"])
    {
        
        recordResults = FALSE;
        typestrg=_soapResults;
        _soapResults = nil;
        
    }
    if([elementName isEqualToString:@"WorkType"])
    {
        
        recordResults = FALSE;
        [_typelistarray addObject:_soapResults];
        [_typelistdict setObject:typestrg forKey:_soapResults];
        [_revtypelistdict setObject:_soapResults forKey:typestrg];
        _soapResults = nil;
        
    }
    if([elementName isEqualToString:@"checkworktype"])
    {
        recordResults = FALSE;
        if([_soapResults integerValue]>0){
            _typebtnlbl.enabled=NO;
            
            
        }
        else{
            planmodel*planmdl=(planmodel *)[_planlistarray objectAtIndex:btnindex];
            if([planmdl.masterplan stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]].length==0)
            {
                _typebtnlbl.enabled=YES;
            }
            else
            {
                _typebtnlbl.enabled=NO;
            }

            
        }
        
                _soapResults = nil;

    }

    if([elementName isEqualToString:@"records"])
    {   recordResults = FALSE;
        [self SelectAllPlans];
          _soapResults = nil;
       
    }

}


-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    if ([alertView.message isEqualToString:@"Are you sure you want to logout"]) {
        
        
        if (buttonIndex==[alertView cancelButtonIndex]){
            [alertView resignFirstResponder];
            [self disablesAutomaticKeyboardDismissal];
            [self Logoutselect];
            
            
        }
        
        else{
            
            
        }
    }
    if ([alertView.message isEqualToString:_result]) {
        _updatebtn.enabled=YES;
        _planselectionbtn.enabled=NO;
        _sitefactortxtfld.text=@"";
        [_leadcheckbtn setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
        [_custcheckbtn setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
        [_planselectionbtn setTitle:@"Select" forState:UIControlStateNormal];
        [_typebtnlbl setTitle:@"Select" forState:UIControlStateNormal];
        _loctntxtfld.text=@"";
        _ziptxtfld.text=@"";
        [_cmplexitybtnlbl setTitle:@"Select" forState:UIControlStateNormal];
        _updatebtn.enabled=YES;
        if(optionidentifier==2)
        {
            _addplanview.hidden=YES;
            _plangtable.userInteractionEnabled=YES;
            _updatebtn.enabled=YES;
        }
        _searchbar.text=@"";
        
    }
    
     if ([alertView.message isEqualToString:@"This lead is already changed as a customer"]) {
         [_planselectionbtn setTitle:@"Select" forState:UIControlStateNormal
          ];     }
    if ([alertView.message isEqualToString:@"Invalid Zip"]) {
        
        
        
        if (buttonIndex==0) {
            
            
            _ziptxtfld.text=@"";
            
        }
    }
    if ([alertView.message isEqualToString:@"Invalid Site Factor"]) {
        
        
        
        if (buttonIndex==0) {
            
            
            _sitefactortxtfld.text=@"";
            
        }
    }
    if ([alertView.message isEqualToString:@"Invalid Location"]) {
        
        
        
        if (buttonIndex==0) {
            
            
            _loctntxtfld.text=@"";
            
        }
    }
    if ([alertView.message isEqualToString:Existplanstrg]) {
        
        
        
        if (buttonIndex==0) {
            
            
           
            
        }
        else{
            
            [self CreateNewPlanFromExisting];
            
        }
    }

   


    
    
}

#pragma mark-textfld delegates
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    
    if(textField==_ziptxtfld)
    {
        NSUInteger newLength = [_ziptxtfld.text length] + [string length] - range.length;
        return (newLength > 10) ? NO : YES;
    }
    if(textField==_sitefactortxtfld)
    {
        NSUInteger newLength = [_sitefactortxtfld.text length] + [string length] - range.length;
        return (newLength > 20) ? NO : YES;
    }
    return YES;

}
- (void)textFieldDidEndEditing:(UITextField *)textField
{
    if(textField==_ziptxtfld)
    {
        Validation*val=[[Validation alloc]init];
        int value1=[val isNumeric:_ziptxtfld.text];
        if(value1==0)
        {
            UIAlertView *alert1=[[UIAlertView alloc]initWithTitle:@"" message:@"Invalid Zip" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert1 show];
            
            
        }
        
    }
    if(textField==_loctntxtfld)
    {
        Validation*val=[[Validation alloc]init];
        int value1=[val validatespecialcharacters:_loctntxtfld.text];
        if(value1==0)
        {
            UIAlertView *alert1=[[UIAlertView alloc]initWithTitle:@"" message:@"Invalid Location" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert1 show];
            
            
        }
        
    }

       if(textField==_sitefactortxtfld)
    {
        Validation*val=[[Validation alloc]init];
        int value1=[val isNumeric:_sitefactortxtfld.text];
        if(value1==0)
        {
            UIAlertView *alert1=[[UIAlertView alloc]initWithTitle:@"" message:@"Invalid Site Factor" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert1 show];
            
            
        }
        
    }

 
}

- (IBAction)wsdisclre:(id)sender {
    poptype=2;
        UIViewController* popoverContent = [[UIViewController alloc]init];
        UIView* popoverView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 132, 43)];
        // popoverView.backgroundColor = [UIColor whiteColor];
        _popovertableview=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, 132, 43)];
        _popovertableview.delegate=(id)self;
        _popovertableview.dataSource=(id)self;
        _popovertableview.rowHeight= 40;
        _popovertableview.separatorStyle=UITableViewCellSeparatorStyleNone;
        //_popovertableview.separatorColor=[UIColor blackColor];
        [popoverView addSubview:_popovertableview];
        popoverContent.view = popoverView;
        popoverContent.preferredContentSize = CGSizeMake(132, 43);
        
        button = (UIButton *)sender;
        UITableViewCell *cell = (UITableViewCell *)[[button superview] superview];
        CGPoint center= button.center;
        CGPoint rootViewPoint = [button.superview convertPoint:center toView:self.plangtable];
        NSIndexPath *textFieldIndexPath = [self.plangtable indexPathForRowAtPoint:rootViewPoint];
        NSLog(@"textFieldIndexPath%d",textFieldIndexPath.row);
        btnindex=textFieldIndexPath.row;
        
        //UITableView *table = (UITableView *)[cell superview];
        self.popovercontroller = [[UIPopoverController alloc]initWithContentViewController:popoverContent];
    self.popovercontroller.popoverContentSize=CGSizeMake(132.0f, 43.0f);
    self.popovercontroller=_popovercontroller;
        [self.popovercontroller presentPopoverFromRect:_wdisbtn.frame inView:cell permittedArrowDirections:UIPopoverArrowDirectionLeft animated:YES];
        
    

}
@end
