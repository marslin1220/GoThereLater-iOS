//
//  LocationDetailsViewController.m
//  GoThereLater
//
//  Created by 林 政龍 on 13/1/10.
//  Copyright (c) 2013年 marstudio. All rights reserved.
//

#import "LocationDetailsViewController.h"
#import "Location.h"

@interface LocationDetailsViewController ()

@end

@implementation LocationDetailsViewController

- (IBAction)cancel:(id)sender
{
    [self.delegate locationDetailsViewControllerDidCancel:self];
}

- (IBAction)done:(id)sender
{
    Location *newLocation = [Location new];
    newLocation.title = self.titleTextField.text;
    newLocation.location = self.locationTextField.text;
    newLocation.description = self.descriptionTextField.text;
    
    [self.delegate addLocation:newLocation];
}

- (BOOL) textFieldShouldReturn: (UITextField *)textField {
    [textField resignFirstResponder];
    
    return YES;
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

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        [self.titleTextField becomeFirstResponder];
    } else if (indexPath.section == 1) {
        [self.locationTextField becomeFirstResponder];
    } else if (indexPath.section == 2) {
        [self.descriptionTextField becomeFirstResponder];
    }
}


@end
