//
//  HomepageViewController.m
//  SNFinanceDemo
//
//  Created by apple on 16/12/25.
//  Copyright © 2016年 zhoujie. All rights reserved.
//

#import "HomepageViewController.h"
#import "HomepageHeaderView.h"
#import "Homepage02HeaderView.h"
#import "Homepage01TableViewCell.h"
#import "Homepage01CollectionViewCell.h"
#import "Homepage02TableViewCell.h"
#import "Homepage03TableViewCell.h"
#import "Homepage04TableViewCell.h"
#import "Homepage05TableViewCell.h"
#import "HomepageFooterView.h"

#define kHomepageHeaderHeight 64
#define kHomepage02HeaderHeight 100
#define kHomepageFooterHeight 45

@interface HomepageViewController () <UITableViewDelegate, UITableViewDataSource, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) HomepageHeaderView *header01;
@property (nonatomic, strong) Homepage02HeaderView *header02;
@property (nonatomic, strong) HomepageFooterView *footerView;
@property (nonatomic, strong) UITableView * tableView;

@property (nonatomic, copy) NSArray * collectionViewDataArray;
@property (nonatomic, assign) CGFloat oldOffset;

@end

@implementation HomepageViewController

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
	_oldOffset = 0;
	_collectionViewDataArray = @[@{@"picUrl" : @"1.png",
								   @"title"  : @"零钱宝"},
								 @{@"picUrl" : @"2.png",
								   @"title"  : @"任性付"},
								 @{@"picUrl" : @"3.png",
								   @"title"  : @"理财"},
								 @{@"picUrl" : @"4.png",
								   @"title"  : @"手机充值"},
								 @{@"picUrl" : @"5.png",
								   @"title"  : @"转账"},
								 @{@"picUrl" : @"6.png",
								   @"title"  : @"信用卡还款"},
								 @{@"picUrl" : @"7.png",
								   @"title"  : @"众筹"},
								 @{@"picUrl" : @"8.png",
								   @"title"  : @"保险"},
								 @{@"picUrl" : @"9.png",
								   @"title"  : @"基金"},
								 @{@"picUrl" : @"10.png",
								   @"title"  : @"全部"},];
	
}

#pragma mark -
#pragma mark UI
- (void)configUI {
	self.navigationController.navigationBarHidden = YES;
	
	[self createHeader];
	[self.view addSubview:self.tableView];
	
}

- (void)createHeader {
	UIView *view = [[UIView alloc] init];
	view.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, kHomepageHeaderHeight +kHomepage02HeaderHeight);
	view.backgroundColor = [UIColor colorWithRed:0/255.0 green:122.0/255.0 blue:255.0/255.0 alpha:1];
	
	_header01 = [[[NSBundle mainBundle] loadNibNamed:@"HomepageHeaderView" owner:self options:nil] firstObject];
	_header01.backgroundColor = [UIColor colorWithRed:0/255.0 green:122.0/255.0 blue:255.0/255.0 alpha:1];
	_header01.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, kHomepageHeaderHeight);
	
	_header02 = [[[NSBundle mainBundle] loadNibNamed:@"Homepage02HeaderView" owner:self options:nil] firstObject];
	_header02.backgroundColor = [UIColor colorWithRed:0/255.0 green:122.0/255.0 blue:255.0/255.0 alpha:1];
	_header02.frame = CGRectMake(0, kHomepageHeaderHeight, [UIScreen mainScreen].bounds.size.width, kHomepage02HeaderHeight);
	[self.view addSubview:_header02];
	[self.view addSubview:_header01];

	//[self.view addSubview:view];
}

- (HomepageFooterView *)footerView {
	if (!_footerView) {
		_footerView = [[[NSBundle mainBundle] loadNibNamed:@"HomepageFooterView" owner:self options:nil] firstObject];
		_footerView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, kHomepageFooterHeight);
	}
	
	return _footerView;
}

- (UITableView *)tableView {
	if (!_tableView) {
		_tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, kHomepageHeaderHeight+kHomepage02HeaderHeight, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height-kHomepageHeaderHeight-49) style:UITableViewStyleGrouped];
		_tableView.delegate = self;
		_tableView.dataSource = self;
		_tableView.showsVerticalScrollIndicator = NO;
		_tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
		[_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
		[_tableView registerNib:[UINib nibWithNibName:@"Homepage01TableViewCell" bundle:nil] forCellReuseIdentifier:@"Homepage01TableViewCell"];
		[_tableView registerNib:[UINib nibWithNibName:@"Homepage02TableViewCell" bundle:nil] forCellReuseIdentifier:@"Homepage02TableViewCell"];
		[_tableView registerNib:[UINib nibWithNibName:@"Homepage03TableViewCell" bundle:nil] forCellReuseIdentifier:@"Homepage03TableViewCell"];
		[_tableView registerNib:[UINib nibWithNibName:@"Homepage04TableViewCell" bundle:nil] forCellReuseIdentifier:@"Homepage04TableViewCell"];
		[_tableView registerNib:[UINib nibWithNibName:@"Homepage05TableViewCell" bundle:nil] forCellReuseIdentifier:@"Homepage05TableViewCell"];
		_tableView.tableFooterView = self.footerView;
	}
	
	return _tableView;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
	if (scrollView == _tableView) {
		CGRect frame = _tableView.frame;
		CGFloat offset = _tableView.contentOffset.y;
		CGFloat minus = frame.origin.y - offset;
		if (minus >= 64 && minus <= 164) {
			CGRect frame2 = _header02.frame;
			frame2.origin.y -= offset;
			_header02.frame = frame2;
			
			frame.origin.y -= offset;
			_tableView.frame = frame;
			_oldOffset = offset;
			[_tableView setContentOffset:CGPointMake(0, 0) animated:NO];
		}
	}
}

#pragma mark -
#pragma mark UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	return 7;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return 1;
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
			Homepage02TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Homepage02TableViewCell"];
			cell.selectionStyle = UITableViewCellSelectionStyleNone;
			cell.bannerView.localizationImageNamesGroup = @[@"banner01.png", @"banner02.png", @"banner03.jpg", @"banner04.jpg", @"banner05.jpg"];
			return cell;
		}
		case 2:{
			Homepage03TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Homepage03TableViewCell"];
			cell.selectionStyle = UITableViewCellSelectionStyleNone;
			[cell configView:indexPath.section - 1];
			return cell;
		}
		case 3:{
			Homepage03TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Homepage03TableViewCell"];
			cell.selectionStyle = UITableViewCellSelectionStyleNone;
			[cell configView:indexPath.section - 1];
			cell.topImageView.image = [UIImage imageNamed:@"floor4_0.png"];
			cell.middleImageView1.image = [UIImage imageNamed:@"floor4_1.png"];
			cell.middleImageView2.image = [UIImage imageNamed:@"floor4_2.png"];
			cell.bottomImageView1.image = [UIImage imageNamed:@"floor4_3.png"];
			cell.bottomImageView2.image = [UIImage imageNamed:@"floor4_4.png"];
			cell.bottomImageView3.image = [UIImage imageNamed:@"floor4_5.png"];
			cell.bottomImageView4.image = [UIImage imageNamed:@"floor4_6.png"];
			return cell;
		}
		case 4:{
			Homepage03TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Homepage03TableViewCell"];
			cell.selectionStyle = UITableViewCellSelectionStyleNone;
			[cell configView:indexPath.section - 1];
			cell.topImageView.image = [UIImage imageNamed:@"floor5_0.png"];
			cell.middleImageView1.image = [UIImage imageNamed:@"floor5_1.png"];
			cell.middleImageView2.image = [UIImage imageNamed:@"floor5_2.png"];
			cell.bottomImageView1.image = [UIImage imageNamed:@"floor5_3.png"];
			cell.bottomImageView2.image = [UIImage imageNamed:@"floor5_4.png"];
			cell.bottomImageView3.image = [UIImage imageNamed:@"floor5_5.png"];
			cell.bottomImageView4.image = [UIImage imageNamed:@"floor5_6.png"];
			return cell;
		}
		case 5:{
			Homepage04TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Homepage04TableViewCell"];
			return cell;
		}
		case 6:{
			Homepage05TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Homepage05TableViewCell"];
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
			return 180;
		case 1:
			return 90;
		case 2:
		case 3:
		case 4:
			return 320;
		case 5:
			return 160;
		case 6:
			return 225;
			
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
