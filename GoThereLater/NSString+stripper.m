//
//  NSString+stripper.m
//  GoThereLater
//
//  Created by 林 政龍 on 13/3/27.
//  Copyright (c) 2013年 marstudio. All rights reserved.
//

#import "NSString+stripper.h"

@implementation NSString (stripper)

-(NSString *) stringByStrippingHTML {
    NSRange r;
    NSString *s = [self copy];//[[self copy] autorelease];
    while ((r = [s rangeOfString:@"<[^>]+>" options:NSRegularExpressionSearch]).location != NSNotFound)
        s = [s stringByReplacingCharactersInRange:r withString:@""];
    return s;
}

-(NSString *) stringByStrippingScript {
    NSRange r;
    NSString *s = [self copy];//[[self copy] autorelease];
    while ((r = [s rangeOfString:@"<script.*>.*</script>" options:NSRegularExpressionSearch]).location != NSNotFound)
        s = [s stringByReplacingCharactersInRange:r withString:@""];
    return s;
}

@end
