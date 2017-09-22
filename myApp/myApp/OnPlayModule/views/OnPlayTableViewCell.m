//
//  OnPlayTableViewCell.m
//  myApp
//
//  Created by 张东伟 on 17/9/2.
//  Copyright © 2017年 张东伟. All rights reserved.
//

#import "OnPlayTableViewCell.h"

@implementation OnPlayTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}

- (void)configWithModel:(OnPlayModel*)model{
    _nameLabel.text = model.t;
    _markLabel.text = [NSString stringWithFormat:@"评分:%.1f",model.r];
    _actorsLabel.text = [NSString stringWithFormat:@"%@,%@",model.aN1,model.aN2];
    _typeLabel.text = model.movieType;
    [_movieImage sd_setImageWithURL:[NSURL URLWithString:model.img]];
    [_bgImage sd_setImageWithURL:[NSURL URLWithString:model.img]];
}

//- (void)requestImageFromURL:(NSString*)URLString fileName:(NSString*)filename{
//    NSString *key = [NSString stringWithFormat:@"onPlay_%@",filename];
//    if ( [[FlyImageCache sharedInstance] isImageExistWithKey:key] ) {
//        NSString *path = [[FlyImageCache sharedInstance] imagePathWithKey:key];
//        NSURL *url = [NSURL fileURLWithPath:path];
//        NSData *data = [NSData dataWithContentsOfURL:url];
//        UIImage *image = [UIImage imageWithData:data];
//        _movieImage.image = image;
//        _bgImage.image = image;
//    }else{
//        NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString: URLString]];
//        
//        
//        [[FlyImageDownloader sharedInstance] downloadImageForURLRequest:request progress:nil success:^(NSURLRequest *request, NSURL *filePath) {
//            
//            [[FlyImageCache sharedInstance] addImageWithKey:key filename:[filePath lastPathComponent] completed:^(NSString *key, UIImage *image) {
//                _movieImage.image = image;
//                _bgImage.image = image;
//            }];
//            
//        } failed:^(NSURLRequest *request, NSError *error) {
//            NSLog(@"occur error = %@", error );
//        }];
//    }
//}
@end
