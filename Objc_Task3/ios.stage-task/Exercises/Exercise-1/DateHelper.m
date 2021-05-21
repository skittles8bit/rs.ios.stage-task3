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
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    [dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss'Z'"];
    
    return [[NSCalendar currentCalendar] component:NSCalendarUnitDay fromDate:[dateFormatter dateFromString:date]];
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
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *currentDateComp = [calendar components:(NSCalendarUnitWeekOfYear | NSCalendarUnitYear)                                                                  fromDate:[NSDate now]];
    NSDateComponents *dateComp = [calendar components:(NSCalendarUnitWeekOfYear | NSCalendarUnitYear)
                                             fromDate:date];
    
    if (currentDateComp.year == dateComp.year) {
        return currentDateComp.weekOfYear == dateComp.weekOfYear;
    }
    
    return NO;
}

@end
