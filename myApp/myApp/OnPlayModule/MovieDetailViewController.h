//
//  MovieDetailViewController.h
//  myApp
//
//  Created by 张东伟 on 17/9/5.
//  Copyright © 2017年 张东伟. All rights reserved.
//

#import "XJBaseViewController.h"
#import "MovieDetailViewModel.h"
#import "MovieDetailModel.h"
#import "CommentsTableViewCell.h"
@interface MovieDetailViewController : XJBaseViewController
//DATAS
@property (nonatomic,strong) NSString *movieId;
@property (nonatomic,assign) double marks;
@end


@interface ActorDisplayView : UIView
@property (nonatomic,strong) UIImageView *actorImageView;
@property (nonatomic,strong) UILabel *actorNameLabel;
@property (nonatomic,strong) UILabel *roleNameLabel;
@end
