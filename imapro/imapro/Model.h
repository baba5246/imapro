
#import <Foundation/Foundation.h>

@interface Model : NSObject


@property (readonly) int counter;
@property (nonatomic) NSString *directory;
@property (nonatomic) NSArray *files;
@property (nonatomic) NSURL *imagePath;

+ (Model*)sharedManager;

- (int) countUp;
- (void) setSubPath:(NSString *) subPath;
- (void) setFiles:(NSArray *)filenames;
- (void) setImagePath:(NSURL *)path;


+ (BOOL)automaticallyNotifiesObserversForKey:(NSString *)theKey;

@end
