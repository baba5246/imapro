
#import "Model.h"

@implementation Model

@synthesize counter;

- (id) init
{
    self = [super init];
    if (self) {
        
    }
    
    return self;
}

+ (BOOL)automaticallyNotifiesObserversForKey:(NSString *)theKey {
    BOOL automatic = NO;
    
    if ([theKey isEqualToString:@"counter"]) {
        automatic=NO;
    } else {
        automatic=[super automaticallyNotifiesObserversForKey:theKey];
    }
    return automatic;
}

-(int) countUp
{
    [self willChangeValueForKey:@"counter"];
    counter++; // 必ず変化する
    [self didChangeValueForKey:@"counter"];
    
    return counter;
}

@end
