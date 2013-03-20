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

    self.titleTextField.text = self.selectedLocation.title;
    self.locationTextField.text = self.selectedLocation.location;
    self.commentTextField.text = self.selectedLocation.comment;

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

@end
