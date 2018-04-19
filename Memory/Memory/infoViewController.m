//
//  infoViewController.m
//  Memory
//
//  Created by yanhe on 2018/4/19.
//  Copyright © 2018年 yanhe. All rights reserved.
//

#import "infoViewController.h"

@interface infoViewController ()<UIScrollViewDelegate>
@property(nonatomic ,weak)UIImageView *imageView;
@property(nonatomic ,weak)UIScrollView *scrollView;
@property(nonatomic, strong)UIImage *image;
@end

@implementation infoViewController
-(instancetype)initWithImage:(UIImage *)image{
    if (self=[super init]) {
        self.image = image;
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self setUpView];
}

-(void)setUpView{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeInfoDark];
    btn.frame = CGRectMake(10, 10, 60, 40);
    [btn addTarget:self action:@selector(cancle) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 50, self.view.bounds.size.width, self.view.bounds.size.height-50)];
    scrollView.delegate = self;
    scrollView.minimumZoomScale = 0.5;
    scrollView.maximumZoomScale = 2.0;
    [scrollView setZoomScale:1.0 animated:NO];
    self.scrollView = scrollView;
    [self.view addSubview:scrollView];
    UIImageView *imageV = [[UIImageView alloc]initWithFrame:CGRectMake(0, 50, self.view.bounds.size.width, self.view.bounds.size.height-50)];
    self.imageView = imageV;
    imageV.image=self.image;
    scrollView.contentSize = CGSizeMake(imageV.frame.size.width*2, imageV.frame.size.height*2);
   
    [self.scrollView addSubview:imageV];
}

- (nullable UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView; {
   return   self.imageView;
}
-(void)cancle{
    [self dismissViewControllerAnimated:NO completion:nil];
}

@end
