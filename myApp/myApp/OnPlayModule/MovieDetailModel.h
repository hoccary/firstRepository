//
//  MovieDetailModel.h
//  myApp
//
//  Created by 张东伟 on 17/9/5.
//  Copyright © 2017年 张东伟. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MovieDetailModel : NSObject
@property (strong,nonatomic) NSDictionary *actors;
@property (strong,nonatomic) NSDictionary *director;
@property (strong,nonatomic) NSString *img; //剧照
@property (strong,nonatomic) NSString *is3D;
@property (strong,nonatomic) NSString *mins;
@property (strong,nonatomic) NSString *movieId;
@property (strong,nonatomic) NSString *name;
@property (strong,nonatomic) NSString *nameEn;
@property (strong,nonatomic) NSString *releaseDate;
@property (strong,nonatomic) NSArray *stageImg;
@property (strong,nonatomic) NSString *story;
@property (strong,nonatomic) NSDictionary *video;
@property (strong,nonatomic) NSString *commentSpecial;
@property (strong,nonatomic) NSString *totalBox;//累计票房
@end
