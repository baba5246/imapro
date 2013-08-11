
#import <Foundation/Foundation.h>

@interface Controller : NSObject
{
    IBOutlet id xlabel;
    IBOutlet id ylabel;
    IBOutlet id wlabel;
    IBOutlet id hlabel;
    IBOutlet id tlabel;
}

-(IBAction)onSaveButtonClicked:(id)sender;

@end
