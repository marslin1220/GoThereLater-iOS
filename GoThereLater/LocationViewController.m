//
//  LocationViewController.m
//  GoThereLater
//
//  Created by 林 政龍 on 13/1/8.
//  Copyright (c) 2013年 marstudio. All rights reserved.
//

#import "LocationViewController.h"
#import "LocationAdderViewController.h"
#import "Location.h"

@interface LocationViewController ()

@end

@implementation LocationViewController


- (void)locationAdderViewControllerDidCancel:(LocationAdderViewController *)controller
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)addLocation:(Location *)newLocation
{
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
    }
}

- (NSMutableArray *)locations
{
    if (!_locations) {
        _locations = [NSMutableArray arrayWithCapacity:10];
        
        Location *location1 = [[Location alloc] init];
        location1.title = @"This is the first title.";
        location1.location = @"This is the first location.";
        [_locations addObject:location1];
        
        Location *location2 = [[Location alloc] init];
        location2.title = @"This is the second title.";
        location2.location = @"This is the second location.";
        [_locations addObject:location2];
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

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

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
    /*
    LocationDetailsViewController* locationDetailViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"DetailViewController"];
    
    NSLog(@"%@%@", @"Title: ", [[self.locations objectAtIndex:indexPath.row] title]);
    
    locationDetailViewController.titleTextField.text = [[self.locations objectAtIndex:indexPath.row] title];
    
    locationDetailViewController.locationTextField.text = [[self.locations objectAtIndex:indexPath.row] location];
    
    locationDetailViewController.descriptionTextField.text = [[self.locations objectAtIndex:indexPath.row] description];
    
    [locationDetailViewController refreshControl];
    
    [self.navigationController pushViewController:locationDetailViewController animated:YES];
     */
}

@end
