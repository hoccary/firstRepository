//
//  CommentsTableViewCell.m
//  myApp
//
//  Created by 张东伟 on 17/9/13.
//  Copyright © 2017年 张东伟. All rights reserved.
//

#import "CommentsTableViewCell.h"

@implementation CommentsTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setDatas:(NSDictionary *)datas{
    _datas = datas;
    [_headImg setIconURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",_datas[@"headImg"]]]];
    _headImg.layer.cornerRadius = _headImg.frame.size.width/2;
    _headImg.layer.masksToBounds = YES;
    _comment.text = [NSString stringWithFormat:@"%@",_datas[@"content"]];
    _date.text = [NSString stringWithFormat:@"%@",_datas[@"commentDate"]];
    _name.text = [NSString stringWithFormat:@"%@",_datas[@"nickname"]];
}

@end
