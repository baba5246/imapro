
#import <Foundation/Foundation.h>
#import "ImgView.h"

@class Model;

@interface Controller : NSObject
{
    Model *model;
    
    IBOutlet id flabel;
    IBOutlet NSComboBox *options;
}

@property (nonatomic, retain) IBOutlet ImgView *imgView;


#pragma mark -
#pragma mark Button Action Methods

-(IBAction)onLeftButtonClicked:(id)sender;
-(IBAction)onRightButtonClicked:(id)sender;
-(IBAction)onDoneButtonClicked:(id)sender;
-(IBAction)onSaveButtonClicked:(id)sender;


#pragma mark -
#pragma mark Observer Methods

-(void)observeValueForKeyPath:(NSString *)keyPath
                     ofObject:(id)object
                       change:(NSDictionary *)change
                      context:(void *)context;
@end
