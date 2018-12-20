//
//  UserAlarmLocalNotification.m
//  myApp
//
//  Created by Zhang on 2018/12/6.
//  Copyright © 2018 张东伟. All rights reserved.
//

#import "UserAlarmLocalNotification.h"
#import <UserNotifications/UserNotifications.h>
@implementation UserAlarmLocalNotification
//使用 UNNotification 本地通知
SYNTHESIZE_SINGLETON_FOR_CLASS(UserAlarmLocalNotification)

- (void)registerNotification:(NSInteger)alerTime
{
    // 使用 UNUserNotificationCenter 来管理通知
    UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];

    //需创建一个包含待通知内容的 UNMutableNotificationContent 对象，注意不是 UNNotificationContent ,此对象为不可变对象。
    UNMutableNotificationContent *content = [[UNMutableNotificationContent alloc] init];
    content.title = [NSString localizedUserNotificationStringForKey:@"Hello!" arguments:nil];
    content.body = [NSString localizedUserNotificationStringForKey:@"Hello_message_body"
                                                         arguments:nil];
    content.sound = [UNNotificationSound defaultSound];

    // 在 alertTime 后推送本地推送
    UNTimeIntervalNotificationTrigger *trigger = [UNTimeIntervalNotificationTrigger
                                                  triggerWithTimeInterval:alerTime repeats:NO];

    UNNotificationRequest *request = [UNNotificationRequest requestWithIdentifier:@"FiveSecond"
                                                                          content:content trigger:trigger];

    //添加推送成功后的处理！
    [center addNotificationRequest:request withCompletionHandler:^(NSError *_Nullable error) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Oo.Alarmy.oO" message:@"成功添加推送" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *sureAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:nil];
        [alert addAction:sureAction];
        [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:alert animated:YES completion:nil];
    }];
}

@end
