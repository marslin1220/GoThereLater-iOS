//
//  LocationDetailsViewController.h
//  GoThereLater
//
//  Created by 林 政龍 on 13/1/10.
//  Copyright (c) 2013年 marstudio. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Location.h"

@class LocationDetailsViewController;

@protocol LocationDetailsViewControllerDelegate <NSObject>
- (void)locationDetailsViewControllerDidCancel:(LocationDetailsViewController *)controller;
- (void)locationDetailsViewControllerDidSave:(LocationDetailsViewController *)controller;
- (void)addLocation:(Location *) newLocation;
@end

@interface LocationDetailsViewController : UITableViewController

@property (nonatomic, weak) id <LocationDetailsViewControllerDelegate> delegate;

- (IBAction)cancel:(id)sender;
- (IBAction)done:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *titleTextField;
@property (weak, nonatomic) IBOutlet UITextField *locationTextField;
@property (weak, nonatomic) IBOutlet UITextField *descriptionTextField;

@end
