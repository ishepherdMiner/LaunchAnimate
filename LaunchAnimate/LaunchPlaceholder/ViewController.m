//
//  ViewController.m
//  LaunchPlaceholder
//
//  Created by Jason on 19/01/2017.
//  Copyright © 2017 Jason. All rights reserved.
//

#import "ViewController.h"
#import "UIImageView+WebCache.h"
@interface ViewController ()

@property (nonatomic,strong) UIImageView *splashImgView;
@property (nonatomic,strong) UIImageView *adImgView;

@property (nonatomic,strong) UIImageView *avatorImgView;

@property (nonatomic,strong) UIView *splashView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.splashView];
    
    // 忽略有广告时状态栏需要隐藏再出现
    BOOL hasAd = arc4random() % 2 == 1 ? true : false;
    
    if (hasAd) {
        // - 可以把下一张广告图也请求下来,实现预加载,看上去效果会比较好
        [self.adImgView sd_setImageWithURL:[NSURL URLWithString:@"https://ooo.0o0.ooo/2017/01/20/58821a46b366e.png"]];
        [self.splashView addSubview:self.adImgView];
        [self.splashView addSubview:self.splashImgView];
        
        [UIView animateWithDuration:2.5 delay:0.5 options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
            self.splashView.alpha = 0.0;
        } completion:^(BOOL finished) {
            [self.splashView removeFromSuperview];
        }];
        
    }else {
        
        [self.splashView addSubview:self.avatorImgView];
        
        [UIView animateWithDuration:1.5 animations:^{
            self.avatorImgView.transform = CGAffineTransformMakeTranslation(0, -60);
        } completion:^(BOOL finished) {
            [self.splashView removeFromSuperview];
        }];
    }
    
    // - 显示控制器页面逻辑...
}

- (UIImageView *)splashImgView {
    if (_splashImgView == nil) {
        _splashImgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Default_splashscreen_logo_2017"]];
        _splashImgView.center = CGPointMake([UIScreen mainScreen].bounds.size.width * 0.5, [UIScreen mainScreen].bounds.size.height - 62);
    }
    return _splashImgView;
}

- (UIImageView *)avatorImgView {
    if (_avatorImgView == nil) {
        _avatorImgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"avator"]];
        CGRect frame = _avatorImgView.frame;
        frame.size.width = 60;
        frame.size.height = 60;
        _avatorImgView.frame = frame;
        _avatorImgView.center = CGPointMake([UIScreen mainScreen].bounds.size.width * 0.5, 180);
    }
    return _avatorImgView;
}

- (UIImageView *)adImgView {
    if (_adImgView == nil) {
        _adImgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 120)];
    }
    return _adImgView;
}

- (UIView *)splashView {
    if (_splashView == nil) {
        _splashView = [[UIView alloc] initWithFrame:self.view.bounds];
    }
    return _splashView;
}

- (BOOL)prefersStatusBarHidden {
    return false;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
