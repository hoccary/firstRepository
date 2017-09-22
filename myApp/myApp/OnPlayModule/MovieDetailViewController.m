//
//  MovieDetailViewController.m
//  myApp
//
//  Created by 张东伟 on 17/9/5.
//  Copyright © 2017年 张东伟. All rights reserved.
//
#import <AVKit/AVKit.h>
#import <AVFoundation/AVFoundation.h>
#import "MovieDetailViewController.h"

@interface MovieDetailViewController ()<UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate>
@property (strong, nonatomic) IBOutlet UIView *headerView;
@property (weak, nonatomic) IBOutlet UIImageView *headerImage;
@property (weak, nonatomic) IBOutlet UILabel *movieNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *releaseDateLabel;
@property (weak, nonatomic) IBOutlet UILabel *minsLabel;
@property (weak, nonatomic) IBOutlet UILabel *marksLabel;
@property (weak, nonatomic) IBOutlet UILabel *is3DLabel;

@property (nonatomic,strong) UITableView *mainTableView;
@property (nonatomic,strong) UIView *naviView;
@property (nonatomic,strong) UILabel *storyLabel;
//DATA
@property (nonatomic,strong) MovieDetailViewModel *selfVM;
@property (nonatomic,strong) MovieDetailModel *selfModel;
@property (nonatomic,assign) NSInteger numberOfSections;
@property (nonatomic,copy) NSArray *miniList;
@property (nonatomic,copy) NSArray *plusList;
@property (nonatomic,copy) NSArray *sectionTitles;

//@property (nonatomic, strong) AVPlayer *player;
@property (nonatomic, strong) AVPlayerViewController  *playerView;

@end

@implementation MovieDetailViewController

-(void)action{
    NSDictionary *videoDic = _selfModel.video;
    if([AFNetworkReachabilityManager sharedManager].networkReachabilityStatus ==  AFNetworkReachabilityStatusReachableViaWiFi)
        [self playVideoFromUrl:videoDic[@"hightUrl"]];
    else
        [self playVideoFromUrl:videoDic[@"url"]];
}
- (void)playOrPause{
    if(_playerView.player.timeControlStatus == AVPlayerTimeControlStatusPlaying){
        [_playerView.player pause];
    }else if(_playerView.player.timeControlStatus == AVPlayerTimeControlStatusPaused){
        [_playerView.player play];
    }else{
        
    }
}

- (void)playVideoFromUrl:(NSString*)urlString{
    //视频播放的url
    NSIndexPath *indexpath = [NSIndexPath indexPathForRow:0 inSection:2];
    UITableViewCell *videoCell = [_mainTableView cellForRowAtIndexPath:indexpath];
    CGRect rect = CGRectMake(0, 0, videoCell.contentView.frame.size.width, videoCell.frame.size.height);
    UIView *coverView = [[UIView alloc] initWithFrame:rect];
    coverView.backgroundColor = [UIColor clearColor];
    NSURL * videoURL = [NSURL URLWithString:urlString];
    _playerView = [[AVPlayerViewController alloc] init];

    _playerView.view.frame = rect;
    _playerView.player = [[AVPlayer alloc] initWithURL:videoURL];
    /*
     可以设置的值及意义如下：
     AVLayerVideoGravityResizeAspect   不进行比例缩放 以宽高中长的一边充满为基准
     AVLayerVideoGravityResizeAspectFill 不进行比例缩放 以宽高中短的一边充满为基准
     AVLayerVideoGravityResize     进行缩放充满屏幕
     */
    _playerView.videoGravity = AVLayerVideoGravityResizeAspect;
    _playerView.showsPlaybackControls = NO;
    UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(playOrPause)];
    gesture.numberOfTouchesRequired = 1;
    [coverView addGestureRecognizer:gesture];
    [videoCell addSubview:_playerView.view];
    [videoCell addSubview:coverView];
    [_playerView.player play];

}

- (BOOL)playerViewControllerShouldAutomaticall{
    return YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self.view addSubview:self.mainTableView];
    [self.view addSubview:self.naviView];
    _sectionTitles = @[@"剧情",@"主演",@"预告片",@"短评",@"长评",];
    _selfVM = [[MovieDetailViewModel alloc] init];
    [self requestDetails];

}

- (void)requestDetails{
    [_selfVM requestDetailWithDic:@{@"movieId":self.movieId} success:^(NSDictionary *dic) {
        _selfModel = [[MovieDetailModel alloc] initWithDic:dic];
        _movieNameLabel.text = _selfModel.name;
        _marksLabel.text =  [NSString stringWithFormat:@"%.1f",_marks];
        _minsLabel.text = _selfModel.mins;
        _storyLabel.text = _selfModel.story;
        _releaseDateLabel.text = [NSString stringWithFormat:@"%@-%@-%@",[_selfModel.releaseDate substringToIndex:4],[_selfModel.releaseDate substringWithRange:NSMakeRange(4, 2)],[_selfModel.releaseDate substringFromIndex:6]];
        _is3DLabel.text = (_selfModel.is3D == 1)?@"3D":@"2D";
        [_headerImage sd_setImageWithURL:[NSURL URLWithString:_selfModel.img]];
        _numberOfSections = 3;
        [_mainTableView reloadData];
        [self requestComments];
    } fail:^(NSError *error) {
        
    }];
    
}

- (void)requestComments{
    [_selfVM requestCommentsWithDic:@{@"movieId":self.movieId} success:^(NSDictionary *dic) {
        _miniList = dic[@"mini"][@"list"];
        _plusList = dic[@"plus"][@"list"];
        _numberOfSections = 5;
        [_mainTableView reloadData];
    } fail:^(NSError *error) {
        
    }];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    CGPoint p = [self.mainTableView contentOffset];
    [_naviView viewWithTag:100].alpha = getAlphaBetween(36, 136, p.y);
}

double getAlphaBetween(double a, double b, double y){
    double alpha;
    if(y<a){
        alpha = 0;
    }else if(y>a && y<b){
        alpha = (y-a)/(b-a);
    }else{
        alpha = 1;
    }
    return alpha;
}

- (UILabel *)storyLabel{
    if(!_storyLabel){
        _storyLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 5, kScreenWidth-20, 90)];
        _storyLabel.font = [UIFont systemFontOfSize:12];
        _storyLabel.numberOfLines = 0;
        _storyLabel.lineBreakMode = NSLineBreakByTruncatingHead;
    }
    return _storyLabel;
}

- (UITableView *)mainTableView{
    if(!_mainTableView){
        _mainTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, -200, kScreenWidth, kScreenHeight+200) style:UITableViewStylePlain];
        _mainTableView.delegate = self;
        _mainTableView.dataSource = self;
        _mainTableView.tableHeaderView = self.headerView;
        [_mainTableView registerNib:[UINib nibWithNibName:@"CommentsTableViewCell" bundle:nil] forCellReuseIdentifier:@"commentsCell"];
        [_mainTableView registerNib:[UINib nibWithNibName:@"StoryTableViewCell" bundle:nil] forCellReuseIdentifier:@"storyCell"];
        _mainTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _mainTableView.sectionHeaderHeight = 30;
        _mainTableView.rowHeight = UITableViewAutomaticDimension;
    }
    return  _mainTableView;
}

- (UIView *)naviView{
    if(!_naviView){
        _naviView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 64)];
        _naviView.backgroundColor = [UIColor clearColor];
        
        UIView *colorView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 64)];
        colorView.backgroundColor = AppTintColor;
        colorView.tag = 100;
        colorView.alpha = 0;
        
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(50, 20, kScreenWidth - 100, 44)];
        titleLabel.text = @"影片详情";
        titleLabel.font = [UIFont systemFontOfSize:18];
        titleLabel.textColor = [UIColor whiteColor];
        titleLabel.textAlignment = NSTextAlignmentCenter;
        
        [colorView addSubview:titleLabel];
        [_naviView addSubview:colorView];
        

        
        
        UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        backBtn.frame = CGRectMake(10, 27, 30, 30);
        [backBtn setImage:[UIImage imageNamed:@"naviBackArrow"] forState:UIControlStateNormal];
        backBtn.tintColor = [UIColor whiteColor];
//        [backBtn setTitle:@"《返回" forState:UIControlStateNormal];
        backBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        [_naviView addSubview:backBtn];
        [backBtn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
        
        UIButton *stageImageBtn =  [UIButton buttonWithType:UIButtonTypeSystem];
        stageImageBtn.frame = CGRectMake(kScreenWidth - 50, 26, 30, 30);
        [stageImageBtn setImage:[UIImage imageNamed:@"stagePicture"] forState:UIControlStateNormal];
        stageImageBtn.tintColor = [UIColor whiteColor];
        [_naviView addSubview:stageImageBtn];
        [stageImageBtn addTarget:self action:@selector(showStagePicture) forControlEvents:UIControlEventTouchUpInside];
    }
    return _naviView;
}

- (NSInteger)naviAndTabState{
    return 0;
}

- (void)back{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)showStagePicture{
    
}

- (UIView*)cellTitleLabel:(NSString *)titleStr{
    UIView *titleView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 30)];
    UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(15, 0, kScreenWidth, 30)];
    title.text = titleStr;
    title.font = [UIFont systemFontOfSize:16];
    title.numberOfLines = 1;
    [titleView addSubview:title];
    UIView *colorView = [[UIView alloc] initWithFrame:CGRectMake(6, 8, 5, 14)];
    colorView.backgroundColor = AppTintColor;
    colorView.layer.cornerRadius = 3;
    colorView.layer.masksToBounds = YES;
    [titleView addSubview:colorView];
    return titleView;
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    if(_mainTableView.contentOffset.y <176 && _mainTableView.contentOffset.y >96){
        [_mainTableView setContentOffset:CGPointMake(0, 136) animated:YES];
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if(section == 3)
        return _miniList.count;
    else
        return 1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return _numberOfSections;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *sectionView = [self cellTitleLabel:_sectionTitles[section]];
    return sectionView;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"row ===== %ld",indexPath.row);
    if(indexPath.section == 0){
        StoryTableViewCell *cell = [_mainTableView dequeueReusableCellWithIdentifier:@"storyCell"];
        [cell addSubview:self.storyLabel];
        cell.storyLabel.text = _selfModel.story;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }else if(indexPath.section == 1){
        UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"a"];
        UIScrollView *actorScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 180)];
        actorScrollView.contentSize = CGSizeMake(kScreenWidth/3*_selfModel.actors.count, 180);
        actorScrollView.showsVerticalScrollIndicator = NO;
        actorScrollView.showsHorizontalScrollIndicator = NO;
        for(int i=0; i!=_selfModel.actors.count; ++i){
            ActorDisplayView *actors = [[ActorDisplayView alloc] initWithFrame:CGRectMake(kScreenWidth/3*i, 0, kScreenWidth/3, 180)];
            NSDictionary *actorDic = _selfModel.actors[i];
            [actors.actorImageView sd_setImageWithURL:[NSURL URLWithString:[actorDic[@"roleImg"] isEqualToString:@""]?actorDic[@"img"]:actorDic[@"roleImg"]]];
            actors.actorNameLabel.text = actorDic[@"name"];
            actors.roleNameLabel.text = actorDic[@"roleName"];
            [actorScrollView addSubview:actors];
        }
        [cell addSubview:actorScrollView];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }else if(indexPath.section == 2){
        UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"a"];
        UIImageView *videoImage = [[UIImageView alloc] initWithFrame:CGRectMake(20, 10, kScreenWidth - 40, 200)];
        NSDictionary *videoDic = _selfModel.video;
        [videoImage sd_setImageWithURL:[NSURL URLWithString:videoDic[@"img"]]];
        videoImage.layer.cornerRadius = 4;
        videoImage.layer.masksToBounds = YES;
        videoImage.userInteractionEnabled = YES;
        UIImageView *playIcon = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"playVideo"]];
        playIcon.layer.shadowColor = [UIColor whiteColor].CGColor;
        playIcon.layer.shadowOpacity = 0.8;
        playIcon.layer.shadowRadius = 16;
        playIcon.layer.shadowOffset = CGSizeZero;
        playIcon.center = CGPointMake(videoImage.frame.size.width/2, videoImage.frame.size.height/2);
        [videoImage addSubview:playIcon];
        UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(action)];
        [videoImage addGestureRecognizer:gesture];
        [cell addSubview:videoImage];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }else if(indexPath.section == 3){
        CommentsTableViewCell *cell = [_mainTableView dequeueReusableCellWithIdentifier:@"commentsCell"];
        NSDictionary *dic = _miniList[indexPath.row];
        cell.datas = dic;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }else if(indexPath.section == 4){
        CommentsTableViewCell *cell = [_mainTableView dequeueReusableCellWithIdentifier:@"commentsCell"];
        NSDictionary *dic = _plusList[indexPath.row];
        cell.datas = dic;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }else{
        return nil;
    }

}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.section == 0){
        return 100;
    }
    if(indexPath.section == 3){
        return 137;
    }else if(indexPath.section == 4){
        return 500;
    }else{
        return 0;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.section == 1){
        return 180;
    }else if(indexPath.section == 2){
        return 220;
    }else{
        return UITableViewAutomaticDimension;
    }
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    [self.mainTableView addObserver:self forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionNew context:nil];
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:YES];
    [_mainTableView removeObserver:self forKeyPath:@"contentOffset"];
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;
}
@end


@implementation ActorDisplayView
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        _actorImageView = [[UIImageView alloc] initWithFrame:CGRectMake(20, 20, frame.size.width-40, frame.size.width-40)];
        _actorImageView.contentMode = UIViewContentModeScaleAspectFill;
        _actorImageView.layer.cornerRadius = _actorImageView.frame.size.width/2;
        _actorImageView.layer.masksToBounds = YES;
        [self addSubview:_actorImageView];
        
        _actorNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, frame.size.width, frame.size.width, 15)];
        _actorNameLabel.text = @"Jadfas ASD";
        _actorNameLabel.font = [UIFont systemFontOfSize:14];
        _actorNameLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_actorNameLabel];
        
        _roleNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, frame.size.width+20, frame.size.width, 15)];
        _roleNameLabel.text = @"JKKjk seijr";
        _roleNameLabel.font = [UIFont systemFontOfSize:12];
        _roleNameLabel.textColor = [UIColor lightGrayColor];
        _roleNameLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_roleNameLabel];
    }
    return self;
}

@end
