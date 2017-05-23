//
//  PhotoObject.h
//  XiaoKaWan
//
//  Created by apple_Eric on 7/11/16.
//  Copyright © 2016 不匠科技. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
@interface PhotoObject : NSObject
@property(nonatomic,strong) UIImage *image;
@property(nonatomic,strong) UIImage *thumbImage;
@property(nonatomic,copy) NSString *aid;
@property(nonatomic,strong) CLLocation *location;
@property(nonatomic,copy) NSString *url;
@property(nonatomic,copy) NSString *path;
@property(nonatomic,strong) NSData *imageData;
@property(nonatomic,copy) NSString *localPath;
@property(nonatomic) NSInteger type; // 图片类型 0 默认 1 order_family（家纺照）  2 order_sign（ 签字照） <上传照片的时候使用>

@end
