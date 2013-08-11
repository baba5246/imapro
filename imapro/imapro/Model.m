
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


-(int) countUp
{
    [self willChangeValueForKey:@"counter"];
    counter++; // 必ず変化する
    [self didChangeValueForKey:@"counter"];
    
    return counter;
}


/* 手動で観察するための設定
 * これで戻り値が必ずNOになるようにする
 * でもなくても動くので今は置いとく
 + (BOOL)automaticallyNotifiesObserversForKey:(NSString *)theKey {
 BOOL automatic = NO;
 
 if ([theKey isEqualToString:@"counter"]) {
 automatic=NO;
 } else {
 automatic=[super automaticallyNotifiesObserversForKey:theKey];
 }
 return automatic;
 }
 */

@end
