
#import "FileDialogController.h"

@implementation FileDialogController
{
    Model *model;
}

- (IBAction)onSelectImport:(id)sender
{
    NSOpenPanel *openPanel	= [NSOpenPanel openPanel];
    NSArray *allowedFileTypes = [NSArray arrayWithObjects:@"jpeg", @"'JPEG'", @"jpg", @"JPG", @"png", @"PNG", nil];
    [openPanel setAllowedFileTypes:allowedFileTypes];
    NSInteger pressedButton = [openPanel runModal];
    
    model = [Model sharedManager];
    
    if( pressedButton == NSOKButton ){
        
        NSURL * filePath = [openPanel URL];
        NSArray *parts = [filePath.path componentsSeparatedByString:@"/"];
        NSString *filename = [parts objectAtIndex:[parts count]-1];
        NSString *subpath = [filePath.path substringToIndex:filePath.path.length-filename.length];
        [model setSubPath:subpath];
       
        NSFileManager *manager = [NSFileManager defaultManager];
        NSArray *files = [manager contentsOfDirectoryAtPath:subpath error:nil];
        [model setFiles:files];
        
        [model setImagePath:filePath];
        
    }else if( pressedButton == NSCancelButton ){
     	NSLog(@"Cancel button was pressed.");
    }else{
     	// error
    }
}

@end
