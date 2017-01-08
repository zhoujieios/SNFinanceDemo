//
//  Mine03TableViewCell.h
//  SNFinanceDemo
//
//  Created by apple on 17/1/1.
//  Copyright © 2017年 zhoujie. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Mine03TableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *summaryLabel;
@property (weak, nonatomic) IBOutlet UILabel *yesterdayLabel;

@end
