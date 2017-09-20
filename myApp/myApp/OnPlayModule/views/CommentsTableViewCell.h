//
//  CommentsTableViewCell.h
//  myApp
//
//  Created by 张东伟 on 17/9/13.
//  Copyright © 2017年 张东伟. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface CommentsTableViewCell : UITableViewCell
@property (nonatomic,copy) NSDictionary *datas;
@property (weak, nonatomic) IBOutlet UILabel *date;
@property (weak, nonatomic) IBOutlet UIImageView *headImg;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *comment;
- (void)setDatas:(NSDictionary *)datas;
@end
