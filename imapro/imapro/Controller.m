

#import "Controller.h"

@implementation Controller
{
    NSArray *files;
    NSURL *filePath;
}

@synthesize imgView;

-(id) init
{
    self = [super init];
    if (self) {
        
        model = [Model sharedManager];
        [model addObserver:self forKeyPath:@"counter"
                   options:(NSKeyValueObservingOptionNew) context:nil];
        [model addObserver:self forKeyPath:IMAGE_PATH_KEY
                   options:(NSKeyValueObservingOptionNew|NSKeyValueObservingOptionPrior)
                   context:nil];
        
    }
    return self;
}

- (IBAction)onSaveButtonClicked:(id)sender
{
    [model countUp];
}

-(IBAction)onLeftButtonClicked:(id)sender
{
    NSString *filename = [self filenameFromPath:filePath];
    NSUInteger index = [files indexOfObject:filename];
    
    if (index > 0)
    {
        filename = [files objectAtIndex:index-1];
        NSString *pathString = [[model directory] stringByAppendingString:filename];
        filePath = [NSURL fileURLWithPath:pathString];
        
        [self setImageFromFilePath];
    }
}

-(IBAction)onRightButtonClicked:(id)sender
{
    NSString *filename = [self filenameFromPath:filePath];
    NSUInteger index = [files indexOfObject:filename];
    
    if (index < [files count]-1)
    {
        filename = [files objectAtIndex:index+1];
        NSString *pathString = [[model directory] stringByAppendingString:filename];
        filePath = [NSURL fileURLWithPath:pathString];
        
        [self setImageFromFilePath];
    }
}

- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary *)change
                       context:(void *)context
{
    if ([keyPath isEqual:@"counter"])
    {
        int data = [model counter];
        
        NSString *rectangle = [NSString stringWithFormat:@"(%d, %d)(%d, %d)",
                               data, data+data, data*data, (int)pow(data, data)];
        [rlabel setStringValue:rectangle];
        [tlabel setStringValue:@"sample"];  // Viewを更新
    }
    else if ([keyPath isEqual:IMAGE_PATH_KEY])
    {
        filePath = [model imagePath];
        files = [model files];
        
        [self setImageFromFilePath];
    }
    
}

- (void) setImageFromFilePath
{
    NSString *filename = [self filenameFromPath:filePath];
    if (filename != nil) [flabel setStringValue:filename];
    
    NSImage *image = [[NSImage alloc] initWithContentsOfURL:filePath];
    imgView.image = image;
}

- (NSString*) filenameFromPath:(NSURL*)path
{
    NSArray *parts = [path.path componentsSeparatedByString:@"/"];
    NSString *filename = [parts objectAtIndex:[parts count]-1];
    
    return filename;
}

@end
