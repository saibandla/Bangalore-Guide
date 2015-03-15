//
//  ViewController.h
//  GoogleNearBy
//
//  Created by Geniusport on 1/2/15.
//  Copyright (c) 2015 Adeptpros. All rights reserved.
//

#import <UIKit/UIKit.h>
@import CoreLocation;
static NSString *latitude,*longitude;
@interface ViewController : UIViewController<UITextFieldDelegate,UITableViewDataSource,UITableViewDelegate>
{
    IBOutlet UITextField *address;
    IBOutlet UITableView *resultList;
    IBOutlet UITableView *resultList2;
    IBOutlet UITextField *destinationField;
    IBOutlet UIView *view1;
    CLLocationManager *_locationManager;
}
-(IBAction)startSesrch:(id)sender;
- (IBAction)onSearchLocation:(id)sender;
+(void)setLatitude:(NSString *)lat andLongitude:(NSString*)longi;
-(void)getJsonData;
+(id)sharedInsta;
-(void)setDestination:(NSString *)destaddr;
- (void)fetchedData:(NSData *)responseData;
@end
