//
//  LocationDataParser.h
//  GoThereLater
//
//  Created by 林 政龍 on 13/3/26.
//  Copyright (c) 2013年 marstudio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Location.h"

@interface LocationDataParser : NSObject

+ (Location *) getLocationDataFromUrl:(NSURL *)url;

@end
