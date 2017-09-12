//
//  MovieDetailViewModel.m
//  myApp
//
//  Created by 张东伟 on 17/9/5.
//  Copyright © 2017年 张东伟. All rights reserved.
//

#import "MovieDetailViewModel.h"

@implementation MovieDetailViewModel
- (void)requestDetailWithDic:(NSDictionary*)dic
                     success:(void(^)(NSDictionary *dic))successBlock
                        fail:(void(^)(NSError *error))failBlock{
    NSDictionary *params = @{@"movieId":dic[@"movieId"],
                             @"locationId":@"791"};
    [[NetworkTool sharedNetworkTool] GetFromUrl:URL_MOVIE_DETAIL URLparams:params success:^(id responseObject) {
        NSDictionary *result = responseObject[@"data"];
        NSDictionary *basic = result[@"basic"];
        successBlock(basic);
    } fail:^(NSError *error) {
        failBlock(error);
    }];
}
@end
