//
//  ViewController.m
//  JNExpandableTableViewDemo
//
//  Created by Joao Nunes on 28/10/14.
//  Copyright (c) 2014 joao. All rights reserved.
//

#import "ViewController.h"
#import "JNExpandableTableView.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet JNExpandableTableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


#pragma mark - UITableViewDataSource

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([indexPath isEqual:self.tableView.expandedContentIndexPath])
    {
        return 100.0f;
    }
    else
        return 44.0f;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2 + (self.tableView.expandedIndexPath?1:0);
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if ([self.tableView.expandedContentIndexPath isEqual:indexPath])
    {
        static NSString *CellIdentifier = @"expandedCell";
        
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        
        //cell.textLabel.text = [NSString stringWithFormat:@"Index: %ld",(long)indexPath.row];
        //cell.detailTextLabel.text = @"Expanded";
        
        return cell;

    }
    
    else
    {
        static NSString *CellIdentifier = @"Cell";
        
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        
        cell.textLabel.text = [NSString stringWithFormat:@"Index: %ld",(long)indexPath.row];
        
        return cell;
    }
}
#pragma mark JNExpandableTableView DataSource
- (BOOL)tableView:(JNExpandableTableView *)tableView canExpand:(NSIndexPath *)indexPath
{
    return YES;
}

@end
