[![JNExpandableTableView](https://img.shields.io/cocoapods/v/JNExpandableTableView.svg)]()
JNExpandableTableView
=====================

Easy to use Expandable TableView with animated insertion and removal.
The code is inspired by Apple's example DateCell

![alt tag](http://s29.postimg.org/qn3ei2oyv/i_OS_Simulator_Screen_Shot_28_Oct_2014_18_04_41.png)

Installation
============

####Manual

Copy JNExpandableTableView classe into your project.

####CocoaPods
```ruby
	pod 'JNExpandableTableView'
```

Usage
============

Replace your UITableView classes with JNExpandableTableView

Delegates
============

To make a cell expandable just implement:
```objective-c
- (BOOL)tableView:(JNExpandableTableView *)tableView canExpand:(NSIndexPath *)indexPath
{
    return YES;
}
```

DataSource
============

As there are no delegate interceptions you need to return the number of cells in this format:

```objective-c
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return JNExpandableTableViewNumberOfRowsInSection((JNExpandableTableView *)tableView,section,20);
}
```

To return an expanded Cell, check the indexPath and return the cell you need:
```objective-c
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if ([self.tableView.expandedContentIndexPath isEqual:indexPath])
    {
        static NSString *CellIdentifier = @"expandedCell";
        
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        
        return cell;

    }
    
    else
    {
        NSIndexPath * adjustedIndexPath = [self.tableView adjustedIndexPathFromTable:indexPath];
        
        static NSString *cellIdentifier = @"Cell";
        
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        
        cell.textLabel.text = [NSString stringWithFormat:@"Index: %ld",(long)adjustedIndexPath.row];
        
        return cell;
    }
}
```

Considerations
============

JNExpandableTableView is a subclass of UITableView and thus we are not replacing delegates and doing tricky interceptions.
That is why you need to help this class in some datasource calls.


Licence
============
        
The MIT License (MIT)

Copyright (c) 2014 João Nunes

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal in
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
the Software, and to permit persons to whom the Software is furnished to do so,
subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
