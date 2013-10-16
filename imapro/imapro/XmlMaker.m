
#import "XmlMaker.h"

@implementation XmlMaker

+ (NSString *)makeXmlDocument:(NSDictionary *)data
{
    // XML Document 作成
    NSXMLDocument* document= [NSXMLNode document];
    [document setVersion:@"1.0"];
    //[document addChild:[NSXMLNode commentWithStringValue:@"__Comment_String__"]];
    
    NSXMLElement* root= [NSXMLNode elementWithName:@"root"];
    [document setRootElement:root];
   
    for (NSString *key in [data allKeys]) {
        
        NSXMLElement* image = [NSXMLNode elementWithName:@"image"]; // imageタグ
        [image addAttribute:[NSXMLNode attributeWithName:@"name" stringValue:key]]; // name属性
        
        for (Truth *t in data[key]) {
            NSXMLElement *truth = [NSXMLNode elementWithName:@"truth"]; // truthタグ
            NSString *rect = [NSString stringWithFormat:@"{{%d,%d},{%d,%d}}",
                              (int)t.rect.origin.x, (int)t.rect.origin.y, (int)t.rect.size.width, (int)t.rect.size.height];
            [truth addAttribute:[NSXMLNode attributeWithName:@"rect" stringValue:rect]];
            [truth addAttribute:[NSXMLNode attributeWithName:@"text" stringValue:t.text]];
            [image addChild:truth];
        }
        
        [root addChild:image];
    }
    
    return [document XMLString];
}

@end
