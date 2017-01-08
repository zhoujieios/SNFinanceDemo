//
//  NewsChildViewController.m
//  SNFinanceDemo
//
//  Created by apple on 17/1/7.
//  Copyright © 2017年 zhoujie. All rights reserved.
//

#import "NewsChildViewController.h"
#import "NewsTableViewCell.h"

@interface NewsChildViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView * tableView;

@end

@implementation NewsChildViewController

#pragma mark -
#pragma mark View Life Cycle

- (void)viewDidLoad {
	[super viewDidLoad];
	
	[self configUI];
}

#pragma mark -
#pragma mark UI
- (void)configUI {
	self.navigationController.navigationBarHidden = NO;
	self.automaticallyAdjustsScrollViewInsets = NO;
	
	[self.view addSubview:self.tableView];
	
}

- (UITableView *)tableView {
	if (!_tableView) {
		_tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height-64-49) style:UITableViewStylePlain];
		_tableView.delegate = self;
		_tableView.dataSource = self;
		_tableView.showsVerticalScrollIndicator = NO;
		[_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
		[_tableView registerNib:[UINib nibWithNibName:@"NewsTableViewCell" bundle:nil] forCellReuseIdentifier:@"NewsTableViewCell"];
	}
	
	return _tableView;
}

#pragma mark -
#pragma mark UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return 10;
}

- (UITableViewCell *)tableView:(UITableView*)tableView cellForRowAtIndexPath:(NSIndexPath*)indexPath {
	NewsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"NewsTableViewCell"];
	return cell;
}

#pragma mark -
#pragma mark UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
	return 110;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	
}

@end
