
#import "AppDelegate.h"

@implementation AppDelegate
{
    Model *model;
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
    model = [Model sharedManager];
}

- (void)applicationDidBecomeActive:(NSNotification *)notification
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if ([defaults objectForKey:@"Model"]!=nil) model = [defaults objectForKey:@"Model"];
}

- (void)applicationWillTerminate:(NSNotification *)notification
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:model forKey:@"Model"];
}

@end
