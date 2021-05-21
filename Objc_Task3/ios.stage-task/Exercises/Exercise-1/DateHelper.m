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
    NSArray *parsedArray = [date componentsSeparatedByString:@"-"];
    NSString *numberString = [parsedArray lastObject];
    NSString *number = [numberString substringWithRange:NSMakeRange(0, 2)];
    
    return [number longLongValue];
}

#pragma mark - Third

- (NSString *)getDayName:(NSDate*) date {
    NSCalendar* cal = [NSCalendar currentCalendar];
    NSDateComponents* comp = [cal components:NSCalendarUnitWeekday fromDate: date];
    
    switch ([comp weekday]) {
        case 1:
            return @"Вс";
        case 2:
            return @"Пн";
        case 3:
            return @"Вт";
        case 4:
            return @"Ср";
        case 5:
            return @"Чт";
        case 6:
            return @"Пт";
        case 7:
            return @"Сб";
        default:
            return nil;
    }
}

#pragma mark - Fourth

- (BOOL)isDateInThisWeek:(NSDate *)date {
    return NO;
}

@end
