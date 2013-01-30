//
//  LocationAdderViewController.h
//  GoThereLater
//
//  Created by 林 政龍 on 13/1/29.
//  Copyright (c) 2013年 marstudio. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Location.h"

@class LocationAdderViewController;

@protocol LocationAdderViewControllerDelegate <NSObject>
- (void)locationAdderViewControllerDidCancel:(LocationAdderViewController *)controller;
- (void)addLocation:(Location *) newLocation;
@end

@interface LocationAdderViewController : UITableViewController

@property (nonatomic, weak) id <LocationAdderViewControllerDelegate> delegate;

- (IBAction)cancel:(id)sender;
- (IBAction)done:(id)sender;

@property (weak, nonatomic) IBOutlet UITextField *titleTextField;
@property (weak, nonatomic) IBOutlet UITextField *locationTextField;
@property (weak, nonatomic) IBOutlet UITextField *descTextField;

@end
