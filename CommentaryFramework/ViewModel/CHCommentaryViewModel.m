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
#import "CHSendCommentApi.h"
@implementation CHCommentaryViewModel{
    CHCommentaryApi *_api;
    CHSendCommentApi *_sendApi;
}
- (instancetype)initWithToken:(NSString *)token Url:(NSString *)url identifier:(NSString *)identifier
{
    if (self = [super init]) {
        self.cellViewModel = [NSMutableArray  array];
        _api = [[CHCommentaryApi alloc] initWithUrl:url identifier:identifier];
        _sendApi = [[CHSendCommentApi alloc] initWithUrl:url identifier:identifier token:token];

    }
    return self;
}
- (void)requestData
{
    _api.index = 0;
    @weakify(self)
    [_api startWithSuccessBlock:^(__kindof CHBaseRequest *request) {
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
    _api.index = self.cellViewModel.count;
    @weakify(self)
    [_api startWithSuccessBlock:^(__kindof CHBaseRequest *request) {
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
- (void)sendText:(NSString *)text
{
   // self.isFinish = @"0";
    _sendApi.content = text;
    [_sendApi startWithSuccessBlock:^(__kindof CHBaseRequest *request) {
        if ([[request.response.responseJSONObject objectForKey:@"code"] isEqualToString:@"1999"]) {
            self.isFinish = [request.response.responseJSONObject objectForKey:@"message"];
        }else{
            self.isFinish = @"1";
        }
    } failureBlock:^(__kindof CHBaseRequest *request) {
        self.isFinish = @"2";
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
