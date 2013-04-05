//
//  NSString+stripper.h
//  GoThereLater
//
//  Created by 林 政龍 on 13/3/27.
//  Copyright (c) 2013年 marstudio. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (stripper)

- (NSString *) stringByStrippingHTML;
- (NSString *) stringByStrippingScript;

@end
