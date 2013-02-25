//
//  LocationEntity.h
//  GoThereLater
//
//  Created by 林 政龍 on 13/2/20.
//  Copyright (c) 2013年 marstudio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface LocationEntity : NSManagedObject

@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSString * location;
@property (nonatomic, retain) NSString * desc;

@end
