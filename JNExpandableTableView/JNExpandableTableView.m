//
//  JNExpandableTableView.m
//  JNExpandableTableViewDemo
//
//  Created by Joao Nunes on 28/10/14.
//  Copyright (c) 2014 joao. All rights reserved.
//

#import "JNExpandableTableView.h"

@interface JNExpandableTableView()


@end

@implementation JNExpandableTableView
{
    struct {
        unsigned tableViewCanExpand : 1;
    } _expandedDataSourceHas;
    
}


#pragma mark Public

- (id)dataSource
{
    return [super dataSource];
}
- (void)setDataSource:(id<JNExpandableTableViewDataSource>)dataSource
{
    [super setDataSource:dataSource];
    
    _expandedDataSourceHas.tableViewCanExpand = [dataSource respondsToSelector:@selector(tableView:canExpand:)];
}

- (NSIndexPath *)expandedContentIndexPath
{
    if (!self.expandedIndexPath)
        return nil;
    
    return [NSIndexPath indexPathForRow:self.expandedIndexPath.row + 1 inSection:self.expandedIndexPath.section];
}


#pragma mark Expand/collapse logic

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    
    UITouch *touch = [touches anyObject];
    const CGPoint location = [touch locationInView:self];

    
    NSIndexPath * iPath = [self indexPathForRowAtPoint:location];
    
    
    if ([iPath isEqual:self.expandedIndexPath])
    {
        [self collapseCell:iPath];
    }
    else if (![iPath isEqual:self.expandedContentIndexPath])
    {
        [self beginUpdates];
        
        NSIndexPath * adjustedIpath = [self adjustedIndexPath:iPath];
        
        BOOL canExpand =  _expandedDataSourceHas.tableViewCanExpand? [self.dataSource tableView:self canExpand:adjustedIpath] : NO;
        
        if ([self isAnyCellExpanded])
            [self collapseCell:self.expandedIndexPath];
        
        if (canExpand)
            [self expandCell:adjustedIpath];
        
        [self endUpdates];
        
        if (canExpand)
            [self scrollToRowAtIndexPath:self.expandedContentIndexPath atScrollPosition:UITableViewScrollPositionNone animated:YES];
    }
    
    [super touchesEnded:touches withEvent:event];
}

- (BOOL)isAnyCellExpanded
{
    return self.expandedIndexPath != nil;
}

- (NSIndexPath *)adjustedIndexPath:(NSIndexPath *)indexPath
{
    if ([self isAnyCellExpanded])
    {
        
        if (self.expandedIndexPath.section != indexPath.section)
            return indexPath;
        
        else
        {
        
            // index: 0
            // index: 1
            // expanded: 2
            // index: 3
            
            
            if (indexPath.row <= self.expandedIndexPath.row)
                return indexPath;
            else //(indexPath.row > self.expandedIndexPath.row)
                return [NSIndexPath indexPathForRow:indexPath.row - 1 inSection:indexPath.section];
        }
        
    }
    else
        return indexPath;
}

- (void)expandCell:(NSIndexPath *)indexPath
{
    NSIndexPath * expandedIndexPath = [NSIndexPath indexPathForRow:indexPath.row + 1 inSection:indexPath.section];
    
    self.expandedIndexPath = indexPath;
    [self insertRowsAtIndexPaths:@[expandedIndexPath]
                          withRowAnimation:UITableViewRowAnimationFade];
    
}
- (void)collapseCell:(NSIndexPath *)indexPath
{
    NSIndexPath * expandedIndexPath = [NSIndexPath indexPathForRow:indexPath.row + 1 inSection:indexPath.section];
    self.expandedIndexPath = nil;
   
    [self deleteRowsAtIndexPaths:@[expandedIndexPath] withRowAnimation:UITableViewRowAnimationFade];
    
}

- (void)reloadData
{
    self.expandedIndexPath = nil;
    
    [super reloadData];
}

@end
