
#import <Cocoa/Cocoa.h>

@interface ImgView : NSImageView

@property (nonatomic, assign) NSInteger rectNum;

- (void)prepare;

- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary *)change
                       context:(void *)context;
@end
