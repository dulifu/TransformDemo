//
//  ViewController.m
//  TransformDemo
//
//  Created by dulf on 2019/1/17.
//  Copyright © 2019 galanz. All rights reserved.
//

//参考链接 https://www.jianshu.com/p/6b799eeee8dd

#import "ViewController.h"
#import "Masonry.h"

@interface ViewController ()

@property (nonatomic, strong) UIView *centerView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //UISegmentedControl
    UISegmentedControl *seg = [[UISegmentedControl alloc] initWithItems:[NSArray arrayWithObjects:@"还原", @"平移", @"缩放", @"旋转", nil]];
    [seg addTarget:self action:@selector(segmentAction:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:seg];
    
    _centerView = [[UIView alloc] init];
    _centerView.backgroundColor = [UIColor redColor];
    [self.view addSubview:_centerView];
    
    //添加约束
    [_centerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(self.view);
        make.width.height.mas_equalTo(100);
    }];
    
    CGFloat statusHeight = [UIApplication sharedApplication].statusBarFrame.size.height;
    [seg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(statusHeight);
        make.centerX.mas_equalTo(self.view);
        make.width.mas_equalTo(200);
        make.height.mas_equalTo(50);
    }];

}

- (void)segmentAction:(UISegmentedControl *)segmentControl {
    switch (segmentControl.selectedSegmentIndex) {
        case 0:
            self.centerView.transform = CGAffineTransformIdentity;
            break;
        case 1:
        {
            self.centerView.transform = CGAffineTransformIdentity;
            [UIView animateWithDuration:0.5 animations:^{
                self.centerView.transform = CGAffineTransformMakeTranslation(50, 50);
            }];
        }
            break;
        case 2:
        {
            self.centerView.transform = CGAffineTransformIdentity;
            [UIView animateWithDuration:0.5 animations:^{
                self.centerView.transform = CGAffineTransformMakeScale(0.5, 0.5);
            }];
        }
            break;

        default:
        {
            self.centerView.transform = CGAffineTransformIdentity;
            [UIView animateWithDuration:0.5 animations:^{
                self.centerView.transform = CGAffineTransformMakeRotation(M_PI_4);
            }];
        }
            break;
    }
}


@end
