//
//  StageImageViewController.m
//  myApp
//
//  Created by 张东伟 on 17/10/9.
//  Copyright © 2017年 张东伟. All rights reserved.
//

#import "StageImageViewController.h"
@interface StageImageViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property(nonatomic,strong) UICollectionView *stageCollectionView;
@end

@implementation StageImageViewController
#pragma mark - 初始化

- (UICollectionView *)stageCollectionView{
    if(!_stageCollectionView){
        // 默认滚动方向,垂直
        UICollectionViewFlowLayout *layout = ({
            
            UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
            
            // 设置尺寸
            layout.itemSize = CGSizeMake(kScreenWidth/2, 120);
            
            //        //估算的尺寸(一般不需要设置)
            //        layout.estimatedItemSize = CGSizeMake(100, 100);
            
//            //头部的参考尺寸(就是尺寸)
//            layout.headerReferenceSize = CGSizeMake(100, 100);
//            //尾部的参考尺寸
//            layout.footerReferenceSize = CGSizeMake(100, 100);
            
            //设置分区的头视图和尾视图是否始终固定在屏幕上边和下边
            layout.sectionFootersPinToVisibleBounds = YES;
            layout.sectionHeadersPinToVisibleBounds = YES;
            
            // 设置水平滚动方向
//            //水平滚动
//            layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
            //竖直滚动
            layout.scrollDirection = UICollectionViewScrollDirectionVertical;
            
//            // 设置额外滚动区域
//            layout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
            
            // 设置cell间距
            //设置水平间距, 注意点:系统可能会跳转(计算不准确)
            layout.minimumInteritemSpacing = 0;
            //设置垂直间距
            layout.minimumLineSpacing = 0;
            
            layout;
            
        });
        
        
        // 创建UICollectionView
        // UICollectionView默认的颜色就是黑色,所以建议设置背景颜色
        _stageCollectionView = ({
            
            //创建UICollectionView对象, 将layout添加到collectionViewLayout:里面
            UICollectionView *collectionView =  [[UICollectionView alloc] initWithFrame:CGRectMake(0, 64, kScreenWidth, kScreenHeight-64) collectionViewLayout:layout];
            collectionView.backgroundColor = [UIColor orangeColor];
            collectionView.dataSource = self;
            collectionView.delegate = self;
            
            // 注册cell**
            [collectionView registerNib:[UINib nibWithNibName:@"StageImageCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"cellID"];
            
            /* 设置UICollectionView的属性 */
            //设置滚动条
            collectionView.showsHorizontalScrollIndicator = NO;
            collectionView.showsVerticalScrollIndicator = NO;
            
            //设置是否需要弹簧效果
            collectionView.bounces = YES;
            
            collectionView;
            
        });
    }
    return _stageCollectionView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self.view addSubview:self.stageCollectionView];
}

- (NSInteger)naviAndTabState{
    return 1;
}

#pragma mark -UICollectionViewDelegate
//UICollectionView被选中的时候调用
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%zd",indexPath.item);
}

// 返回这个UICollectionView是否可以被选择
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
    
}

#pragma mark - 数据源方法
// 告诉系统一共多少组
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

// 告诉系统每组多少个
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 20;
}

// 告诉系统每个Cell如何显示
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    // 1.从缓存池中取
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cellID" forIndexPath:indexPath];
    
    /*
     注意:
     UICollectioncView的cell和UITableView的cell不太一样,
     UITableView有默认的子控件
     UICollectionViewCell除了contentView以外, 没有提供默认的子控件
     设置UICollectionViewCell需要自定义 最好结合Xib使用
     */
    // 2.使用
    cell.backgroundColor = (indexPath.item % 2)?[UIColor redColor]:[UIColor greenColor];
    
    // 3.返回
    return cell;
}

/*
//动态设置每个Item的尺寸大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath;

//动态设置每个分区的EdgeInsets
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section;

//动态设置每行的间距大小
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section;

//动态设置每列的间距大小
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section;

//动态设置某组头视图大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section;

//动态设置某组尾视图大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section;
*/
@end
