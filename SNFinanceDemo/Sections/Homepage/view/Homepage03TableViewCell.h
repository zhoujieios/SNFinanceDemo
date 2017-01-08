//
//  Homepage03TableViewCell.h
//  SNFinanceDemo
//
//  Created by apple on 16/12/25.
//  Copyright © 2016年 zhoujie. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Homepage03TableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *topImageView;
@property (weak, nonatomic) IBOutlet UIImageView *bottomImageView1;
@property (weak, nonatomic) IBOutlet UIImageView *bottomImageView2;
@property (weak, nonatomic) IBOutlet UIImageView *bottomImageView3;
@property (weak, nonatomic) IBOutlet UIImageView *bottomImageView4;

@property (weak, nonatomic) IBOutlet UIImageView *middleImageView1;
@property (weak, nonatomic) IBOutlet UIImageView *middleImageView2;
@property (weak, nonatomic) IBOutlet UIImageView *middleImageView3;
@property (weak, nonatomic) IBOutlet UIImageView *middleImageView4;


- (void)configView:(NSInteger)style;

@end
