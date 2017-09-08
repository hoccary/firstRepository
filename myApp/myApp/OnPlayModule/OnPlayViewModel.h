//
//  OnPlayViewModel.h
//  myApp
//
//  Created by 张东伟 on 17/9/2.
//  Copyright © 2017年 张东伟. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OnPlayViewModel : NSObject
- (void)requestOnPlayListWithDic:(NSDictionary*)dic
                         success:(void(^)(NSDictionary *))successBlock
                            fail:(void(^)(NSError *))failBlock;
@end
