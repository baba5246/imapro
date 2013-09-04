
#import "Processor.h"
#import <opencv2/opencv.hpp>

@implementation Processor

+ (void)test
{
    IplImage *image = cvCreateImage(cvSize(100, 100), 1, 1);
    NSLog(@"aaaa");
}

@end
