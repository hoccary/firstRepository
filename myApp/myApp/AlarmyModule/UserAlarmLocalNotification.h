//
//  UserAlarmLocalNotification.h
//  myApp
//
//  Created by Zhang on 2018/12/6.
//  Copyright © 2018 张东伟. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface UserAlarmLocalNotification : NSObject
PROPERTY_SINGLETON_FOR_CLASS(UserAlarmLocalNotification)
- (void)registerNotification:(NSInteger)alerTime;
@end

NS_ASSUME_NONNULL_END
