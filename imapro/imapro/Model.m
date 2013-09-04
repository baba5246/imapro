
#import "Model.h"

@implementation Model

@synthesize directory;
@synthesize files;
@synthesize counter;
@synthesize imagePath;

static Model* sharedModel = nil;

+ (Model*)sharedManager {
    @synchronized(self) {
        if (sharedModel == nil) {
            sharedModel = [[self alloc] init];
        }
    }
    return sharedModel;
}

-(int) countUp
{
    [self willChangeValueForKey:@"counter"];
    counter++; // 必ず変化する
    [self didChangeValueForKey:@"counter"];
    
    return counter;
}

- (void) setSubPath:(NSString *)subPath
{
     directory = subPath;
}

- (void) setFiles:(NSArray *)filenames
{
    files = filenames;
}

- (void) setImagePath:(NSURL *)path
{
    [self willChangeValueForKey:IMAGE_PATH_KEY];
    imagePath = path;
    [self didChangeValueForKey:IMAGE_PATH_KEY];
}

/* 手動で観察するための設定
 * これで戻り値が必ずNOになるようにする
 * でもなくても動くので今は置いとく（ →これないと動かなくなった at 130903
 */
+ (BOOL)automaticallyNotifiesObserversForKey:(NSString *)theKey
{
    BOOL automatic = NO;

    if ([theKey isEqualToString:IMAGE_PATH_KEY]) {
        automatic=NO;
    } else {
        automatic=[super automaticallyNotifiesObserversForKey:theKey];
    }
    return automatic;
}


@end
