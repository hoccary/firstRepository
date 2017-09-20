//
//  MovieDetailViewModel.h
//  myApp
//
//  Created by 张东伟 on 17/9/5.
//  Copyright © 2017年 张东伟. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MovieDetailViewModel : NSObject
- (void)requestDetailWithDic:(NSDictionary*)dic
                     success:(void(^)(NSDictionary *dic))successBlock
                        fail:(void(^)(NSError *error))failBlock;

- (void)requestCommentsWithDic:(NSDictionary *)dic
                       success:(void (^)(NSDictionary *))successBlock
                          fail:(void (^)(NSError *))failBlock;
@end
