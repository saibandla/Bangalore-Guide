//
//  FavTableViewController.m
//  BangaloreGuide
//
//  Created by Sesha Sai Bhargav Bandla on 15/03/15.
//  Copyright (c) 2015 nivansys. All rights reserved.
//

#import "FavTableViewController.h"
#import "AppDelegate.h"
#import "customCell.h"
#import "Favourites.h"
@interface FavTableViewController ()

@end

@implementation FavTableViewController
    AppDelegate *appDelegate;
NSArray *favData;
- (void)viewDidLoad {
    [super viewDidLoad];
    appDelegate=(AppDelegate *)[[UIApplication sharedApplication] delegate];
    NSEntityDescription *entityDesc=[NSEntityDescription entityForName:@"" inManagedObjectContext:appDelegate.managedObjectContext] ;
    NSFetchRequest *fetchRequest=[[NSFetchRequest alloc]init];
    [fetchRequest setEntity:entityDesc];
    NSError *error;
    favData=[appDelegate.managedObjectContext executeFetchRequest:fetchRequest error:&error];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return favData.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"nearestAttractionsCell";
    Favourites *fav=[favData objectAtIndex:indexPath.row];
    customCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    //    if (cell == nil) {
    NSArray *toplevelObject=[[NSBundle mainBundle]loadNibNamed:@"customCell" owner:self options:nil];
    for(id currentObj in toplevelObject)
    {
        if([currentObj isKindOfClass:[UITableViewCell class]]&&[[currentObj reuseIdentifier] isEqualToString:cellIdentifier])
        {
            
            cell=(customCell *)currentObj;
        }
    }
    NSData *imgdata=fav.image;
    [cell.imgV clipsToBounds];
    [cell.imgV setImage:[UIImage imageWithData:imgdata ]];
    cell.lbl1.text=fav.title;
    [cell.lbl1 setFont:[UIFont systemFontOfSize:15]];
    cell.lbl2.text=fav.address;
    [cell.lbl2 setFont:[UIFont systemFontOfSize:14]];

    // Configure the cell...
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
