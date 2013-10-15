
#import "XmlController.h"

@implementation XmlController
{
    Model *model;
}

-(IBAction)onSaveButtonClicked:(id)sender
{
    model = [Model sharedManager];
    
    if ([model saveRectangles])
    {
        NSAlert *alert = [[NSAlert alloc] init];
        [alert addButtonWithTitle:@"OK"];
        [alert setMessageText:@"Succeeded!"];
        [alert setInformativeText:@"Saving operation finished successfully!"];
        [alert setAlertStyle:NSWarningAlertStyle];
        
        [alert runModal];
    }
    else
    {
        NSAlert *alert = [[NSAlert alloc] init];
        [alert addButtonWithTitle:@"OK"];
        [alert setMessageText:@"Failed!"];
        [alert setInformativeText:@"Saving operation was failed because there are no rectangles..."];
        [alert setAlertStyle:NSWarningAlertStyle];
        
        [alert runModal];
    }
    
}

-(IBAction)onExportXMLButtonClicked:(id)sender
{
    model = [Model sharedManager];
}

@end
