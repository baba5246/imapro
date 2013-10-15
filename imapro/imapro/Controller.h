
#import <Foundation/Foundation.h>
#import "ImgView.h"

@class Model;

@interface Controller : NSObject
{
    Model *model;
    
    IBOutlet id rlabel;
    IBOutlet id tlabel;
    IBOutlet id flabel;
    IBOutlet NSComboBox *options;
}

@property (nonatomic, retain) IBOutlet ImgView *imgView;

-(IBAction)onLeftButtonClicked:(id)sender;
-(IBAction)onRightButtonClicked:(id)sender;
-(IBAction)onDoneButtonClicked:(id)sender;

-(void)observeValueForKeyPath:(NSString *)keyPath
                     ofObject:(id)object
                       change:(NSDictionary *)change
                      context:(void *)context;


@end
