
#import "RectView.h"

@implementation RectView

@synthesize text, number, truth;

- (id) initWithFrame:(NSRect)frameRect rectNum:(NSInteger)rectNum
{
    self = [super initWithFrame:frameRect];
    if (self) {
        number = rectNum;
        truth = [[Truth alloc] init];
    }
    return self;
}

- (void) drawRect:(NSRect)dirtyRect
{
    NSRect rect = self.bounds;
    [[NSColor redColor] set];
    NSFrameRect(rect);
}

- (void) saveTruth
{
    Model *model = [Model sharedManager];
    truth.rect = self.frame;
    truth.text = model.filename;
    [model addTruth:truth];
}

@end
