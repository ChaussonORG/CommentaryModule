//
//  CHCommentaryViewModel.m
//  CommentaryModule
//
//  Created by Chausson on 16/4/19.
//  Copyright © 2016年 Chausson. All rights reserved.
//

#import "CHCommentaryViewModel.h"
#import "CHCommentaryApi.h"
#import <CHNetworking.h>
#import <ReactiveCocoa.h>
@implementation CHCommentaryViewModel{
    CHCommentaryApi *api;
}
- (instancetype)init
{
    if (self = [super init]) {
        self.cellViewModel = [NSMutableArray  array];
        api = [[CHCommentaryApi alloc] init];
    }
    return self;
}
- (void)requestData
{
    api.index = 0;
    @weakify(self)
    [api startWithSuccessBlock:^(__kindof CHBaseRequest *request) {
        CHCommentaryApi *comment = (CHCommentaryApi *)request;
        NSMutableArray <CHCommentaryCellVM *>*cellViewModel = [NSMutableArray array];
        @strongify(self)
        for (CHCommentaryModelItems *items in [comment getItems]) {
            [cellViewModel addObject:[self assemblyViewModelWithItem:items]];
        }
        self.cellViewModel = [cellViewModel copy];
    } failureBlock:^(__kindof CHBaseRequest *request) {
        
    }];
    
}
- (void)requestFooterData
{
    api.index = self.cellViewModel.count;
    @weakify(self)
    [api startWithSuccessBlock:^(__kindof CHBaseRequest *request) {
        CHCommentaryApi *comment = (CHCommentaryApi *)request;
        NSMutableArray <CHCommentaryCellVM *>*cellViewModel = [NSMutableArray arrayWithArray:[self.cellViewModel copy]];
        @strongify(self)
        for (CHCommentaryModelItems *items in [comment getItems]) {
            [cellViewModel addObject:[self assemblyViewModelWithItem:items]];
        }
        self.cellViewModel = [cellViewModel copy];
    } failureBlock:^(__kindof CHBaseRequest *request) {
        
    }];
}

- (CHCommentaryCellVM *)assemblyViewModelWithItem:(CHCommentaryModelItems *)items
{
    CHCommentaryCellVM *cellVM = [[CHCommentaryCellVM alloc] init];
    cellVM.name = items.userName;
    cellVM.imageUrl = items.photo;
    cellVM.time = items.publicTime;
    cellVM.content = items.content;
    return cellVM;
}
@end
