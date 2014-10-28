JNExpandableTableView
=====================

Easy Expandable TableView
![alt tag](http://s29.postimg.org/qn3ei2oyv/i_OS_Simulator_Screen_Shot_28_Oct_2014_18_04_41.png)

Installation
============

1. Copy JNExpandableTableView classes into your project.
2. Replace UITableView class with JNExpandableTableView


Delegates
============

To expand a cell just implement:
`
- (BOOL)tableView:(JNExpandableTableView *)tableView canExpand:(NSIndexPath *)indexPath
`
and return `YES`


DataSource
============

As there are no delegate interceptions you need to return the number of cells in this format:

`
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    JNExpandableTableViewNumberOfRows(20)
}
`

Considerations
============

The class is a subclass of UITableView and thus we are not replacing delegates and doing tricky interceptions.
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
