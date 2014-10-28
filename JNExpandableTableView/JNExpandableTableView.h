//
//  JNExpandableTableView.h
//  JNExpandableTableViewDemo
//
//  Created by Joao Nunes on 28/10/14.
//  Copyright (c) 2014 joao. All rights reserved.
//

#import <UIKit/UIKit.h>

@class JNExpandableTableView;


@protocol JNExpandableTableViewDataSource <NSObject, UITableViewDataSource>

- (BOOL)tableView:(JNExpandableTableView *)tableView canExpand:(NSIndexPath *)indexPath;

@end


@interface JNExpandableTableView : UITableView


@property (nonatomic, assign) id <JNExpandableTableViewDataSource> dataSource;


@property (nonatomic) NSIndexPath * expandedIndexPath;
@property (nonatomic ,readonly) NSIndexPath * expandedContentIndexPath;

@end
