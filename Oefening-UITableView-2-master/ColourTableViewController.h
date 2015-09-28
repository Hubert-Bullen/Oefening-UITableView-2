//
//  ColourTableViewController.h
//  Oefening-UITableView-2-master
//
//  Created by Jean Smits on 20/08/15.
//  Copyright (c) 2015 VDAB. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol myDelegate 

- (void)myProtocolMethod: (UIColor *) pickedColour;

@end

@interface ColourTableViewController : UITableViewController

@property (weak, nonatomic) id<myDelegate> delegate;

@end
