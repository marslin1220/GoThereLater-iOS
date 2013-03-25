//
//  LocationViewController.m
//  GoThereLater
//
//  Created by 林 政龍 on 13/1/8.
//  Copyright (c) 2013年 marstudio. All rights reserved.
//

#import "LocationViewController.h"
#import "LocationAdderViewController.h"
#import "LocationDetailsViewController.h"
#import "Location.h"
#import "LocationEntity.h"

@interface LocationViewController ()


@end

@implementation LocationViewController

- (void) loadData
{
    // 如果有資料，先清空
    [self.locations removeAllObjects];
    
    NSFetchRequest* request = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"LocationEntity" inManagedObjectContext:[appDelegate managedObjectContext]];
    [request setEntity:entity];
    NSError* error = nil;
    NSMutableArray* returnObjs = [[[appDelegate managedObjectContext] executeFetchRequest:request error:&error] mutableCopy];
    // [request release];
    
    // 將資料倒入表格的資料來源之中
    for (Location* currentLocation in returnObjs) {
        [self.locations addObject:currentLocation];
    }
    
    // [returnObjs release];
    // 將表格的資料重新載入
    [self.tableView reloadData];
}

-(void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self loadData];
}

- (void)locationAdderViewControllerDidCancel:(LocationAdderViewController *)controller
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)addLocation:(Location *)newLocation
{
    NSLog(@"Add database managed object.");
    
    LocationEntity *locationEntity = (LocationEntity *) [NSEntityDescription insertNewObjectForEntityForName:@"LocationEntity" inManagedObjectContext:[appDelegate managedObjectContext]];
    
    locationEntity.title = newLocation.title;
    locationEntity.comment = newLocation.comment;
    locationEntity.location = newLocation.location;
    
    NSError *error = nil;
    if (![appDelegate.managedObjectContext save:&error]) {
        NSLog(@"Got an error when adding location entity.");
    }
    
    [self.locations addObject:newLocation];
    
    NSIndexPath *indexPath =
    [NSIndexPath indexPathForRow:[self.locations count] - 1 inSection:0];
    
	[self.tableView insertRowsAtIndexPaths:
     [NSArray arrayWithObject:indexPath]
                          withRowAnimation:UITableViewRowAnimationAutomatic];
    
	[self dismissViewControllerAnimated:YES completion:nil];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"AddLocation"]) {
        LocationAdderViewController *locationAdderViewController = segue.destinationViewController;
        locationAdderViewController.delegate = self;
    } else if ([segue.identifier isEqualToString:@"ShowDetail"]) {
        LocationDetailsViewController *locationDetailViewController = segue.destinationViewController;
        locationDetailViewController.selectedLocation = [self.locations objectAtIndex:self.tableView.indexPathForSelectedRow.row];
    }
}

- (NSMutableArray *)locations
{
    if (!_locations) {
        _locations = [NSMutableArray arrayWithCapacity:10];
        /*
        Location *location1 = [[Location alloc] init];
        location1.title = @"This is the first title.";
        location1.location = @"This is the first location.";
        [_locations addObject:location1];
        
        Location *location2 = [[Location alloc] init];
        location2.title = @"This is the second title.";
        location2.location = @"This is the second location.";
        [_locations addObject:location2];
         */
    }
    
    return _locations;
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    appDelegate = (AppDelegate *) [[UIApplication sharedApplication] delegate];

    UIPasteboard *pboard = [UIPasteboard generalPasteboard];
    NSString *string = pboard.string;
    NSLog(@"You copied string: %@", string);
    NSURL* url = [NSURL URLWithString:string];
    if (url == nil) {
        NSLog(@"Nope %@ is not a proper URL", string);
    } else {
        NSLog(@"You copied URL: %@", url);
    }
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.locations.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"LocationCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    Location *location = [self.locations objectAtIndex:indexPath.row];
    cell.textLabel.text = location.title;
    cell.detailTextLabel.text = location.location;
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        // Get the deleted object
        LocationEntity* locationToDelete = [self.locations objectAtIndex:indexPath.row];

        // Delete from managedObjectContext
        [[appDelegate managedObjectContext] deleteObject:locationToDelete];

        NSError* error = nil;
        if (![[appDelegate managedObjectContext] save:&error]) {
            NSLog(@"Fail to delete object");
        } else {
            // Remove from locations
            [self.locations removeObjectAtIndex:indexPath.row];
        }

        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
}

@end
