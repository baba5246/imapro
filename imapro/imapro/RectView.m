
#import "RectView.h"

@implementation RectView

@synthesize number, truth, color;

- (id) initWithFrame:(NSRect)frameRect rectNum:(NSInteger)rectNum
{
    self = [super initWithFrame:frameRect];
    if (self) {
        number = rectNum;
        truth = [[Truth alloc] init];
        color = [NSColor redColor];
    }
    return self;
}

- (void) drawRect:(NSRect)dirtyRect
{
    NSRect rect = self.bounds;
    [color set];
    NSFrameRect(rect);
}

- (void) saveTruth
{
    Model *model = [Model sharedManager];
    truth.rect = self.frame;
    [model addTruth:truth];
}

@end
