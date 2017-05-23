//
//  SelectResultViewModel.h
//  XiaoKaWan
//
//  Created by apple_Eric on 7/12/16.
//  Copyright © 2016 不匠科技. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "PhotoAlbumViewModel.h"
#import "PhotoSelectBar.h"

@protocol SelectResultViewModelDelegate <NSObject>
/**
 *  photo 选择确认
 *
 *  @param photos photos description
 */
- (void)selectConfirm:(NSArray *)photos;

@end
@class PhotoSelectBar;
@interface SelectResultViewModel : NSObject<PhotoAlbumViewModelDelegate,PhotoSelectBarDelegate>
@property(nonatomic,weak) id<SelectResultViewModelDelegate> delegate;
- (void)getPhotoSelectBar:(PhotoSelectBar*)view;
@end
