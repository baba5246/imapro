
#import <Foundation/Foundation.h>

@class Model;

@interface Controller : NSObject
{
    Model *model;
    
    IBOutlet id rlabel;
    IBOutlet id tlabel;
    IBOutlet id flabel;
}

@property (nonatomic, strong) IBOutlet NSImageView *imgView;

-(IBAction)onSaveButtonClicked:(id)sender;
-(IBAction)onLeftButtonClicked:(id)sender;
-(IBAction)onRightButtonClicked:(id)sender;

-(void)observeValueForKeyPath:(NSString *)keyPath
                     ofObject:(id)object
                       change:(NSDictionary *)change
                      context:(void *)context;


@end
