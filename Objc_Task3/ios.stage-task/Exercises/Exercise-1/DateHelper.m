#import "DateHelper.h"

@implementation DateHelper

#pragma mark - First

-(NSString *)monthNameBy:(NSUInteger)monthNumber {
    id objects[] = { @"January",
                     @"February",
                     @"March",
                     @"April",
                     @"May",
                     @"June",
                     @"July",
                     @"August",
                     @"September",
                     @"October",
                     @"November",
                     @"December"
    };
    id keys[] = { @1, @2, @3, @4 , @5, @6, @7, @8, @9, @10, @11, @12 };
    
    NSUInteger count = sizeof(objects) / sizeof(id);
    
    NSDictionary *months = [NSDictionary dictionaryWithObjects:objects
                                                       forKeys:keys
                                                         count:count];
    
    return [months objectForKey:[NSNumber numberWithInteger:monthNumber]];
}

#pragma mark - Second

- (long)dayFromDate:(NSString *)date {
    return 0;
}

#pragma mark - Third

- (NSString *)getDayName:(NSDate*) date {
    return nil;
}

#pragma mark - Fourth

- (BOOL)isDateInThisWeek:(NSDate *)date {
    return NO;
}

@end
