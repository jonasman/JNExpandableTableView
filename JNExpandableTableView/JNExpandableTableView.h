//
//  JNExpandableTableView.h
//  JNExpandableTableViewDemo
//
//  Created by Joao Nunes on 28/10/14.
//  Copyright (c) 2014 joao. All rights reserved.
//

#import <UIKit/UIKit.h>

@class JNExpandableTableView;


// Macro to help calculating the number of rows
#define JNExpandableTableViewNumberOfRows(rows) \
BOOL expandedSection = (section == self.tableView.expandedIndexPath.section && self.tableView.expandedIndexPath); \
\
return rows + (expandedSection?1:0);


@protocol JNExpandableTableViewDataSource <NSObject, UITableViewDataSource>

- (BOOL)tableView:(JNExpandableTableView *)tableView canExpand:(NSIndexPath *)indexPath;

@end





@interface JNExpandableTableView : UITableView


@property (nonatomic, assign) id <JNExpandableTableViewDataSource> dataSource;


@property (nonatomic) NSIndexPath * expandedIndexPath; // Original expanded IndexPath
@property (nonatomic ,readonly) NSIndexPath * expandedContentIndexPath; // IndexPath holding the newly created expanded cell

@end
