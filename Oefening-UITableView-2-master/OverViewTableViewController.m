//
//  OverViewTableViewController.m
//  Oefening-UITableView-2-master
//
//  Created by Jean Smits on 20/08/15.
//  Copyright (c) 2015 VDAB. All rights reserved.
//

#import "OverViewTableViewController.h"
#import "ColourTableViewController.h"
#import "FontTableViewController.h"

@interface OverViewTableViewController () <myDelegate>

@property (strong, nonatomic) UIColor *receivedColour;
@property (weak, nonatomic) IBOutlet UILabel *changeColour;
@property (weak, nonatomic) IBOutlet UILabel *changeFont;

@end

@implementation OverViewTableViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.paneColour.backgroundColor = self.receivedColour;
    self.paneColour.layer.cornerRadius = self.paneColour.frame.size.width /2;
    self.paneColour.layer.masksToBounds = YES;

}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.paneColour.backgroundColor = self.receivedColour;
}

- (void) viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    self.paneColour.backgroundColor = self.receivedColour;

} // lifecycle methodes! Als we niet bij beiden doen is er tijdje waar er geen kleur is.

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(IBAction)unwindClicked:(UIStoryboardSegue *)segue{
    if ([segue.identifier isEqualToString:@"FontUnwindSegue"]) {
        FontTableViewController *vc = (FontTableViewController *)segue.sourceViewController;
        self.changeColour.font = [UIFont fontWithName:vc.selectedFont size:17.0];
        self.changeFont.font = [UIFont fontWithName:vc.selectedFont size:17.0];
    }
    // We hadden ook hier de kleur kunnen doorgeve ipv met delegates te werken, maar dan is er een veel sterkere link, een delegate is opener.
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

- (void)myProtocolMethod:(UIColor *)pickedColour{
    self.receivedColour = pickedColour;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44.0;
    // Dit is "dynamisch" omdat we hier per rij echt de hoogte kunnen veranderen, statisch is de property op tableView aanroepen en vastpinnen op een waarde, omdat deze dan geld voor altijd alle rows.
    
}

#pragma mark - Navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"ColourSegue"]){
        ColourTableViewController *viewController = segue.destinationViewController;
        viewController.delegate = self;
    }
}
@end
