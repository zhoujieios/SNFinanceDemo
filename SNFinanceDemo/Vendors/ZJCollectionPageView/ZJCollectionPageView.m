//
//  ZJCollectionPageView.m
//  SNFinanceDemo
//
//  Created by apple on 17/1/7.
//  Copyright © 2017年 zhoujie. All rights reserved.
//

#import "ZJCollectionPageView.h"
#import "ZJPageCollectionViewCell.h"

@interface ZJCollectionPageView () <UICollectionViewDataSource,UICollectionViewDelegate>

@property (strong, nonatomic) UICollectionView *collectionView;
@property (strong, nonatomic) UIPageControl *pageControl;
@property (strong, nonatomic) NSArray *array;

@end

@implementation ZJCollectionPageView

- (instancetype)initWithDataArray:(NSArray *)array{
	self = [super init];
	if (self) {
		_array = [array copy];
		
		UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
		layout.minimumLineSpacing = 0;
		layout.minimumInteritemSpacing = 0;
		layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
		
		_collectionView = [[UICollectionView alloc]initWithFrame:self.frame collectionViewLayout:layout];
		_collectionView.dataSource = self;
		_collectionView.delegate = self;
		_collectionView.pagingEnabled = YES;
		_collectionView.backgroundColor = [UIColor clearColor];
		_collectionView.showsVerticalScrollIndicator = NO;
		_collectionView.showsHorizontalScrollIndicator = NO;
		[_collectionView registerNib:[UINib nibWithNibName:@"ZJPageCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"ZJPageCollectionViewCell"];
		[self addSubview:_collectionView];
		
		_pageControl = [[UIPageControl alloc]init];
		_pageControl.numberOfPages = _array.count;
		_pageControl.currentPage = 0;
		_pageControl.tintColor = [UIColor whiteColor];
		_pageControl.pageIndicatorTintColor = [UIColor grayColor];
		[self insertSubview:_pageControl atIndex:self.subviews.count];
		
		self.backgroundColor = [UIColor clearColor];
	}
	return self;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
	NSLog(@"_array.count = %ld", _array.count);
	return _array.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
	ZJPageCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ZJPageCollectionViewCell" forIndexPath:indexPath];
	switch (indexPath.row) {
		case 0: {
			cell.titleLabel.text = @"昨日收益(元)";
			break;
		}
		case 1: {
			cell.titleLabel.text = @"今日收益(元)";
			break;
		}
		case 2: {
			cell.titleLabel.text = @"累计收益(元)";
			break;
		}
			
		default:
			break;
	}
	return cell;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
	//当前停止的页面
	NSInteger offset = scrollView.contentOffset.x/scrollView.bounds.size.width;
	_pageControl.currentPage = offset % _array.count;
}


- (void)layoutSubviews{
	[super layoutSubviews];
	_pageControl.frame = CGRectMake(0, CGRectGetHeight(self.frame)-30, CGRectGetWidth(self.frame), 20);
	_collectionView.frame = self.bounds;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
	return collectionView.frame.size;
}

@end
