
#import "InputView.h"

@implementation InputView

- (id)initWithOrigin:(NSPoint)origin
{
    self = [super initWithFrame:NSMakeRect(0, 0, 120, 20)];
    if (self) {
        [self setFrameOrigin:origin];
    }
    
    return self;
}

- (void)keyUp:(NSEvent *)theEvent
{
    if ([theEvent]) {
        
    }
}

@end
