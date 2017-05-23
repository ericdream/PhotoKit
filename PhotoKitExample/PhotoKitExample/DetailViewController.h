//
//  DetailViewController.h
//  PhotoKitExample
//
//  Created by apple on 11/05/2017.
//  Copyright © 2017 Eric. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) NSDate *detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end

