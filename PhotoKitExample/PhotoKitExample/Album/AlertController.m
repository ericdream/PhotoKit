//
//  AlertController.m
//  XiaoKaWan
//
//  Created by apple_Eric on 7/30/16.
//  Copyright © 2016 不匠科技. All rights reserved.
//

#import "AlertController.h"

#define BJLocalizedString(string)  \
NSLocalizedString(string, nil)
typedef void (^AlertIndex)(NSInteger index);
@interface AlertController ()
@property(nonatomic,copy) AlertIndex alterIndex;
@end

@implementation AlertController
- (instancetype)initWithTitle:(NSString *)title message:(NSString *)message preferredStyle:(UIAlertControllerStyle)preferredStyle withTitles:(NSArray<NSString *> *)titles handler:(void (^)(NSInteger))index{
    self = [AlertController alertControllerWithTitle:title message:message preferredStyle:preferredStyle];
    if(self){
        self.alterIndex = index;
        [self addActions:titles];
    }
    return self;
}
- (instancetype)initWithTitle:(NSString *)title message:(NSString *)message preferredStyle:(UIAlertControllerStyle)preferredStyle{
    self = [AlertController alertControllerWithTitle:title message:message preferredStyle:preferredStyle];
    if(self){
    }
    return self;
}
- (void)addActions:(NSArray *)titles{
    [titles enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
       [self addAction:[UIAlertAction actionWithTitle:obj style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
           if(self.alterIndex)self.alterIndex(idx);
       }]];
    }];
    [self addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }]];
}
- (void)addCancleActionHandlerWithTitle:(NSString *)title andHandler:(void(^)())handler{
    [self addAction:[UIAlertAction actionWithTitle:title style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        if(handler)handler();
    }]];
}
- (void)addCancleActionHandler:(void (^)())handler{
    [self addCancleActionHandlerWithTitle:@"取消" andHandler:handler];
}
- (void)addActionWithTitle:(NSString *)title handler:(void (^)())handler{
    [self addAction:[UIAlertAction actionWithTitle:title style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
       if(handler)handler();
    }]];
}
- (void)addDestructiveActionWithTitle:(NSString *)title handler:(void(^)())handler{
    [self addAction:[UIAlertAction actionWithTitle:title style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        if(handler)handler();
    }]];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)showWith:(UIViewController *)controller{
    [controller presentViewController:self animated:YES completion:nil];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
