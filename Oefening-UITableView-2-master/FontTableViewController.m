//
//  FontTableViewController.m
//  Oefening-UITableView-2-master
//
//  Created by Jean Smits on 24/08/15.
//  Copyright (c) 2015 VDAB. All rights reserved.
//

#import "FontTableViewController.h"
#import "FontTableViewCell.h"

@interface FontTableViewController ()
@property (strong, nonatomic) NSMutableDictionary *fontsWithFamilyName;
@property (strong, nonatomic) NSArray *fontFamilynames;
@property (assign, nonatomic) NSInteger number;
@property (weak, nonatomic) IBOutlet UISearchBar *search;


@end

@implementation FontTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.search.delegate = self;
    [self makeDictionary:@""];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    [self makeDictionary:searchText];
    [self.tableView reloadData];
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.fontFamilynames.count;

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return [[self fontsPerFamilyName:section]count];
 
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    FontTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Font" forIndexPath:indexPath];
        [cell createCells:[[self fontsPerFamilyName:indexPath.section] objectAtIndex:indexPath.row]];
    return cell;
}


- (NSArray *)fontsPerFamilyName: (NSInteger) sectionNumber{
    NSArray *fonts = [self.fontsWithFamilyName objectForKey:self.fontFamilynames[sectionNumber]];
    return fonts;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    if ([self.fontsWithFamilyName objectForKey:self.fontFamilynames[section]] == nil) {
        return nil;
    } else{
       return self.fontFamilynames[section];
    }
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.selectedFont = [[self fontsPerFamilyName:indexPath.section] objectAtIndex:indexPath.row];
    [self performSegueWithIdentifier:@"FontUnwindSegue" sender:self];
    
}

- (void) makeDictionary{
    for (NSString *fontName in self.fontFamilynames) {
        [self.fontsWithFamilyName setObject:[UIFont fontNamesForFamilyName:fontName] forKey:fontName];
    }
}

- (void) makeDictionary: (NSString *)searchText
{
    self.fontFamilynames = [UIFont familyNames];
    //self.fontFamilynames moeten we niet initieren want hij word direct gelijkgesteld aan een array door de familyNames functie.
    self.fontsWithFamilyName = [[NSMutableDictionary alloc] init];
    
    for (NSString *fontName in self.fontFamilynames) {
        if ([fontName containsString:searchText] || [searchText isEqualToString:@""]) {
            [self.fontsWithFamilyName setObject:[UIFont fontNamesForFamilyName:fontName] forKey:fontName];
        }
        
    }
}

@end
