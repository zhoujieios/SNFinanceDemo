//
//  NewsViewController.m
//  SNFinanceDemo
//
//  Created by apple on 17/1/7.
//  Copyright © 2017年 zhoujie. All rights reserved.
//

#import "NewsViewController.h"
#import "SGSegmentedControl.h"
#import "NewsChildViewController.h"

@interface NewsViewController () <UIScrollViewDelegate, SGSegmentedControlDelegate>

@property (nonatomic, strong) UIScrollView *mainScrollView;
@property (nonatomic, strong) SGSegmentedControl *SG;

@end

@implementation NewsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	
	[self setupChildViewController];
	[self configUI];
}

- (void)configUI {
	self.automaticallyAdjustsScrollViewInsets = NO;
	self.title = @"财富资讯";
	
	NSArray *title_arr = @[@"头条", @"独家", @"财富学堂", @"耳听八方"];
	
	// 创建底部滚动视图
	self.mainScrollView = [[UIScrollView alloc] init];
	_mainScrollView.frame = CGRectMake(0, 44, self.view.frame.size.width, self.view.frame.size.height);
	_mainScrollView.contentSize = CGSizeMake(self.view.frame.size.width * title_arr.count, 0);
	_mainScrollView.backgroundColor = [UIColor clearColor];
	// 开启分页
	_mainScrollView.pagingEnabled = YES;
	// 没有弹簧效果
	_mainScrollView.bounces = NO;
	// 隐藏水平滚动条
	_mainScrollView.showsHorizontalScrollIndicator = NO;
	// 设置代理
	_mainScrollView.delegate = self;
	[self.view addSubview:_mainScrollView];
	
	self.SG = [SGSegmentedControl segmentedControlWithFrame:CGRectMake(0, 64, self.view.frame.size.width, 44) delegate:self segmentedControlType:(SGSegmentedControlTypeStatic) titleArr:title_arr];
	self.SG.indicatorColor = [UIColor colorWithRed:0/255.0 green:122.0/255.0 blue:255.0/255.0 alpha:1];
	self.SG.titleColorStateSelected = [UIColor colorWithRed:0/255.0 green:122.0/255.0 blue:255.0/255.0 alpha:1];;
	[self.view addSubview:_SG];
	
	NewsChildViewController *oneVC = [[NewsChildViewController alloc] init];
	[self.mainScrollView addSubview:oneVC.view];
	[self addChildViewController:oneVC];
}

// 显示控制器的view
- (void)showVc:(NSInteger)index {
	
	CGFloat offsetX = index * self.view.frame.size.width;
	
	UIViewController *vc = self.childViewControllers[index];
	
	// 判断控制器的view有没有加载过,如果已经加载过,就不需要加载
	if (vc.isViewLoaded) return;
	
	[self.mainScrollView addSubview:vc.view];
	vc.view.frame = CGRectMake(offsetX, 0, self.view.frame.size.width, self.view.frame.size.height);
}

- (void)SGSegmentedControl:(SGSegmentedControl *)segmentedControl didSelectBtnAtIndex:(NSInteger)index {
	// 1 计算滚动的位置
	CGFloat offsetX = index * self.view.frame.size.width;
	self.mainScrollView.contentOffset = CGPointMake(offsetX, 0);
	
	// 2.给对应位置添加对应子控制器
	[self showVc:index];
}

// 添加所有子控制器
- (void)setupChildViewController {
	NewsChildViewController *oneVC = [[NewsChildViewController alloc] init];
	[self addChildViewController:oneVC];
	
	NewsChildViewController *twoVC = [[NewsChildViewController alloc] init];
	[self addChildViewController:twoVC];
	
	NewsChildViewController *threeVC = [[NewsChildViewController alloc] init];
	[self addChildViewController:threeVC];
	
	NewsChildViewController *fourVC = [[NewsChildViewController alloc] init];
	[self addChildViewController:fourVC];
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
	
	// 计算滚动到哪一页
	NSInteger index = scrollView.contentOffset.x / scrollView.frame.size.width;
	
	// 1.添加子控制器view
	[self showVc:index];
	
	// 2.把对应的标题选中
	[self.SG titleBtnSelectedWithScrollView:scrollView];
}

@end
