
#import <Foundation/Foundation.h>

@interface Model : NSObject


@property(readonly)int counter;

+ (BOOL)automaticallyNotifiesObserversForKey:(NSString *)theKey;
- (int)countUp;

@end
