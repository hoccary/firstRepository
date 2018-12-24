//
//  OnPlayViewController.m
//  myApp
//
//  Created by 张东伟 on 17/9/2.
//  Copyright © 2017年 张东伟. All rights reserved.
//

#import "OnPlayViewController.h"
#import "OnPlayViewModel.h"
#import "OnPlayModel.h"
#import "MovieDetailViewController.h"
@interface OnPlayViewController ()<UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate>
@property (strong, nonatomic) IBOutlet UIView *tableHeaderView;
@property (strong,nonatomic) UITableView *OnPlayTableView;
@property (strong,nonatomic) OnPlayViewModel *selfVM;
@property (strong,nonatomic) NSArray *movieList;
@property (strong,nonatomic) UIView *loadingview;
@property (assign,nonatomic) CGAffineTransform loadingtransform;
@property (assign,nonatomic) NSInteger isLoading;
@property (strong,nonatomic) UIView *HightestRatingView;
@property (strong,nonatomic) UILabel *failLabel;
@end

@implementation OnPlayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    _movieList = [[NSMutableArray alloc] init];
    _selfVM = [[OnPlayViewModel alloc] init];
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self loadData];

    [self.view addSubview:self.OnPlayTableView];
    [_OnPlayTableView addObserver:self forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionNew context:nil];
}

- (NSInteger)naviAndTabState{
    return 2;
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    CGPoint point = _OnPlayTableView.contentOffset;
    if(point.y < -40 && point.y > -100){
        NSLog(@"\nTableview scroll to %lf",point.y);
        self.loadingview.transform = CGAffineTransformRotate(_loadingtransform, M_PI*(-point.y-40)/60);
        self.loadingview.center = CGPointMake(kScreenWidth/2, (-point.y-60)*2);
    }
}

- (void)loadData{
    _isLoading = 1;
    [_selfVM requestOnPlayListWithDic:nil success:^(NSDictionary *dic) {
        NSArray *list = dic[@"ms"];
        __block NSMutableArray *tmpList = [[NSMutableArray alloc] init];
//        [_movieList removeAllObjects];
        __block double maxRate = 0;
        __block OnPlayModel *maxRateModel;
        [list enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            NSDictionary *tmpDic = obj;
            OnPlayModel *model = [[OnPlayModel alloc] initWithDic:tmpDic];
            if(model.r > 2.0)
                [tmpList addObject:model];
            if(model.r > maxRate){
                maxRate = model.r;
                maxRateModel = model;
            }
        }];
        _movieList = tmpList;
        [self refreshHeaderWithModel:maxRateModel];
        [_failLabel removeFromSuperview];
        [_OnPlayTableView reloadData];
        _isLoading = 0;
    } fail:^(NSError *error) {
        _isLoading = 0;
        //添加失败标签
        _failLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 50)];
        _failLabel.text = @"加载失败，请下拉刷新";
        //        failLabel.font = [UIFont systemFontOfSize:11];
        _failLabel.textColor = UIColor.lightTextColor;
        _failLabel.textAlignment = NSTextAlignmentCenter;
        _failLabel.center = self.view.center;
        [self.OnPlayTableView addSubview:_failLabel];
    }];
}

- (void)refreshHeaderWithModel:(OnPlayModel*)model{
    UIImageView *imgView = [_OnPlayTableView.tableHeaderView viewWithTag:201];
    [imgView sd_setImageWithURL:[NSURL URLWithString:model.img]];
    UILabel *labelCN = [_OnPlayTableView.tableHeaderView viewWithTag:202];
    labelCN.text = [NSString stringWithFormat:@"%@",model.tCn];
    UILabel *labelEN = [_OnPlayTableView.tableHeaderView viewWithTag:203];
    labelEN.text = [NSString stringWithFormat:@"%@",model.tEn];
}

-(UITableView *)OnPlayTableView{
    if(!_OnPlayTableView){
        _OnPlayTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, -150, kScreenWidth, kScreenHeight - 49 + 150) style:UITableViewStyleGrouped];
        _OnPlayTableView.dataSource = self;
        _OnPlayTableView.delegate = self;
        _OnPlayTableView.rowHeight = 200*kScale;
        [_OnPlayTableView registerNib:[UINib nibWithNibName:@"OnPlayTableViewCell" bundle:nil]forCellReuseIdentifier:@"onPalyCell"];
        _OnPlayTableView.tableHeaderView = self.tableHeaderView;
        _OnPlayTableView.sectionFooterHeight = 0;
        _OnPlayTableView.showsVerticalScrollIndicator = NO;
    }
    return _OnPlayTableView;
}

- (UIView *)loadingview{
    if(!_loadingview){
        UIImageView *tmpImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
        tmpImageView.image = [UIImage imageNamed:@"refresh"];
        _loadingview = tmpImageView;
        _loadingview.center = CGPointMake(kScreenWidth/2, -20);
        _loadingview.backgroundColor = [UIColor clearColor];
        [self.view addSubview:_loadingview];
        _loadingtransform = _loadingview.transform;
    }
    return _loadingview;
}

#pragma marks - tableview代理方法
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return _movieList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    OnPlayTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"onPalyCell"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    [cell configWithModel:(OnPlayModel*)_movieList[indexPath.section]];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    MovieDetailViewController *movieVC = [[MovieDetailViewController alloc] init];
    movieVC.movieId = ((OnPlayModel*)(_movieList[indexPath.section])).movieId;
    movieVC.marks = ((OnPlayModel*)(_movieList[indexPath.section])).r;
    [self.navigationController pushViewController:movieVC animated:YES];
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    if(scrollView.contentOffset.y < -100){
        NSLog(@"do refresh");
        if(_isLoading == 0)
            [self loadData];
    }
}
@end
