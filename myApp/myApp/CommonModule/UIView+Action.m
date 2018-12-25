//
//  UIView+Action.m
//  myApp
//
//  Created by guest on 2018/12/19.
//  Copyright © 2018年 张东伟. All rights reserved.
//

#import "UIView+Action.h"
#import <QuartzCore/QuartzCore.h>
#import <objc/runtime.h>

static char kActionHandlerBlockKey;
static char kActionHandlerGestureKey;
@implementation UIView (Action)

- (void)setViewActionWithBlock:(void (^)(void))block {
    UITapGestureRecognizer *gesture = objc_getAssociatedObject(self, &kActionHandlerGestureKey);
    
    if (!gesture) {
        gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleActionTapGesture:)];
        [self addGestureRecognizer:gesture];
        objc_setAssociatedObject(self, &kActionHandlerGestureKey, gesture, OBJC_ASSOCIATION_RETAIN);
    }
    
    objc_setAssociatedObject(self, &kActionHandlerBlockKey, block, OBJC_ASSOCIATION_COPY);
}

- (void)handleActionTapGesture:(UITapGestureRecognizer *)gesture {
    if (gesture.state == UIGestureRecognizerStateRecognized) {
        void(^action)(void) = objc_getAssociatedObject(self, &kActionHandlerBlockKey);
        
        if (action) {
            action();
        }
    }
}

- (void)makeCornerWithColor:(UIColor*)color andRadius:(CGFloat)radius{
    self.layer.borderColor = color.CGColor;
    self.layer.cornerRadius = radius;
    self.layer.borderWidth = 0.5;
    self.layer.masksToBounds = YES;
}

- (void)dw_popupWithCompletion:(void(^)(BOOL finished))completion{
    self.alpha = 0.5;
    self.transform = CGAffineTransformMakeScale(0.8, 0.8);
    [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        self.transform = CGAffineTransformMakeScale(1.01, 1.01);
        self.alpha = 1;
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.1 delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
            self.transform = CGAffineTransformIdentity;
        } completion:completion];
    }];
}

- (void)dw_shadeOff{
    [UIView animateWithDuration:0.3 animations:^{
        self.alpha = 0;
    } completion:^(BOOL finished) {
        self.alpha = 1;
        [self removeFromSuperview];
    }];
}
@end
