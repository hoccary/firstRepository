//
//  DEFINES.h
//  drawing
//
//  Created by *** on 16/10/21.
//  Copyright © 2016年 ************. All rights reserved.
//
#pragma -全局宏定义

#ifndef DEFINES_h

#define DEFINES_h

#define kFSCREEN_FREAM [UIScreen mainScreen].applicationFrame

#define SCREEN_WIDTH [[UIScreen mainScreen] bounds].size.width//设备屏幕宽度

#define SCREEN_HEIGHT [[UIScreen mainScreen] bounds].size.height//设备屏幕高度

#define X_INCH4_0 320.0

#define Y_INCH4_0 568.0

#define X_IN(x) ( (SCREEN_WIDTH == X_INCH4_0) ? x : ((x) * SCREEN_WIDTH / X_INCH4_0) )

#define Y_IN(y) ( (SCREEN_HEIGHT <= Y_INCH4_0) ? y : ((y) * SCREEN_HEIGHT / Y_INCH4_0) )

#define Y_IN1(y) ( (SCREEN_HEIGHT == Y_INCH4_0) ? y : ((y) * SCREEN_HEIGHT / Y_INCH4_0) )

#define W_IN(w) ( (SCREEN_WIDTH == X_INCH4_0) ? w : ((w) * SCREEN_WIDTH / X_INCH4_0) )

#define H_IN(h) ( (SCREEN_HEIGHT <= Y_INCH4_0) ? h : ((h) * SCREEN_HEIGHT / Y_INCH4_0) )

#define MYCGRectMake(x,y,w,h)  CGRectMake(X_IN(x), Y_IN(y), W_IN(w) ,H_IN(h))

//扇形图颜色数组宏定义
#define k_COLOR_STOCK @[[UIColor colorWithRed:244/255.0 green:161/255.0 blue:100/255.0 alpha:1],[UIColor colorWithRed:87/255.0 green:255/255.0 blue:191/255.0 alpha:1],[UIColor colorWithRed:99/255.0 green:106/255.0 blue:192/255.0 alpha:1],[UIColor colorWithRed:240/255.0 green:58/255.0 blue:63/255.0 alpha:1],[UIColor colorWithRed:147/255.0 green:111/255.0 blue:255/255.0 alpha:1],[UIColor colorWithRed:255/255.0 green:255/255.0 blue:199/255.0 alpha:1],[UIColor colorWithRed:90/255.0 green:159/255.0 blue:229/255.0 alpha:1],[UIColor colorWithRed:100/255.0 green:230/255.0 blue:95/255.0 alpha:1],[UIColor colorWithRed:33/255.0 green:255/255.0 blue:255/255.0 alpha:1],[UIColor colorWithRed:249/255.0 green:110/255.0 blue:176/255.0 alpha:1],[UIColor colorWithRed:192/255.0 green:168/255.0 blue:250/255.0 alpha:1],[UIColor colorWithRed:166/255.0 green:134/255.0 blue:54/255.0 alpha:1],[UIColor colorWithRed:217/255.0 green:221/255.0 blue:228/255.0 alpha:1],[UIColor colorWithRed:254/255.0 green:224/255.0 blue:90/255.0 alpha:1]]

#endif /* DEFINES_h */
