//
//  OnPlayModel.h
//  myApp
//
//  Created by 张东伟 on 17/9/2.
//  Copyright © 2017年 张东伟. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OnPlayModel : NSObject

//"NearestCinemaCount": 152,
//"NearestDay": 1486022400,
//"NearestShowtimeCount": 1767,
//"aN1": "成龙",
//"aN2": "李治廷",
//"cC": 152,
//"commonSpecial": "大哥携“小鲜肉”全球寻宝石",
//"d": "108",
//"dN": "唐季礼",
//"def": 0,
//"id": 217896,
//"img": "http://img5.mtime.cn/mt/2017/01/13/191421.14582165_1280X720X2.jpg",
//"is3D": false,
//"isDMAX": false,
//"isFilter": false,
//"isHot": true,
//"isIMAX": false,
//"isIMAX3D": false,
//"isNew": false,
//"isTicket": true,
//"m": "",
//"movieType": "动作 / 冒险 / 喜剧",
//"p": [
//      "动作冒险喜剧"
//      ],
//"r": 6.2,
//"rc": 0,
//"rd": "20170128",
//"rsC": 0,
//"sC": 3003,
//"t": "功夫瑜伽",
//"tCn": "功夫瑜伽",
//"tEn": "Kung-Fu Yoga",
//"ua": -1,
//"versions": [],
//"wantedCount": 1132
//},
@property (copy,nonatomic) NSString *aN1;       //演员1**
@property (copy,nonatomic) NSString *aN2;       //演员2**
@property (copy,nonatomic) NSString *d;         //影片时长
@property (copy,nonatomic) NSString *dN;        //导演
@property (copy,nonatomic) NSString *def;       //???
@property (copy,nonatomic) NSString *movieId;    //影片 id，需要提供给影片详情
@property (assign,nonatomic) double r;         //影片评分**
@property (copy,nonatomic) NSString *rd;        //影片上映时间**
@property (copy,nonatomic) NSString *sC;        //???
@property (copy,nonatomic) NSString *t;         //影片名**
@property (copy,nonatomic) NSString *tCn;       //影片中文名
@property (copy,nonatomic) NSString *tEn;       //影片英文名
@property (copy,nonatomic) NSString *versions;  //影片观影类型，如 3D、IMAX等
@property (copy,nonatomic) NSString *commonSpecial; // "大哥携“小鲜肉”全球寻宝石",
@property (copy,nonatomic) NSString *img;       //图片链接
@property (copy,nonatomic) NSString *is3D;
@property (copy,nonatomic) NSString *isHot;
@property (copy,nonatomic) NSString *movieType;     // "动作 / 冒险 / 喜剧"**
@property (copy,nonatomic) NSString *wantedCount;   // 1132
- (instancetype)initWithDic:(NSDictionary*)dic;
@end
