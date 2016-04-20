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
@interface CHCommentaryViewModel()
@property (nonatomic, strong) NSMutableArray <CHCommentaryCellVM *> *cellViewModel;
@property (nonatomic, assign) BOOL isFinish;
@end
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
- (void)sendWithMessage:(NSString *)message andCompletion:(void(^)())completion
{
   // self.isFinish = @"0";
    _sendApi.content = message;
    [_sendApi startWithSuccessBlock:^(__kindof CHBaseRequest *request) {
        NSString *message = [request.response.responseJSONObject objectForKey:@"message"];
        if (message.length > 0) {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:message delegate:nil cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
            [alert show];
        }
        if (completion) {
            completion();
        }
    } failureBlock:^(__kindof CHBaseRequest *request) {
        if (completion) {
            completion();
        }
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
