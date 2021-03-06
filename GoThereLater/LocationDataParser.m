//
//  LocationDataParser.m
//  GoThereLater
//
//  Created by 林 政龍 on 13/3/26.
//  Copyright (c) 2013年 marstudio. All rights reserved.
//

#import "LocationDataParser.h"
#import "NSString+stripper.h"

@implementation LocationDataParser

+ (Location *) getLocationDataFromUrl:(NSURL *)url
{
    Location *locationData = [[Location alloc] init];
    NSError *error = nil;

    // Get response by URL
    NSString *responseContent = [NSString stringWithContentsOfURL:url encoding:NSUTF8StringEncoding error:&error];
    //NSLog(@"Response Content: %@", responseContent);

    if (nil == responseContent) return nil;

    // Remove single script
    responseContent = [responseContent stringByStrippingScript];
    
    // Fetch the title
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"<title>.*</title>"
                                                                           options:NSRegularExpressionCaseInsensitive
                                                                             error:&error];
    NSArray *regMatches = [regex matchesInString:responseContent
                                         options:0
                                           range:NSMakeRange(0, [responseContent length])];
    
    for (NSTextCheckingResult *match in regMatches) {
        NSLog(@"Found reg number: %@", [[responseContent substringWithRange:[match range]] stringByStrippingHTML]);
        locationData.title = [[responseContent substringWithRange:[match range]] stringByStrippingHTML];
    }
    
    // Remove all the HTML tags
    responseContent = [responseContent stringByStrippingHTML];

    // Fetch phone number and address
    // Create detectors
    NSDataDetector *detector = [NSDataDetector dataDetectorWithTypes:NSTextCheckingTypePhoneNumber|NSTextCheckingTypeAddress
                                                               error:nil];

    //NSLog(@"reponseContent length: %d", [responseContent length]);
    NSArray *matches = [detector matchesInString:responseContent
                                         options:0
                                           range:NSMakeRange(0, [responseContent length])];

    for (NSTextCheckingResult *match in matches) {
        if ([match resultType] == NSTextCheckingTypePhoneNumber) {
            NSLog(@"Found phone number: %@", [match phoneNumber]);
        } else if ([match resultType] == NSTextCheckingTypeAddress) {
            NSLog(@"Found address: %@%@%@", [[match addressComponents] objectForKey:@"State"],
                  [[match addressComponents] objectForKey:@"City"],
                  [[match addressComponents] objectForKey:@"Street"]);

            locationData.location = [[[[match addressComponents] objectForKey:@"State"] stringByAppendingString:[[match addressComponents] objectForKey:@"City"]] stringByAppendingString:[[match addressComponents] objectForKey:@"Street"]];
        }
    }

    return locationData;
}

@end