//
//  OnPlayViewModel.m
//  myApp
//
//  Created by 张东伟 on 17/9/2.
//  Copyright © 2017年 张东伟. All rights reserved.
//

#import "OnPlayViewModel.h"

@implementation OnPlayViewModel
- (void)requestOnPlayListWithDic:(NSDictionary*)dic
                         success:(void(^)(NSDictionary *))successBlock
                            fail:(void(^)(NSError *))failBlock{
    NSDictionary *params = @{@"locationId":@"791"};
    [[NetworkTool sharedNetworkTool] GetFromUrl:URL_LOCATION_MOVIES URLparams:params success:^(id responseObject) {
        NSDictionary *movieList = responseObject;
        successBlock(movieList);
    } fail:^(NSError *error) {
        failBlock(error);
    }];
}



- (void)getFormSwaggerApiDic:(NSDictionary*)dic
                     success:(void(^)(NSDictionary *))successBlock
                        fail:(void(^)(NSError *))failBlock{
    NSDictionary *params = @{@"locationId":@"791"};
    [[NetworkTool sharedNetworkTool] GetFromUrl:@"http://127.0.0.1:7300/mock/59cd9c21d6ba20bd1df32ef6/base/v2/pet/findByStatus" URLparams:params success:^(id responseObject) {
        NSDictionary *result = responseObject;
        successBlock(result);
    } fail:^(NSError *error) {
        failBlock(error);
    }];
}


@end
