//
//  ColourTableViewCell.m
//  Oefening-UITableView-2-master
//
//  Created by Jean Smits on 20/08/15.
//  Copyright (c) 2015 VDAB. All rights reserved.
//

#import "ColourTableViewCell.h"

@interface ColourTableViewCell ()
@property (weak, nonatomic) IBOutlet UIView *content;

@end

@implementation ColourTableViewCell

- (void)awakeFromNib {

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

- (void) createCells:(UIColor *)colour{
    self.content.backgroundColor = colour;
    
}


@end
