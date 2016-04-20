//
//  CHCommentaryController.m
//  CommentaryModule
//
//  Created by Chausson on 16/4/19.
//  Copyright © 2016年 Chausson. All rights reserved.
//

#import "CHCommentaryController.h"
#import "CHCommentaryTableView.h"
#import <ReactiveCocoa.h>
#import <MJRefresh/MJRefresh.h>

@implementation CHCommentaryController
- (instancetype )initWithViewModel:(CHCommentaryViewModel *)viewModel{
    self = [super init];
    if (self) {
        self -> _viewModel = viewModel;
    }
    return self;
}
- (void)viewDidLoad
{
    NSAssert(self.viewModel != nil, @"%@",[self class]);
    [self.viewModel requestData];
    [self setupTableView];

    [self.view addSubview:self.tableView];
    
    [self blindViewModel];
    
}
#pragma mark Blind
- (void)blindViewModel
{
    @weakify(self)
    [RACObserve(self.viewModel, cellViewModel) subscribeNext:^(id x) {
        @strongify(self)
        [self.tableView reloadData];
        [self.tableView.mj_header endRefreshing];
        [self.tableView.mj_footer endRefreshing];
    }];
}
#pragma mark Private
- (void)setupTableView{
    self.tableView = [[CHCommentaryTableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:(UITableViewStyleGrouped)];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    @weakify(self);
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        @strongify(self);
        [self.viewModel requestData];
        
    }];
    self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        @strongify(self);
        [self.viewModel requestFooterData];
    }];
}
#pragma mark TableViewDelegate
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    CHCommentaryCell *cell = [tableView dequeueReusableCellWithIdentifier:[CHCommentaryCell commentaryIdentifier]];
    if (cell == nil) {
        cell = [[CHCommentaryCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:[CHCommentaryCell commentaryIdentifier]];
    }
    [cell loadDataWithVM:[self.viewModel.cellViewModel objectAtIndex:indexPath.row]];

    return cell;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.viewModel.cellViewModel.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.viewModel.cellViewModel.count) {
    CHCommentaryCellVM *cellVM = [self.viewModel.cellViewModel objectAtIndex:indexPath.row];
    
   CGSize size = [CHCommentaryCell calculateStringLength:cellVM.content];
    return size.height;
    }
    return 0;
}

@end
