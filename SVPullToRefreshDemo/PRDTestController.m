//
//  PRDTestController.m
//  SVPullToRefreshDemo
//
//  Created by Brian Chapados on 5/10/12.
//

#import "PRDTestController.h"
#import "SVPullToRefresh.h"

@interface PRDTestController ()

@property (nonatomic, strong) NSMutableArray *data;

@end

@implementation PRDTestController

@synthesize data = _data;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        static const NSUInteger rowCount = 10;
        _data = [[NSMutableArray alloc] initWithCapacity:rowCount];
        for (NSUInteger i = 0; i < rowCount; ++i) {
            [_data addObject:[NSString stringWithFormat:@"Row %u", i]];
        }
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    UITableView __weak *tableView = self.tableView;
    [self.tableView addPullToRefreshWithActionHandler:^{
        [tableView.pullToRefreshView stopAnimating];
        [tableView reloadData];
    }];
    
    NSLog(@"%s | controller: %p | tableview: %p | pullToRefreshView: %p", __PRETTY_FUNCTION__, self, self.tableView, self.tableView.pullToRefreshView);
}

- (void)viewDidUnload
{
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _data.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if ( !cell ) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
    // Configure the cell...
    NSString *title = [_data objectAtIndex:indexPath.row];
    cell.textLabel.text = title;
    
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    PRDTestController *vc = [[PRDTestController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
