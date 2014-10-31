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
#define JNExpandableTableViewNumberOfRowsInSection(tableView,rows) \
rows + (section == ((JNExpandableTableView *)tableView).expandedIndexPath.section && ((JNExpandableTableView *)tableView).expandedIndexPath?1:0)


@protocol JNExpandableTableViewDataSource <NSObject, UITableViewDataSource>


- (NSInteger)tableView:(JNExpandableTableView *)tableView numberOfRowsInSection:(NSInteger)section;



- (BOOL)tableView:(JNExpandableTableView *)tableView canExpand:(NSIndexPath *)indexPath;

@end



@protocol JNExpandableTableViewDelegate <NSObject, UITableViewDelegate>

@optional
- (void)tableView:(JNExpandableTableView *)tableView willExpand:(NSIndexPath *)indexPath;
- (void)tableView:(JNExpandableTableView *)tableView willCollapse:(NSIndexPath *)indexPath;

@end



@interface JNExpandableTableView : UITableView


@property (nonatomic, assign) id <JNExpandableTableViewDataSource> dataSource;
@property (nonatomic, assign) id <JNExpandableTableViewDelegate> delegate;


@property (nonatomic) NSIndexPath * expandedIndexPath; // Original expanded IndexPath
@property (nonatomic ,readonly) NSIndexPath * expandedContentIndexPath; // IndexPath holding the newly created expanded cell

- (NSIndexPath *)adjustedIndexPath:(NSIndexPath *)indexPath;

@end
