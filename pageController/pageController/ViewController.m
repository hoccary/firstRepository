//
//  ViewController.m
//  pageController
//
//  Created by 张东伟 on 16/11/4.
//  Copyright © 2016年 ZhangDongwei. All rights reserved.
//

#import "ViewController.h"
#import "DEFINES.h"
@interface ViewController ()
@property (strong, nonatomic) IBOutlet UIPageControl *mainPageController;
@property (strong, nonatomic) IBOutlet UIScrollView *mainScrollView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _mainScrollView.contentInset = UIEdgeInsetsMake(0, 20, 0, 20);
    _mainScrollView.showsHorizontalScrollIndicator = NO;
    _mainScrollView.contentSize = CGSizeMake(SCREEN_WIDTH*5, 0);
    _mainScrollView.delegate = self;
    for( int i = 0; i!=5; ++i)
    {
        UIImageView *imgview = [[UIImageView alloc]init];
        imgview.frame = CGRectMake(SCREEN_WIDTH*i, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
        NSString *name = [NSString stringWithFormat:@"img%d",i+1];
        imgview.image = [UIImage imageNamed:name];
        [_mainScrollView addSubview:imgview];
    }

    _mainPageController.numberOfPages = 3;

    
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if(_mainScrollView.contentOffset.x < 1)
    {
        [_mainScrollView setContentOffset:CGPointMake(SCREEN_WIDTH *3, 0)];

    }
    if(_mainScrollView.contentOffset.x > SCREEN_WIDTH *4)
    {
        [_mainScrollView setContentOffset:CGPointMake(SCREEN_WIDTH, 0)];

    }
    CGFloat width = scrollView.contentOffset.x;
    int page = (width + scrollView.frame.size.width*0.5)/scrollView.frame.size.width;
    _mainPageController.currentPage = page%3;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
