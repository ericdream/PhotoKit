//
//  PhotoAlbumViewController.h
//  XiaoKaWan
//
//  Created by apple_Eric on 7/11/16.
//  Copyright © 2016 不匠科技. All rights reserved.
//

#import "SPViewController.h"
#import "PhotoObject.h"
@interface PhotoAlbumViewController : SPViewController
@property(nonatomic) NSInteger limitCount; // default 100
@property(nonatomic,copy) void(^seleltImages)(NSArray * images);
@property(nonatomic,copy) void(^takePhoto)();
@end
