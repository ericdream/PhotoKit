//
//  PhotoPreviewViewController.h
//  XiaoKaWan
//
//  Created by apple_Eric on 7/12/16.
//  Copyright © 2016 不匠科技. All rights reserved.
//

#import "SPViewController.h"
#import "AlbumPreviewViewModel.h"
@interface PhotoPreviewViewController : SPViewController
@property(nonatomic,strong) PHFetchResult *photoArray;
@property(nonatomic,strong) NSMutableArray *selectImages;
@property(nonatomic) NSInteger atIndex;
@property(nonatomic,copy) void(^selelctImageCallBack)(NSMutableArray *images);
@property(nonatomic,copy) void(^selelctImageConfirm)(NSArray *images);
@property(nonatomic) NSInteger limitCount;
@end
