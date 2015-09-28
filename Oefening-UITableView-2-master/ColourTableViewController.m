
//
//  ColourTableViewController.m
//  Oefening-UITableView-2-master
//
//  Created by Jean Smits on 20/08/15.
//  Copyright (c) 2015 VDAB. All rights reserved.
//

#import "ColourTableViewController.h"
#import "ColourTableViewCell.h"
#import "OverViewTableViewController.h"



@interface ColourTableViewController ()
@property (strong, nonatomic) NSMutableArray *colours;



@end

@implementation ColourTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.colours = [[NSMutableArray alloc] init];
    [self getAllcolors];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.colours.count;
}

- (void)getAllcolors{
    float INCREMENT = 0.01;
    for (float hue = 0.0; hue < 1.0; hue += INCREMENT) {
        UIColor *color = [UIColor colorWithHue:hue
                                    saturation:1.0
                                    brightness:1.0
                                         alpha:1.0];
        [self.colours addObject:color];
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ColourTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Colour" forIndexPath:indexPath];
    [cell createCells:[self.colours objectAtIndex:indexPath.item]];
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.delegate myProtocolMethod:[self.colours objectAtIndex:indexPath.item]];
}

@end
