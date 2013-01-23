//
//  LocationViewController.h
//  GoThereLater
//
//  Created by 林 政龍 on 13/1/8.
//  Copyright (c) 2013年 marstudio. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LocationDetailsViewController.h"

@interface LocationViewController : UITableViewController <LocationDetailsViewControllerDelegate>

@property (nonatomic, strong) NSMutableArray *locations;

@end
