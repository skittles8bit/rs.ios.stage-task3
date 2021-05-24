#import "LexicographicallyMinimal.h"

@interface LexicographicallyMinimal()

@property (nonatomic, strong) NSMutableString *resultString;

@end

@implementation LexicographicallyMinimal

-(NSString *)findLexicographicallyMinimalForString1:(NSString *)string1 andString2:(NSString *)string2 {
    NSMutableString *result = [NSMutableString new];
    NSString *lineFirst = [NSString new];
    NSString *lineSecond = [NSString new];
    int stringFirstCount = 0;
    int stringSecondCount = 0;
    
    while ((stringFirstCount < string1.length) && (stringSecondCount < string2.length)) {
        lineFirst = [string1 substringWithRange:NSMakeRange(stringFirstCount, 1)];
        lineSecond = [string2 substringWithRange:NSMakeRange(stringSecondCount, 1)];
        
        if ([lineFirst UTF8String][0] <= [lineSecond UTF8String][0]) {
            [result appendString:lineFirst];
            stringFirstCount++;
        } else {
            [result appendString:lineSecond];
            stringSecondCount++;
        }
    }
    
    stringFirstCount == string1.length
        ? [result appendString:[string2 substringFromIndex:stringSecondCount]]
        : [result appendString:[string1 substringFromIndex:stringFirstCount]];
    
    return result;
}

@end
