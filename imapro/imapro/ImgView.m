
#import "ImgView.h"
#import "RectView.h"

@implementation ImgView
{
    Model *model;
    NSPoint start, previous, moving, end;
    
    RectView *rectView;
}

@synthesize rectNum;

- (void)prepare
{
    model = [Model sharedManager];
    
    [model addObserver:self forKeyPath:RECTANGLES_KEY
               options:(NSKeyValueObservingOptionNew|NSKeyValueObservingOptionPrior)
               context:nil];
    
    start = NSMakePoint(-1, -1);
}

- (void)drawRect:(NSRect)dirtyRect
{
    [[NSColor clearColor] setFill];
    NSRectFill(dirtyRect);
    [super drawRect:dirtyRect];
}

- (void)mouseDown:(NSEvent *)theEvent
{
    
    if (model.imagePath.path.length>0) {
        start = [self convertPoint:[theEvent locationInWindow] fromView:[[self window] contentView]];
    } else {
        return;
    }
    
    rectNum++;
    NSRect rect = NSMakeRect(start.x, start.y, start.x-start.x, start.y-start.y);
    rectView = [[RectView alloc] initWithFrame:rect rectNum:rectNum];
    [self addSubview:rectView];
}

-(void)mouseDragged:(NSEvent *)theEvent
{
    if (start.x < 0 && start.y < 0) return;
    
    moving = [self convertPoint:[theEvent locationInWindow] fromView:[[self window] contentView]];
    
    float ox, oy;

    if (start.x > moving.x) ox = moving.x;
    else ox = start.x;
    
    if (start.y > moving.y) oy = moving.y;
    else oy = start.y;
    
    [rectView setFrame:NSMakeRect(ox, oy, fabs(start.x-moving.x), fabs(start.y-moving.y))];
    [rectView setNeedsDisplay:YES];

}

- (void)mouseUp:(NSEvent *)theEvent
{
    if (start.x < 0 && start.y < 0) return;
    
    end = [self convertPoint:[theEvent locationInWindow] fromView:[[self window] contentView]];
    
    [rectView saveTruth];
}


- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary *)change
                       context:(void *)context
{
    if ([keyPath isEqual:RECTANGLES_KEY])
    {
        [self resetRectangles];
    }
    else if ([keyPath isEqual:@""])
    {
        
    }
    
}

- (void) resetRectangles
{
    NSArray *subviews = self.subviews.copy;
    for (RectView *view in subviews) {
        [view removeFromSuperview];
    }
}

@end
