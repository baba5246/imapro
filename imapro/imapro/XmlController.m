
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
    
    // XML作成
    NSXMLDocument* document= [NSXMLNode document];
    
    [document setVersion:@"1.0"];
    
    NSXMLDTD* dtd= [[NSXMLDTD alloc] init];
    [dtd setPublicID:@"__URL__"];
    [document setDTD:dtd];
    
    [document addChild:[NSXMLNode commentWithStringValue:@"__Comment_String__"]];
    
    NSXMLElement* root= [NSXMLNode elementWithName:@"root"];
    [document setRootElement:root];
    
    NSXMLElement* child= [NSXMLNode elementWithName:@"child"];
    [root addChild:child];
    
    [child addAttribute:[NSXMLNode attributeWithName:@"attrKey" stringValue:@"attrVal"]];
    
    
    // データ保存
    NSSavePanel *save = [NSSavePanel savePanel];
    if ([save runModal] == NSOKButton) {
        NSURL * filePath = [save URL];
        [[document XMLString] writeToFile:filePath.path atomically:YES encoding:4 error:NULL];
    }
}


@end
