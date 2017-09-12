//
//  MovieDetailViewController.m
//  myApp
//
//  Created by 张东伟 on 17/9/5.
//  Copyright © 2017年 张东伟. All rights reserved.
//

#import "MovieDetailViewController.h"
#import "MovieDetailViewModel.h"
#import "MovieDetailModel.h"
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
@end

@implementation MovieDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self.view addSubview:self.mainTableView];
    [self.view addSubview:self.naviView];
    
    _selfVM = [[MovieDetailViewModel alloc] init];
    [_selfVM requestDetailWithDic:@{@"movieId":self.movieId} success:^(NSDictionary *dic) {
        _selfModel = [[MovieDetailModel alloc] initWithDic:dic];
        _movieNameLabel.text = _selfModel.name;
        _marksLabel.text =  [NSString stringWithFormat:@"%.1f",_marks];
        _minsLabel.text = _selfModel.mins;
        _storyLabel.text = _selfModel.story;
        _releaseDateLabel.text = [NSString stringWithFormat:@"%@-%@-%@",[_selfModel.releaseDate substringToIndex:4],[_selfModel.releaseDate substringWithRange:NSMakeRange(4, 2)],[_selfModel.releaseDate substringFromIndex:6]];
        _is3DLabel.text = (_selfModel.is3D == 1)?@"3D":@"2D";
        [[NetworkTool sharedNetworkTool] requestImageFromURL:_selfModel.img fileName:_selfModel.nameEn identifier:@"detail" success:^(UIImage *image) {
            _headerImage.image = image;
        } fail:^(NSError *error) {
            
        }];
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
        _mainTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight) style:UITableViewStylePlain];
        _mainTableView.delegate = self;
        _mainTableView.dataSource = self;
        _mainTableView.tableHeaderView = self.headerView;
        _mainTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return  _mainTableView;
}

- (UIView *)naviView{
    if(!_naviView){
        _naviView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 64)];
        _naviView.backgroundColor = [UIColor clearColor];
        
        UIView *colorView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 64)];
        colorView.backgroundColor = [UIColor orangeColor];
        colorView.tag = 100;
        colorView.alpha = 0;
        [_naviView addSubview:colorView];
        
        UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        backBtn.frame = CGRectMake(15, 27, 50, 20);
        [backBtn setTitle:@"《返回" forState:UIControlStateNormal];
        backBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        [_naviView addSubview:backBtn];
        [backBtn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    }
    return _naviView;
}

- (NSInteger)naviAndTabState{
    return 0;
}

- (void)back{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    if(_mainTableView.contentOffset.y <176 && _mainTableView.contentOffset.y >96){
        [_mainTableView setContentOffset:CGPointMake(0, 136) animated:YES];
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if(!_selfModel)
        return 0;
    else
        return 5;
}

- (UIView*)cellTitleLabel:(NSString *)titleStr{
    UIView *titleView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth/2, 20)];
    UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(15, 5, kScreenWidth, 15)];
    title.text = titleStr;
    title.font = [UIFont systemFontOfSize:16];
    [titleView addSubview:title];
    UIView *colorView = [[UIView alloc] initWithFrame:CGRectMake(5, 5, 5, 15)];
    colorView.backgroundColor = [UIColor orangeColor];
    colorView.layer.cornerRadius = 3;
    colorView.layer.masksToBounds = YES;
    [titleView addSubview:colorView];
    return titleView;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"a"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    if(indexPath.row == 0){
        [cell addSubview:self.storyLabel];
        _storyLabel.text = _selfModel.story;
    }
    else if(indexPath.row == 1){
        [cell addSubview:[self cellTitleLabel:@"主演："]];
        for(int i=0; i!=_selfModel.actors.count; ++i){
            ActorDisplayView *actors = [[ActorDisplayView alloc] initWithFrame:CGRectMake(kScreenWidth/3*i, 20, kScreenWidth/3, 200)];
            NSDictionary *actorDic = _selfModel.actors[i];
            [[NetworkTool sharedNetworkTool] requestImageFromURL:[actorDic[@"roleImg"] isEqualToString:@""]?actorDic[@"img"]:actorDic[@"roleImg"] fileName:actorDic[@"nameEn"] identifier:@"actorRole" success:^(UIImage *image) {
                actors.actorImageView.image = image;
            } fail:^(NSError *error) {
                
            }];
            actors.actorNameLabel.text = actorDic[@"name"];
            actors.roleNameLabel.text = actorDic[@"roleName"];
            [cell addSubview:actors];
        }
    }else if(indexPath.row == 2){
        [cell addSubview:[self cellTitleLabel:@"预告片："]];
        UIImageView *videoImage = [[UIImageView alloc] initWithFrame:CGRectMake(20, 30, kScreenWidth-40, 160)];
        NSDictionary *videoDic = _selfModel.video;
        [[NetworkTool sharedNetworkTool] requestImageFromURL:videoDic[@"img"] fileName:videoDic[@"videoId"] identifier:@"videoPre" success:^(UIImage *image) {
            videoImage.image = image;
        } fail:^(NSError *error) {
            
        }];
        videoImage.layer.shadowColor = [UIColor blackColor].CGColor;
        videoImage.layer.shadowOpacity = 0.5;
        videoImage.layer.shadowRadius = 4;
        videoImage.layer.shadowOffset = CGSizeMake(4, 4);
        videoImage.layer.cornerRadius = 4;
        videoImage.layer.masksToBounds = YES;
        [cell addSubview:videoImage];
    }else if(indexPath.row == 3){
        [cell addSubview:[self cellTitleLabel:@"短评："]];
    }else if(indexPath.row == 4){
        [cell addSubview:[self cellTitleLabel:@"长评："]];
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.row) {
        case 0:
            return 100;
            break;
            
        default:
            return 200;
            break;
    }
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    [self.mainTableView addObserver:self forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionNew context:nil];
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:YES];
    [_mainTableView removeObserver:self forKeyPath:@"contentOffset"];
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
