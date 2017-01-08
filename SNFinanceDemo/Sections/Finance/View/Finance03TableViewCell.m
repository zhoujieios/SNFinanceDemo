//
//  Finance03TableViewCell.m
//  SNFinanceDemo
//
//  Created by apple on 17/1/2.
//  Copyright © 2017年 zhoujie. All rights reserved.
//

#import "Finance03TableViewCell.h"

@implementation Finance03TableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
	
	_info3Label.layer.borderWidth = 0.5;
	_info3Label.layer.borderColor = [UIColor colorWithRed:0/255.0 green:122.0/255.0 blue:255.0/255.0 alpha:1].CGColor;
	_info3Label.layer.cornerRadius = 3.0;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
