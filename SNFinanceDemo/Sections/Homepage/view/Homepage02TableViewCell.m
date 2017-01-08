//
//  Homepage02TableViewCell.m
//  SNFinanceDemo
//
//  Created by apple on 17/1/7.
//  Copyright © 2017年 zhoujie. All rights reserved.
//

#import "Homepage02TableViewCell.h"

@implementation Homepage02TableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
	
	self.bannerView = [[SDCycleScrollView alloc] initWithFrame:self.frame];
	[self.contentView addSubview:self.bannerView];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
