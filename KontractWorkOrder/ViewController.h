//
//  ViewController.h
//  KontractWorkOrder
//
//  Created by Riya on 1/23/15.
//  Copyright (c) 2015 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeViewController.h"

@interface ViewController : UIViewController
{
    BOOL recordResults;
}
@property(strong,nonatomic)HomeViewController *hmeVCrl;


/* xmlparser*/
@property(strong,nonatomic)NSXMLParser *xmlParser;
@property(strong,nonatomic)NSMutableString *soapResults;
@property(strong,nonatomic)NSMutableData *webData;


/*IBOutlets*/
@property(strong,nonatomic)IBOutlet UITextField *usernametxtfld;
@property(strong,nonatomic)IBOutlet UITextField *passwordtxtfld;
@property(strong,nonatomic)IBOutlet UIButton *loginbutton;

- (IBAction)loginbtn:(id)sender;


@end
