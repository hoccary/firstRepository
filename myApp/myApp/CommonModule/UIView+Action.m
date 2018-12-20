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

@end
