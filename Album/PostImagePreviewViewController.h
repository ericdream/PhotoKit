//
//  PostImagePreviewViewController.h
//  XiaoKaWan
//
//  Created by apple_Eric on 7/13/16.
//  Copyright © 2016 不匠科技. All rights reserved.
//

#import "SPViewController.h"

@interface PostImagePreviewViewController : SPViewController
@property(nonatomic,copy)NSArray *images;
@property(nonatomic) NSInteger index;
@property(nonatomic,copy) void(^imageArrayCallBack)(NSMutableArray *array);
@property(nonatomic)BOOL hiddenDeleteBtn;
@end
