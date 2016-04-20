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

- (void)viewDidLoad
{
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBar.translucent = NO;
    //列表ViewModel
    self.viewModel = [[CHCommentaryViewModel alloc] init];
    [self.viewModel requestData];
    self.tableView = [[CHCommentaryTableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - 30) style:(UITableViewStylePlain)];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    @weakify(self);
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        @strongify(self);
        [self.viewModel requestData];
        
    }];
    self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        @strongify(self);
        [self.viewModel requestFooterData];
    }];
    [self binding];
    
}
- (void)binding
{
    @weakify(self)
    [RACObserve(self.viewModel, cellViewModel) subscribeNext:^(id x) {
        @strongify(self)
        [self.tableView reloadData];
        [self.tableView.mj_header endRefreshing];
        [self.tableView.mj_footer endRefreshing];
    }];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *cellStr = @"cell";
    CHCommentaryCell *cell = [tableView dequeueReusableCellWithIdentifier:cellStr];
    if (cell == nil) {
        cell = [[CHCommentaryCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:cellStr];
    }
    if (self.viewModel.cellViewModel.count) {
        CHCommentaryCellVM *cellVM = [self.viewModel.cellViewModel objectAtIndex:indexPath.row];
        [cell setCellWithModel:cellVM];
    }
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
//创建发送框和按钮
- (void)creatSendView
{
    self.keyBofardView = [[CHInputkeyboard alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height - 40, self.view.frame.size.width, 40)];
    [self.view addSubview:self.keyBofardView];

    
}
@end
