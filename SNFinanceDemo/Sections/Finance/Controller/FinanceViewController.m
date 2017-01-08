//
//  FinanceViewController.m
//  SNFinanceDemo
//
//  Created by apple on 17/1/2.
//  Copyright © 2017年 zhoujie. All rights reserved.
//

#import "FinanceViewController.h"
#import "Homepage01TableViewCell.h"
#import "Homepage01CollectionViewCell.h"
#import "Finance01TableViewCell.h"
#import "Finance02TableViewCell.h"
#import "Finance03TableViewCell.h"
#import "Finance04TableViewCell.h"
#import "Finance05TableViewCell.h"
#import "Finance06TableViewCell.h"
#import "Finance07TableViewCell.h"
#import "ZJCollectionPageView.h"

#define kFinanceHeaderHeight 140
#define kFinanceFooterHeight 45
#define kCollectionViewCellHeight 85

@interface FinanceViewController () <UITableViewDelegate, UITableViewDataSource, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UIView *headerView;
@property (nonatomic, strong) UITableView * tableView;

@property (nonatomic, copy) NSArray * collectionViewDataArray;

@end

@implementation FinanceViewController

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
								   @"title"  : @"零钱宝"},
								 @{@"picUrl" : @"2.png",
								   @"title"  : @"安心盈"},
								 @{@"picUrl" : @"3.png",
								   @"title"  : @"活动专区"},
								 @{@"picUrl" : @"4.png",
								   @"title"  : @"固收理财"},
								 @{@"picUrl" : @"5.png",
								   @"title"  : @"月添利"},
								 @{@"picUrl" : @"6.png",
								   @"title"  : @"变现贷"},
								 @{@"picUrl" : @"7.png",
								   @"title"  : @"基金"},
								 @{@"picUrl" : @"8.png",
								   @"title"  : @"更多"}];
	
}

#pragma mark -
#pragma mark UI
- (void)configUI {
	self.navigationItem.title = @"理财";
	self.automaticallyAdjustsScrollViewInsets = NO;
	
	[self createRightBarItem];
	[self.view addSubview:self.tableView];
	[self drawLine];
}

- (void)createRightBarItem {
	UILabel * rightLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 90, 44)];
	rightLabel.text = @"我的理财";
	rightLabel.adjustsFontSizeToFitWidth = YES;
	rightLabel.userInteractionEnabled = YES;
	rightLabel.textAlignment = NSTextAlignmentRight;
	rightLabel.font = [UIFont systemFontOfSize:15];
	rightLabel.textColor = [UIColor darkGrayColor];
	UITapGestureRecognizer * rightTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(myFinance)];
	[rightLabel addGestureRecognizer:rightTap];
	UIBarButtonItem * rightitem = [[UIBarButtonItem alloc]initWithCustomView:rightLabel];
	self.navigationItem.rightBarButtonItem = rightitem;
}

- (UIView *)headerView {
	if (!_headerView) {
		_headerView = [[UIView alloc] init];
		_headerView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, kFinanceHeaderHeight);
		_headerView.backgroundColor = [UIColor clearColor];
		
		UIImageView *imageView = [[UIImageView alloc] init];
		imageView.frame = _headerView.frame;
		imageView.image = [UIImage imageNamed:@"f_14.jpg"];
		[_headerView addSubview:imageView];
		
		ZJCollectionPageView *view = [[ZJCollectionPageView alloc] initWithDataArray:@[@"",@"",@""]];
		view.frame = _headerView.frame;
		[_headerView addSubview:view];
	}
	
	return _headerView;
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
		[_tableView registerNib:[UINib nibWithNibName:@"Finance03TableViewCell" bundle:nil] forCellReuseIdentifier:@"Finance03TableViewCell"];
		[_tableView registerNib:[UINib nibWithNibName:@"Finance04TableViewCell" bundle:nil] forCellReuseIdentifier:@"Finance04TableViewCell"];
		[_tableView registerNib:[UINib nibWithNibName:@"Finance05TableViewCell" bundle:nil] forCellReuseIdentifier:@"Finance05TableViewCell"];
		[_tableView registerNib:[UINib nibWithNibName:@"Finance06TableViewCell" bundle:nil] forCellReuseIdentifier:@"Finance06TableViewCell"];
		[_tableView registerNib:[UINib nibWithNibName:@"Finance07TableViewCell" bundle:nil] forCellReuseIdentifier:@"Finance07TableViewCell"];
		_tableView.tableHeaderView = self.headerView;
	}
	
	return _tableView;
}

- (void)drawLine {
	UIView *line1 = [[UIView alloc] init];
	line1.backgroundColor = [UIColor colorWithRed:214.0/255.0 green:214.0/255.0 blue:214.0/255.0 alpha:1];
	line1.frame = CGRectMake(0, kFinanceHeaderHeight+kCollectionViewCellHeight+5, [UIScreen mainScreen].bounds.size.width, 0.5);
	[self.tableView addSubview:line1];
	
	for (int i = 1; i < 4; i++) {
		UIView *line = [[UIView alloc] init];
		line.backgroundColor = [UIColor colorWithRed:214.0/255.0 green:214.0/255.0 blue:214.0/255.0 alpha:1];;
		line.frame = CGRectMake(i * ([UIScreen mainScreen].bounds.size.width)/4, kFinanceHeaderHeight, 0.5, 180);
		[self.tableView addSubview:line];
	}
}

#pragma mark -
#pragma mark UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	return 6;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	switch (section) {
		case 0:
		case 1:
			return 1;
		case 2:
			return 7;
		case 3:
			return 3;
		case 4:
			return 5;
		case 5:
			return 1;
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
			Finance01TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Finance01TableViewCell"];
			return cell;
		}
		case 2:{
			switch (indexPath.row) {
				case 0: {
					Finance02TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Finance02TableViewCell"];
					return cell;
				}
				case 1: {
					Finance03TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Finance03TableViewCell"];
					return cell;
				}
				case 2: {
					Finance03TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Finance03TableViewCell"];
					cell.rateLabel.text = @"4.8%";
					cell.info2Label.text = @"短期理财首选";
					cell.info3Label.text = @"月添利";
					cell.info4Label.text = @"1000元起购";
					return cell;
				}
				case 3: {
					Finance03TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Finance03TableViewCell"];
					cell.rateLabel.text = @"5.6%";
					cell.info2Label.text = @"气息快，期限约180天";
					cell.info3Label.text = @"安心盈";
					cell.info4Label.text = @"1000元起购";
					return cell;
				}
				case 4: {
					Finance03TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Finance03TableViewCell"];
					cell.rateLabel.text = @"4.0-6.0%";
					cell.infoLabel.text = @"约定年化收益率";
					cell.info2Label.text = @"100元起购，期限灵活";
					cell.info3Label.text = @"变现贷";
					cell.info4Label.text = @"保险公司提供本息保障";
					return cell;
				}
				case 5: {
					Finance03TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Finance03TableViewCell"];
					cell.rateLabel.text = @"11.34%";
					cell.infoLabel.text = @"近三个月涨跌幅";
					cell.info2Label.text = @"国泰生益灵活配置";
					cell.info3Label.text = @"基金理财";
					cell.info4Label.text = @"季收益亚军";
					return cell;
				}
				case 6: {
					Finance03TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Finance03TableViewCell"];
					cell.rateLabel.text = @"11.44%";
					cell.infoLabel.text = @"近三个月涨跌幅";
					cell.info2Label.text = @"金鹰稳健成长混合";
					cell.info3Label.text = @"基金理财";
					cell.info4Label.text = @"季收益冠军";
					return cell;
				}
				default:
					break;
			}
		}
		case 3:{
			switch (indexPath.row) {
				case 0: {
					Finance04TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Finance04TableViewCell"];
					return cell;
				}
				case 1: {
					Finance05TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Finance05TableViewCell"];
					return cell;
				}
				case 2: {
					Finance05TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Finance05TableViewCell"];
					cell.iconImageView.image = [UIImage imageNamed:@"f_06.png"];
					cell.titleLabel.text = @"萝卜章事件新进展 国海证券与涉事券商签订协议";
					cell.paperLabel.text = @"每日经济新闻";
					cell.amountLabel.text = @"1024";
					return cell;
				}
				default:
					break;
			}
		}
		case 4:{
			switch (indexPath.row) {
				case 0: {
					Finance04TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Finance04TableViewCell"];
					cell.titleLabel.text = @"帮助中心";
					return cell;
				}
				case 1: {
					Finance06TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Finance06TableViewCell"];
					return cell;
				}
				case 2: {
					Finance06TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Finance06TableViewCell"];
					cell.iconImageView.image = [UIImage imageNamed:@"f_08.png"];
					cell.titleLabel.text = @"零钱宝";
					cell.detailLabel.text = @"零钱宝是什么？";
					return cell;
				}
				case 3: {
					Finance06TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Finance06TableViewCell"];
					cell.iconImageView.image = [UIImage imageNamed:@"f_09.png"];
					cell.titleLabel.text = @"票据理财";
					cell.detailLabel.text = @"票据理财是什么？";
					return cell;
				}
				case 4: {
					Finance06TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Finance06TableViewCell"];
					cell.iconImageView.image = [UIImage imageNamed:@"f_10.png"];
					cell.titleLabel.text = @"保险理财";
					cell.detailLabel.text = @"保险理财是什么？";
					return cell;
				}
				default:
					break;
			}
		}
		case 5:{
			Finance07TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Finance07TableViewCell"];
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
			return 180;
		case 2:{
			switch (indexPath.row) {
				case 0:
					return 40;
					
				default:
					return 75;
			}
		}
			
		case 3:
			switch (indexPath.row) {
				case 0:
					return 44;
					
				default:
					return 75;
			}
		case 4:
			switch (indexPath.row) {
				case 0:
					return 44;
					
				default:
					return 70;
			}
		case 5:
			return 110;
			
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
	return 8;
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
	return CGSizeMake(([UIScreen mainScreen].bounds.size.width)/4, kCollectionViewCellHeight);
}

//根据不同区设置item的缩进量
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
	return UIEdgeInsetsMake(0, 0, 0,0);
}

@end
