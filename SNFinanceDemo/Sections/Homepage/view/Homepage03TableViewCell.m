//
//  Homepage03TableViewCell.m
//  SNFinanceDemo
//
//  Created by apple on 16/12/25.
//  Copyright © 2016年 zhoujie. All rights reserved.
//

#import "Homepage03TableViewCell.h"

@interface Homepage03TableViewCell ()

@property (weak, nonatomic) IBOutlet UIView *view1;
@property (weak, nonatomic) IBOutlet UIView *view2;
@property (weak, nonatomic) IBOutlet UIView *view3;
@property (weak, nonatomic) IBOutlet UIView *view4;
@property (weak, nonatomic) IBOutlet UIView *view5;
@property (weak, nonatomic) IBOutlet UIView *view6;


@end

@implementation Homepage03TableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)configView:(NSInteger)style {
	switch (style) {
		case 1: {
			_view1.hidden = NO;
			_view2.hidden = NO;
			_view3.hidden = YES;
			_view4.hidden = YES;
			_view5.hidden = YES;
			_view6.hidden = YES;
			break;
		}
		case 2:
		case 3: {
			_view1.hidden = YES;
			_view2.hidden = YES;
			_view3.hidden = NO;
			_view4.hidden = NO;
			_view5.hidden = YES;
			_view6.hidden = YES;
			break;
		}

		default:
			break;
	}
}

@end
