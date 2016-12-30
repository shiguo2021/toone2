//
//  PrimaryExcessiveTableConller.m
//  toone
//
//  Created by shtoone on 16/12/22.
//  Copyright © 2016年 shtoone. All rights reserved.
//

#import "PrimaryExcessiveTableConller.h"
#import "EXPrimaryModel.h"
#import "EXPrimaryCell.h"
#import "NetworkTool.h"
#import "MyViewController.h"

@interface PrimaryExcessiveTableConller ()
@property(nonatomic, strong) NSArray *dataArr;


@end
@implementation PrimaryExcessiveTableConller

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUI];
    [self loadData];
}

-(void)setUI {

    self.tableView.separatorStyle = UITableViewCellSelectionStyleNone;
    self.tableView.rowHeight = 170;
    self.tableView.frame = CGRectMake(0, 95, Screen_w, Screen_h - 100);
    
    self.tableView.mj_header = [MJDIYHeader2 headerWithRefreshingTarget:self refreshingAction:@selector(loadData)];
    [self.tableView.mj_header beginRefreshing];
}

-(void)loadData {
    EXPrimaryModel *model = [[EXPrimaryModel alloc] init];
    
    __weak typeof(self)  weakSelf = self;
    [model exPrimaryBlock:^(NSMutableArray *result) {
        weakSelf.dataArr = result;

        [weakSelf.tableView reloadData];
        [weakSelf.tableView.mj_header endRefreshing];
    }];
    
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"EXPrimaryCell";
    UINib *nib = [UINib nibWithNibName:@"EXPrimaryCell" bundle:nil];
    [tableView registerNib:nib forCellReuseIdentifier:CellIdentifier];
    EXPrimaryCell *cell = (EXPrimaryCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    cell.EXPModel = _dataArr[indexPath.row];

    return cell;
}


-(NSArray *)dataArr {
    if (_dataArr == nil) {
        _dataArr = [NSArray array];
    }
    return _dataArr;
}


@end
