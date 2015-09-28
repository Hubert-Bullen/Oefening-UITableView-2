//
//  FontTableViewCell.m
//  Oefening-UITableView-2-master
//
//  Created by Jean Smits on 24/08/15.
//  Copyright (c) 2015 VDAB. All rights reserved.
//

#import "FontTableViewCell.h"
@interface FontTableViewCell()

@property (weak, nonatomic) IBOutlet UILabel *fontLabel;


@end
@implementation FontTableViewCell

- (void)awakeFromNib {

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

- (void) createCells:(NSString *)font{
    self.fontLabel.text = font;
    self.fontLabel.font = [UIFont fontWithName:font size:17.0];
}

@end
