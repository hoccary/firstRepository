//
//  UIView+Action.h
//  myApp
//
//  Created by guest on 2018/12/19.
//  Copyright © 2018年 张东伟. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UIView (Action)
//设置点击方法
- (void)setViewActionWithBlock:(void (^)(void))block ;
//设置圆角
- (void)makeCornerWithColor:(UIColor*)color andRadius:(CGFloat)radius;

- (void)dw_popupWithCompletion:(void(^)(BOOL finished))completion;

- (void)dw_shadeOff;
@end
