//
//  SLNewFeatureCell.m
//  WalletSL
//
//  Created by shicuf on 15/4/7.
//  Copyright (c) 2015年 ShengLan.tec. All rights reserved.
//

#import "SLNewFeatureCell.h"
#import "ViewController.h"
#import "UIView+SLAddition.h"
// RGB转换成UIColor
#define SLColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
#define SLColorRGBA(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:a]

@interface SLNewFeatureCell ()

@property (nonatomic, weak) UIImageView *imageView;
@property (nonatomic, weak) UIButton *startButton;

@end

@implementation SLNewFeatureCell

- (UIButton *)startButton
{
    if (_startButton == nil) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setBackgroundImage:[UIImage imageNamed:@"guideStart"] forState:UIControlStateNormal];
        [btn sizeToFit];
        btn.center = CGPointMake(self.frame.size.width * 0.5, self.frame.size.height * 0.88);
        [btn addTarget:self action:@selector(start) forControlEvents:UIControlEventTouchUpInside];
        _startButton = btn;
        [self addSubview:btn];
    }
    
    return _startButton;
}

- (UIImageView *)imageView
{
    if (_imageView == nil) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.bounds];
        [self addSubview:imageView];
        _imageView = imageView;
    }
    
    return _imageView;
}

- (void)setImageName:(NSString *)imageName
{
    _imageName = imageName;
    UIImage *image =  [UIImage imageNamed:imageName];
    self.imageView.image = image;
    
    self.imageView.y_ = 40;
    self.imageView.width_ = [UIScreen mainScreen].bounds.size.width;
    self.imageView.height_ = image.size.height * self.imageView.width_ / image.size.width;
    
    self.backgroundColor = SLColor(241, 241, 241);
}

- (void)setIndexPath:(NSIndexPath *)indexPath pageCount:(NSInteger)count
{
    if (indexPath.row == count - 1) {
        self.startButton.hidden = NO;
    } else {
        self.startButton.hidden = YES;
    }
}

- (void)start
{
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController *vc = sb.instantiateInitialViewController;
    [UIApplication sharedApplication].keyWindow.rootViewController = vc;
}

@end
