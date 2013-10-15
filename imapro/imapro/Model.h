
#import <Foundation/Foundation.h>

@interface Model : NSObject


@property (readonly) int counter;
@property (nonatomic) NSString *directory;
@property (nonatomic) NSArray *files;
@property (nonatomic) NSURL *imagePath;

+ (Model*)sharedManager;

- (void) setSubPath:(NSString *) subPath;
- (void) setFiles:(NSArray *)filenames;
- (void) setImagePath:(NSURL *)path;

- (void) addRectangle:(RectView *)rectView;
- (void) resetRectangles;
- (BOOL) saveRectangles;

+ (BOOL)automaticallyNotifiesObserversForKey:(NSString *)theKey;

@end
