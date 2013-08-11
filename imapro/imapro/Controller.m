

#import "Controller.h"
#import "Model.h"

@implementation Controller

-(id) init
{
    self = [super init];
    if (self) {
        model = [[Model alloc] init];
        [model addObserver:self forKeyPath:@"counter" options:(NSKeyValueObservingOptionNew) context:nil];
    }
    return self;
}

- (IBAction)onSaveButtonClicked:(id)sender
{
    [model countUp];
}

- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary *)change
                       context:(void *)context
{
    if ([keyPath isEqual:@"counter"]) {
        int data = [model counter];
        
        [xlabel setIntValue:data];
        [ylabel setIntValue:data+data];
        [wlabel setIntValue:data*data];
        [hlabel setIntValue:pow(data, data)];  // Viewを更新
    }
}

@end
