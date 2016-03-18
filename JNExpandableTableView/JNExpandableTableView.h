//
//  JNExpandableTableView.h
//  JNExpandableTableViewDemo
//
//  Created by Joao Nunes on 28/10/14.
//  Copyright (c) 2014 joao. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class JNExpandableTableView;


// Function to help calculating the number of rows
extern NSInteger JNExpandableTableViewNumberOfRowsInSection(JNExpandableTableView * tableView, NSInteger section, NSInteger rows);


@protocol JNExpandableTableViewDataSource <NSObject, UITableViewDataSource>

- (BOOL)tableView:(JNExpandableTableView *)tableView canExpand:(NSIndexPath *)indexPath;

@end



@protocol JNExpandableTableViewDelegate <NSObject, UITableViewDelegate>

@optional
- (void)tableView:(JNExpandableTableView *)tableView willExpand:(NSIndexPath *)indexPath;
- (void)tableView:(JNExpandableTableView *)tableView willCollapse:(NSIndexPath *)indexPath;

@end



@interface JNExpandableTableView : UITableView


@property (nonatomic, weak, nullable) id <JNExpandableTableViewDataSource> dataSource;
@property (nonatomic, weak, nullable) id <JNExpandableTableViewDelegate> delegate;


@property (nonatomic, nullable)  NSIndexPath * expandedIndexPath; // IndexPath of the expanded cell
@property (nonatomic, readonly, nullable) NSIndexPath * expandedContentIndexPath; // IndexPath holding the newly created expanded cell

- (NSIndexPath *)adjustedIndexPathFromTable:(NSIndexPath *)indexPath; // returns an adjusted indexPath that the table gave to the delegate/datasource
- (NSIndexPath *)adjustedIndexPathFromDelegate:(NSIndexPath *)indexPath; // returns an adjusted indexPath that the delegate/datasource gave to the table


@end

NS_ASSUME_NONNULL_END