//
//  Finance05TableViewCell.h
//  SNFinanceDemo
//
//  Created by apple on 17/1/2.
//  Copyright © 2017年 zhoujie. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Finance05TableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *paperLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *amountLabel;

@end
