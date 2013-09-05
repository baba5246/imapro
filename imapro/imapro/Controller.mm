

#import "Controller.h"
#import "Processor.h"

@implementation Controller
{
    NSArray *files;
    NSURL *filePath;
    Processor *processor;
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
        
        processor = [Processor sharedManager];
    }
    return self;
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

- (IBAction)onDoneButtonClicked:(id)sender
{
    NSInteger index = [options indexOfSelectedItem];
    NSString *item = [options itemObjectValueAtIndex:index];
    NSLog(@"selected index: %ld, item:%@", (long)index, item);
    
    [self imageProcessing:index];
}

- (IBAction)onSaveButtonClicked:(id)sender
{
    [model countUp];
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

- (void) imageProcessing:(NSInteger)index
{
    switch (index) {
        case 0: // エッジ検出
            imgView.image = [processor detectEdgesWithNSImage:filePath.path];
            break;
        case 1: // 輪郭検出
            imgView.image = [processor detectControursFromFilename:filePath.path];
            break;
        case 2: // MSER検出
            break;
        case 3: // 提案手法1
            break;
        case 4: // 勾配ベクトル算出
            break;
        case 5: // Etext算出
            break;
            
        default:
            break;
    }
}
@end
