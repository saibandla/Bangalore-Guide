//
//  MapLocator.m
//  GoogleNearBy
//
//  Created by Sesha Sai Bhargav Bandla on 04/01/15.
//  Copyright (c) 2015 Adeptpros. All rights reserved.
//

#import "MapLocator.h"
#import "MyLocaion.h"
#import "ViewController.h"
#import "AppDelegate.h"
#import "Favourites.h"
@interface MapLocator ()

@end

@implementation MapLocator
@synthesize coordinates;
AppDelegate *appDelegate;
-(id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil LocationName:(NSString *)Locname LocationAddress:(NSString *)addr Coordinates:(CLLocationCoordinate2D )coords image:(UIImage *)image1  isThereInFav:(BOOL) isInfavourites
{
    self=[super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if(self!=nil)
    {
        name=Locname;
        address=addr;
        image=image1;
        [self.navigationItem setTitle :@"Map View"];
        coordinates=coords;
        favFlag=isInfavourites;
    }
    return  self;
}
-(CLLocationCoordinate2D )getCords
{
    return coordinates;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.mapView setDelegate:self];
    for (id<MKAnnotation> annotation in _mapView.annotations) {
        [_mapView removeAnnotation:annotation];
    }
    appDelegate=(AppDelegate *)[[UIApplication sharedApplication]delegate];
    UIBarButtonItem *addTofav;
    if(!favFlag)
    addTofav=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"Like-50.png"] style:UIBarButtonItemStylePlain target:self action:@selector(addTofavourites)];
    else
         addTofav=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"Like-51.png"] style:UIBarButtonItemStylePlain target:self action:@selector(removeFromfav)];
    UIBarButtonItem *searchBus=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"mode_transit_icon.png"] style:UIBarButtonItemStylePlain target:self action:@selector(searchBus)];
    self.navigationItem.rightBarButtonItems=@[addTofav, searchBus];
    MKCoordinateRegion region = { { 0.0, 0.0 }, { 0.0, 0.0 } };
    region.center.latitude = coordinates.latitude;
    region.center.longitude = coordinates.longitude;
    region.span.longitudeDelta = 0.005f;
    region.span.longitudeDelta = 0.005f;
   
    MyLocation *annotation = [[MyLocation alloc] initWithName:name address:address coordinate:coordinates] ;
    [self.mapView setRegion:region animated:YES];
    [_mapView addAnnotation:annotation];

    // Do any additional setup after loading the view from its nib.
}
-(void)addTofavourites
{
  Favourites *favManagedOject= (Favourites *) [NSEntityDescription insertNewObjectForEntityForName:@"Favourites" inManagedObjectContext:appDelegate.managedObjectContext];
    favManagedOject.title=name;
    favManagedOject.address=address;
    favManagedOject.latitude=[NSString stringWithFormat:@"%lf",coordinates.latitude];
    favManagedOject.longitude=[NSString stringWithFormat:@"%lf",coordinates.longitude];
    favManagedOject.image=UIImagePNGRepresentation(image);
    [appDelegate saveContext];
}
-(void) removeFromfav
{
    
}
-(void)searchBus
{UINavigationController *searchNav=(UINavigationController *) self.tabBarController.viewControllers[0];
           [searchNav popToRootViewControllerAnimated:YES];
    [ (ViewController *) searchNav.topViewController setDestination:address];
    [self.tabBarController setSelectedIndex:0];
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

@end
