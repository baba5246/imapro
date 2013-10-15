
#import "Model.h"

@implementation Model
{
    NSMutableArray *rectangles;
    NSMutableArray *xmlComponents;
}

@synthesize directory;
@synthesize files;
@synthesize counter;
@synthesize imagePath;

static Model* sharedModel = nil;

+ (Model*)sharedManager {
    @synchronized(self) {
        if (sharedModel == nil) {
            sharedModel = [[self alloc] init];
            [sharedModel prepare];
        }
    }
    return sharedModel;
}

- (void) prepare
{
    rectangles = [[NSMutableArray alloc] init];
    xmlComponents = [[NSMutableArray alloc] init];
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

- (void) addRectangle:(RectView *)rectView
{
    [rectangles addObject:rectView];
}

- (void) resetRectangles
{
    [self willChangeValueForKey:DELETE_RECTANGLES_KEY];
    [rectangles removeAllObjects];
    [self didChangeValueForKey:DELETE_RECTANGLES_KEY];
}

- (BOOL) saveRectangles
{
    if (rectangles.count > 0) {
        NSArray *rects = [[NSArray alloc] initWithArray:rectangles];
        [xmlComponents addObject:rects];
        [self resetRectangles];
        return YES;
    } else {
        return NO;
    }
}


/* 手動で観察するための設定
 * これで戻り値が必ずNOになるようにする
 * でもなくても動くので今は置いとく（ →これないと動かなくなった at 130903
 */
+ (BOOL)automaticallyNotifiesObserversForKey:(NSString *)theKey
{
    BOOL automatic = NO;

    if ([theKey isEqualToString:IMAGE_PATH_KEY] ||
        [theKey isEqualToString:DELETE_RECTANGLES_KEY])
    {
        automatic=NO;
    }
    else
    {
        automatic=[super automaticallyNotifiesObserversForKey:theKey];
    }
    return automatic;
}


@end
