//
//  LifeViewController.m
//  SNFinanceDemo
//
//  Created by apple on 17/1/2.
//  Copyright © 2017年 zhoujie. All rights reserved.
//

#import "LifeViewController.h"
#import "Homepage01TableViewCell.h"
#import "Homepage01CollectionViewCell.h"
#import "Finance01TableViewCell.h"
#import "Finance02TableViewCell.h"
#import "Finance04TableViewCell.h"
#import "Life01TableViewCell.h"

@interface LifeViewController () <UITableViewDelegate, UITableViewDataSource, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UITableView * tableView;

@property (nonatomic, copy) NSArray * collectionViewDataArray;

@end

@implementation LifeViewController

#pragma mark -
#pragma mark View Life Cycle

- (void)viewDidLoad {
	[super viewDidLoad];
	
	[self configData];
	[self configUI];
}

#pragma mark -
#pragma mark DATA

- (void)configData {
	_collectionViewDataArray = @[@{@"picUrl" : @"1.png",
								   @"title"  : @"拼手气红包"},
								 @{@"picUrl" : @"2.png",
								   @"title"  : @"任性付"},
								 @{@"picUrl" : @"3.png",
								   @"title"  : @"众筹"},
								 @{@"picUrl" : @"4.png",
								   @"title"  : @"转账"},
								 @{@"picUrl" : @"5.png",
								   @"title"  : @"手机充值"},
								 @{@"picUrl" : @"6.png",
								   @"title"  : @"信用卡还款"},
								 @{@"picUrl" : @"7.png",
								   @"title"  : @"保险"},
								 @{@"picUrl" : @"8.png",
								   @"title"  : @"加油卡充值"},
								 @{@"picUrl" : @"9.png",
								   @"title"  : @"生活缴费"},
								 @{@"picUrl" : @"10.png",
								   @"title"  : @"苏宁帮客"},];
	
}

#pragma mark -
#pragma mark UI
- (void)configUI {
	self.navigationItem.title = @"生活";
	self.automaticallyAdjustsScrollViewInsets = NO;
	
	[self.view addSubview:self.tableView];
}

- (UITableView *)tableView {
	if (!_tableView) {
		_tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height-64-49) style:UITableViewStyleGrouped];
		_tableView.delegate = self;
		_tableView.dataSource = self;
		_tableView.showsVerticalScrollIndicator = NO;
		_tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
		[_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
		[_tableView registerNib:[UINib nibWithNibName:@"Homepage01TableViewCell" bundle:nil] forCellReuseIdentifier:@"Homepage01TableViewCell"];
		[_tableView registerNib:[UINib nibWithNibName:@"Finance01TableViewCell" bundle:nil] forCellReuseIdentifier:@"Finance01TableViewCell"];
		[_tableView registerNib:[UINib nibWithNibName:@"Finance02TableViewCell" bundle:nil] forCellReuseIdentifier:@"Finance02TableViewCell"];
		[_tableView registerNib:[UINib nibWithNibName:@"Finance04TableViewCell" bundle:nil] forCellReuseIdentifier:@"Finance04TableViewCell"];
		[_tableView registerNib:[UINib nibWithNibName:@"Life01TableViewCell" bundle:nil] forCellReuseIdentifier:@"Life01TableViewCell"];
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
		case 1:
			return 1;
		case 2:
			return 2;
		case 3:
			return 2;
		case 4:
			return 2;
		default:
			return 0;
	}
}

- (UITableViewCell *)tableView:(UITableView*)tableView cellForRowAtIndexPath:(NSIndexPath*)indexPath {
	switch (indexPath.section) {
		case 0: {
			Homepage01TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Homepage01TableViewCell"];
			cell.collectionView.delegate = self;
			cell.collectionView.dataSource = self;
			[cell.collectionView registerNib:[UINib nibWithNibName:@"Homepage01CollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"Homepage01CollectionViewCell"];
			return cell;
		}
		case 1:{
			Finance02TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Finance02TableViewCell"];
			cell.selectionStyle = UITableViewCellSelectionStyleNone;
			cell.photoImageView.image = [UIImage imageNamed:@"life01.png"];
			return cell;
		}
		case 2:{
			switch (indexPath.row) {
				case 0: {
					Finance04TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Finance04TableViewCell"];
					cell.titleLabel.text = @"保险";
					return cell;
				}
				case 1: {
					Finance01TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Finance01TableViewCell"];
					cell.left1Label.text = @"苏宁碎屏险";
					cell.left2Label.hidden = YES;
					cell.right1Label.text = @"家庭意外保障险";
					cell.right2Label.text = @"一份保单 全家无忧";
					cell.right3Label.text = @"家庭财产损失险";
					cell.right4Label.text = @"财产安心保障";
					
					cell.imageView1.image = [UIImage imageNamed:@"life02.png"];
					cell.imageView2.image = [UIImage imageNamed:@"life03.png"];
					cell.imageView3.image = [UIImage imageNamed:@"life04.png"];
					
					return cell;
				}
			}
		}
		case 3:{
			switch (indexPath.row) {
				case 0: {
					Finance04TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Finance04TableViewCell"];
					cell.titleLabel.text = @"热门活动";
					cell.moreLabel.hidden = YES;
					cell.arrowImageView.hidden = YES;
					return cell;
				}
				case 1: {
					Life01TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Life01TableViewCell"];
					cell.view1.hidden = NO;
					cell.view2.hidden = NO;
					cell.view3.hidden = YES;
					cell.view4.hidden = YES;
					return cell;
				}
			}
		}
		case 4:{
			switch (indexPath.row) {
				case 0: {
					Finance04TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Finance04TableViewCell"];
					cell.titleLabel.text = @"便民服务";
					cell.moreLabel.hidden = YES;
					cell.arrowImageView.hidden = YES;
					return cell;
				}
				case 1: {
					Life01TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Life01TableViewCell"];
					cell.view1.hidden = YES;
					cell.view2.hidden = YES;
					cell.view3.hidden = NO;
					cell.view4.hidden = NO;
					return cell;
				}
			}
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
			return 180;
		case 1:
			return  90;
		case 2: {
			switch (indexPath.row) {
				case 0:
					return 40;
				case 1:
					return 180;
				default:
					break;
			}
		}
		case 3:
		case 4: {
			switch (indexPath.row) {
				case 0:
					return 40;
				case 1:
					return 85;
				default:
					break;
			}
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

#pragma mark -
#pragma mark UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
	return 10;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
	Homepage01CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Homepage01CollectionViewCell" forIndexPath:indexPath];
	cell.imageView.image = [UIImage imageNamed:_collectionViewDataArray[indexPath.row][@"picUrl"]];
	cell.titleLabel.text = _collectionViewDataArray[indexPath.row][@"title"];
	return cell;
}

#pragma mark -
#pragma mark UICollectionViewDataDelegate

#pragma mark -
#pragma mark UICollectionViewDelegateFlowLayout

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
	return CGSizeMake(([UIScreen mainScreen].bounds.size.width)/5, 85);
}

//根据不同区设置item的缩进量
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
	return UIEdgeInsetsMake(0, 0, 0,0);
}

@end
