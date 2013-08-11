

#import "Controller.h"

@implementation Controller

-(id) init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void) dealloc
{
    
}

- (IBAction)onSaveButtonClicked:(id)sender
{
    [xlabel setIntValue:1];
    [ylabel setIntValue:1];
    [wlabel setIntValue:1];
    [hlabel setIntValue:1];
    [tlabel setIntValue:1];
}

@end
