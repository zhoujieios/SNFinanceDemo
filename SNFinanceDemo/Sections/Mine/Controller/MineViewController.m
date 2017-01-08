//
//  MineViewController.m
//  SNFinanceDemo
//
//  Created by apple on 17/1/1.
//  Copyright © 2017年 zhoujie. All rights reserved.
//

#import "MineViewController.h"
#import "Mine01TableViewCell.h"
#import "Mine02TableViewCell.h"
#import "Mine03TableViewCell.h"
#import "Mine04TableViewCell.h"

@interface MineViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView * tableView;

@end

@implementation MineViewController

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
	self.navigationItem.title = @"周杰";
	
	[self.view addSubview:self.tableView];
	
}

- (UITableView *)tableView {
	if (!_tableView) {
		_tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height-64-49) style:UITableViewStyleGrouped];
		_tableView.delegate = self;
		_tableView.dataSource = self;
		_tableView.showsVerticalScrollIndicator = NO;
		[_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
		[_tableView registerNib:[UINib nibWithNibName:@"Mine01TableViewCell" bundle:nil] forCellReuseIdentifier:@"Mine01TableViewCell"];
		[_tableView registerNib:[UINib nibWithNibName:@"Mine02TableViewCell" bundle:nil] forCellReuseIdentifier:@"Mine02TableViewCell"];
		[_tableView registerNib:[UINib nibWithNibName:@"Mine03TableViewCell" bundle:nil] forCellReuseIdentifier:@"Mine03TableViewCell"];
		[_tableView registerNib:[UINib nibWithNibName:@"Mine04TableViewCell" bundle:nil] forCellReuseIdentifier:@"Mine04TableViewCell"];
	}
	
	return _tableView;
}

#pragma mark -
#pragma mark UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	return 5;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	switch (section) {
		case 0:
			return 1;
		case 1:
			return 6;
		case 2:
		case 3:
		case 4:
			return 1;
				
		default:
			return 0;
	}
}

- (UITableViewCell *)tableView:(UITableView*)tableView cellForRowAtIndexPath:(NSIndexPath*)indexPath {
	switch (indexPath.section) {
		case 0: {
			Mine01TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Mine01TableViewCell"];
			return cell;
		}
		case 1: {
			switch (indexPath.row) {
				case 0: {
					Mine02TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Mine02TableViewCell"];
					return cell;
				}
				case 1: {
					Mine03TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Mine03TableViewCell"];
					return cell;
				}
				case 2: {
					Mine03TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Mine03TableViewCell"];
					cell.iconImageView.image = [UIImage imageNamed:@"2.png"];
					cell.titleLabel.text = @"零钱宝";
					cell.summaryLabel.text = @"0.00";
					cell.yesterdayLabel.text = @"昨日收益 0.00";
					return cell;
				}
				case 3: {
					Mine03TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Mine03TableViewCell"];
					cell.iconImageView.image = [UIImage imageNamed:@"3.png"];
					cell.titleLabel.text = @"定期理财";
					cell.summaryLabel.text = @"0.00";
					cell.yesterdayLabel.text = @"昨日收益 0.00";
					return cell;
				}
				case 4: {
					Mine03TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Mine03TableViewCell"];
					cell.iconImageView.image = [UIImage imageNamed:@"4.png"];
					cell.titleLabel.text = @"基金";
					cell.summaryLabel.text = @"0.00";
					cell.yesterdayLabel.text = @"昨日收益 0.00";
					return cell;
				}
				case 5: {
					Mine03TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Mine03TableViewCell"];
					cell.iconImageView.image = [UIImage imageNamed:@"5.png"];
					cell.titleLabel.text = @"众筹";
					cell.summaryLabel.text = @"吃喝玩乐大消费";
					cell.yesterdayLabel.text = @"查看收益";
					return cell;
				}
					
				default:
					break;
			}
		}
		case 2:{
			Mine04TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Mine04TableViewCell"];
			return cell;
		}
		case 3:{
			Mine04TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Mine04TableViewCell"];
			cell.iconImageView.image = [UIImage imageNamed:@"6.png"];
			cell.titleLabel.text = @"保险";
			cell.detailLabel.text = @"0张保单";
			return cell;
		}
		case 4:{
			Mine04TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Mine04TableViewCell"];
			cell.iconImageView.image = [UIImage imageNamed:@"7.png"];
			cell.titleLabel.text = @"火车票";
			cell.detailLabel.text = @"简单方便 想go就购";
			return cell;
			
		}
			
		default: {
			UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
			return cell;
		}
	}
}

#pragma mark -
#pragma mark UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
	switch (indexPath.section) {
		case 0:
			return 110;
		case 1: {
			if (indexPath.row == 0) {
				return  95;
			}
			return 60;
		}
			
		default:
			return 60;
	}
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
	return 0.1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
	return 10;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
	UIView* view = [[UIView alloc] init];
	view.backgroundColor = [UIColor colorWithRed:238/255.0 green:238/255.0 blue:238/255.0 alpha:1];
	return view;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	
}

@end
