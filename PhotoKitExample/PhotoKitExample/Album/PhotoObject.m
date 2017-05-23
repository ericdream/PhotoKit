//
//  PhotoObject.m
//  XiaoKaWan
//
//  Created by apple_Eric on 7/11/16.
//  Copyright © 2016 不匠科技. All rights reserved.
//

#import "PhotoObject.h"

@implementation PhotoObject
- (NSData *)imageData{
    NSData *data = UIImageJPEGRepresentation(self.image, 0.3);
    self.localPath = [self tmpImagePath];
    [data writeToFile:self.localPath atomically:YES];
    return data;
}
- (NSString *)tmpImagePath{
    NSString *timeSp = [NSString stringWithFormat:@"%ld", (long)[[NSDate date] timeIntervalSince1970]];
    NSString*tmpPath = NSTemporaryDirectory();
    NSString *savedImagePath=[tmpPath stringByAppendingPathComponent:[NSString stringWithFormat:@"%@_tmp.png",timeSp]];
    return savedImagePath;
}
@end
