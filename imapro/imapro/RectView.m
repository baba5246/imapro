
#import "RectView.h"

@implementation RectView

@synthesize number;

- (id) initWithFrame:(NSRect)frameRect
{
    self = [super initWithFrame:frameRect];
    if (self) {
        
    }
    return self;
}

- (void) drawRect:(NSRect)dirtyRect
{
    NSRect rect = self.bounds;
    [[NSColor redColor] set];
    NSFrameRect(rect);
}

@end
