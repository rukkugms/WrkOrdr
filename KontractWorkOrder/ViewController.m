//
//  ViewController.m
//  KontractWorkOrder
//
//  Created by Riya on 1/23/15.
//  Copyright (c) 2015 GMSIndia1. All rights reserved.
//

#import "ViewController.h"
#import "AFHTTPClient.h"
#import "AFJSONRequestOperation.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _scroll.frame=CGRectMake(0,0,1024, 724);
    _scroll.contentSize=CGSizeMake(1024, 800);
    [[UIApplication sharedApplication]setStatusBarHidden:YES withAnimation:UIStatusBarAnimationNone];
    [self prefersStatusBarHidden];
    [self setNeedsStatusBarAppearanceUpdate];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    [self getIPAddress];
    
    
    /*For UDID*/
    NSString *newid=[[[UIDevice currentDevice]identifierForVendor]UUIDString];
    _logindevice=newid;
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    [defaults setObject:newid forKey:@"UDID"];
    [defaults synchronize];
    [self FindExternalIP];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    _usernametxtfld.text=@"";
    _passwordtxtfld.text=@"";
    _loginbutton.enabled=YES;
    

    
}


#pragma mark- IBAction
- (IBAction)loginbtn:(id)sender {
    if(([_usernametxtfld.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]].length==0)||([_passwordtxtfld.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]].length==0)){
        
        if([_usernametxtfld.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]].length==0){
            UIAlertView*alert=[[UIAlertView alloc]initWithTitle:@"" message:@"Enter Username" delegate:self
                                              cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
        }
        else if([_passwordtxtfld.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]].length==0){
            UIAlertView*alert=[[UIAlertView alloc]initWithTitle:@"" message:@"Enter Password" delegate:self
                                              cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
        }
        
        
    }
    else{
        [self resignFirstResponder];
        [_usernametxtfld resignFirstResponder];
        [_passwordtxtfld resignFirstResponder];
        _loginbutton.enabled=NO;
        [self Loginselect];

        
}
}

#pragma mark-IP Getting Function

-(void)FindExternalIP
{
    NSURL *URL = [NSURL URLWithString:@"http://ip-api.com/json"];
    
    // Start Connection
    AFHTTPClient *httpClient = [[AFHTTPClient alloc] initWithBaseURL:URL];
    
    // Define the JSON header
    [httpClient setDefaultHeader:@"Accept" value:@"text/json"];
    
    // Set the Request
    NSMutableURLRequest *request = [httpClient requestWithMethod:@"GET" path:@"" parameters:nil];
    
    AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
        
        NSString *myIP = [JSON valueForKey:@"query"];
        NSLog(@"IP: %@", myIP);
        
    } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON){
        
        // Failed
        NSLog(@"error: %@", error.description);
        
    }];
    
    // Run the Request
    [operation start];
    
    
    // *******************************
    
    
    // Method 2 - External IP Without Geolocation
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSURL *theURL = [[NSURL alloc] initWithString:@"http://ip-api.com/line/?fields=query"];
        NSString* myIP = [[NSString alloc] initWithData:[NSData dataWithContentsOfURL:theURL] encoding:NSUTF8StringEncoding];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            // Manipulate the ip on the main queue
            NSLog(@"IP: %@",myIP);
            NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
            
            [defaults setObject:myIP forKey:@"Externalip"];
            [defaults synchronize];
            
            
        });
    });

    
    
}

- (NSString *)getIPAddress {
    
    struct ifaddrs *interfaces = NULL;
    struct ifaddrs *temp_addr = NULL;
    NSString *wifiAddress = nil;
    NSString *cellAddress = nil;
    
    // retrieve the current interfaces - returns 0 on success
    if(!getifaddrs(&interfaces)) {
        // Loop through linked list of interfaces
        temp_addr = interfaces;
        while(temp_addr != NULL) {
            sa_family_t sa_type = temp_addr->ifa_addr->sa_family;
            if(sa_type == AF_INET || sa_type == AF_INET6) {
                NSString *name = [NSString stringWithUTF8String:temp_addr->ifa_name];
                NSString *addr = [NSString stringWithUTF8String:inet_ntoa(((struct sockaddr_in *)temp_addr->ifa_addr)->sin_addr)]; // pdp_ip0
                NSLog(@"NAME: \"%@\" addr: %@", name, addr); // see for yourself
                
                if([name isEqualToString:@"en0"]) {
                    // Interface is the wifi connection on the iPhone
                    wifiAddress = addr;
                } else
                    if([name isEqualToString:@"pdp_ip0"]) {
                        // Interface is the cell connection on the iPhone
                        cellAddress = addr;
                    }
            }
            temp_addr = temp_addr->ifa_next;
        }
        // Free memory
        freeifaddrs(interfaces);
    }
    NSString *addr = wifiAddress ? wifiAddress : cellAddress;
    Naddress= wifiAddress ? wifiAddress : cellAddress;
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    [defaults setObject:Naddress forKey:@"Internalip"];
    [defaults synchronize];
    
    
    return addr ? addr : @"0.0.0.0";


}

#pragma mark- WebService
-(void)Loginselect{
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
                   
                   "<Loginselect xmlns=\"http://ios.kontract360.com/\">\n"
                   "<UserName>%@</UserName>\n"
                   "<Password>%@</Password>\n"
                   "<LTime>%@</LTime>\n"
                   "<DeviceNumber>%@</DeviceNumber>\n"
                   "<Location>%@</Location>\n"
                   "<Device>%@</Device>\n"
                   "</Loginselect>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_usernametxtfld.text,_passwordtxtfld.text,curntdate,_logindevice,Naddress,@"Ipad"];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/Loginselect" forHTTPHeaderField:@"Soapaction"];
    
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
    _loginbutton.enabled=YES;
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
    
    
}
#pragma mark-xml parser
-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *) namespaceURI qualifiedName:(NSString *)qName
   attributes: (NSDictionary *)attributeDict{
    if([elementName isEqualToString:@"LoginselectResponse"])
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
    if([elementName isEqualToString:@"logintime"]){
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"device"]){
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"DeviceNumber"]){
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    if([elementName isEqualToString:@"result"]){
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
    if([elementName isEqualToString:@"records"]){
        
        recordResults = FALSE;
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        
        [defaults setObject:_soapResults forKey:@"Userid"];
        [defaults synchronize];
        
        if([_soapResults isEqualToString:@"0"]){
            
            UIAlertView*alert=[[UIAlertView alloc]initWithTitle:@"" message:@"Invalid Username or Password" delegate:self
                                              cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
            _loginbutton.enabled=YES;
        }
        else if([_soapResults isEqualToString:@"-1"]){
            
            NSString*msg=[NSString stringWithFormat:@"You are already login from %@(%@) at %@ ",devicename,devicenumber,logintime];
            UIAlertView*alert=[[UIAlertView alloc]initWithTitle:@"" message:msg delegate:self
                                              cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
            _loginbutton.enabled=YES;
            
        }
        else if([_soapResults isEqualToString:@"-2"]){
            
            
            UIAlertView*alert=[[UIAlertView alloc]initWithTitle:@"" message:@"User is not activated please contact admin" delegate:self
                                              cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
            _loginbutton.enabled=YES;
            
        }
        
        else {
            
            NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
            [defaults setObject:_soapResults forKey:@"UserNameId"];
            [defaults synchronize];
          
            self.hmeVCrl=[[PlngTileViewController alloc]initWithNibName:@"PlngTileViewController" bundle:nil];
          
            _hmeVCrl.username=_usernametxtfld.text;
            
            [self.navigationController pushViewController:_hmeVCrl animated:YES];
            
        }
        _soapResults = nil;
        devicename=@"";
        devicenumber=@"";
        logintime=@"";
        
    }
    
    if([elementName isEqualToString:@"logintime"]){
        recordResults = FALSE;
        NSArray*array=[_soapResults componentsSeparatedByString:@"+"];
        NSArray*array1=[[array objectAtIndex:0]componentsSeparatedByString:@"T"];
        NSLog(@"%@",[array1 objectAtIndex:0]);
        
        NSString *date1 =[array1 objectAtIndex:0];
        NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
        [dateFormat setDateFormat:@"yyyy-MM-dd"];
        NSDate *dates = [dateFormat dateFromString:date1];
        [dateFormat setDateFormat:@"MM-dd-yyy"];
        NSString *myFormattedDate = [dateFormat stringFromDate:dates];
        
        logintime=[NSString stringWithFormat:@"%@ %@",[array1 objectAtIndex:1],myFormattedDate];
        
        _soapResults = nil;
        
    }
    if([elementName isEqualToString:@"device"]){
        recordResults = FALSE;
        devicename=[_soapResults stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
        _soapResults = nil;
        
    }
    if([elementName isEqualToString:@"DeviceNumber"]){
        recordResults = FALSE;
        devicenumber=[_soapResults stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
        _soapResults = nil;
        
    }
    if([elementName isEqualToString:@"result"]){
        recordResults = FALSE;
        
        _usernametxtfld.text=@"";
        _passwordtxtfld.text=@"";
        _soapResults = nil;
        
    }
    
    
}

-(BOOL) textFieldShouldReturn: (UITextField *) textField
{
    [_passwordtxtfld resignFirstResponder];
    
    return YES;
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    if ([alertView.message isEqualToString:@"Invalid Username or Password"]) {
        _usernametxtfld.text=@"";
        _passwordtxtfld.text=@"";
        
    }
    if ([alertView.message isEqualToString:@"User is not activated please contact admin"]) {
        _usernametxtfld.text=@"";
        _passwordtxtfld.text=@"";
        
    }
}



@end
