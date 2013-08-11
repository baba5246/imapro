
#import <Foundation/Foundation.h>

@class Model;

@interface Controller : NSObject
{
    Model *model;
    
    IBOutlet id xlabel;
    IBOutlet id ylabel;
    IBOutlet id wlabel;
    IBOutlet id hlabel;
    IBOutlet id tlabel;
}

-(IBAction)onSaveButtonClicked:(id)sender;
-(void)observeValueForKeyPath:(NSString *)keyPath
                     ofObject:(id)object
                       change:(NSDictionary *)change
                      context:(void *)context;
@end
