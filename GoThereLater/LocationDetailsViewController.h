//
//  LocationDetailsViewController.h
//  GoThereLater
//
//  Created by 林 政龍 on 13/1/10.
//  Copyright (c) 2013年 marstudio. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Location.h"

@interface LocationDetailsViewController : UITableViewController

@property (weak, nonatomic) IBOutlet UITextField *titleTextField;
@property (weak, nonatomic) IBOutlet UITextField *locationTextField;
@property (weak, nonatomic) IBOutlet UITextField *commentTextField;

@property (strong, nonatomic) Location* selectedLocation;

@end
