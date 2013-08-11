
#import "FileDialogController.h"

@implementation FileDialogController

- (IBAction)onSelectImport:(id)sender
{
    NSOpenPanel *openPanel	= [NSOpenPanel openPanel];
    NSArray *allowedFileTypes = [NSArray arrayWithObjects:@"jpeg", @"'JPEG'", nil];
    //  NSOpenPanel interface has changed since Mac OSX v10.6.
    [openPanel setAllowedFileTypes:allowedFileTypes];
    NSInteger pressedButton = [openPanel runModal];
    
    if( pressedButton == NSOKButton ){
        
        // get file path
        NSURL * filePath = [openPanel URL];
        
        // open file here
        NSLog(@"file opened '%@'", filePath);
        
    }else if( pressedButton == NSCancelButton ){
     	NSLog(@"Cancel button was pressed.");
    }else{
     	// error
    }
}

@end
