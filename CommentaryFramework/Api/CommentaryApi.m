//
//  CommentaryApi.m
//  CommentaryModule
//
//  Created by 郭金涛 on 16/4/19.
//  Copyright © 2016年 Chausson. All rights reserved.
//

#import "CommentaryApi.h"

@implementation CommentaryApi{
    CommentaryModel *_model;
}
- (instancetype)init
{
    if (self = [super init]) {
        
    }
    return self;
}
- (NSString *)requestPathUrl{
    return [NSString stringWithFormat:@"/app/comment/list/111"];
}
- (NSDictionary *)requestParameter{
    return @{@"offset":@(self.index)};
}
- (NSDictionary *)requestHeaderFieldValueDictionary
{
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    NSString *token = [NSString stringWithFormat:@"_MCH_AT=%@", @""];
    [dic setObject:token forKey:@"cookie"];
    return dic;
}
- (void)requestCompletionBeforeBlock{
    NSError *err ;
    _model = [[CommentaryModel alloc]initWithDictionary:self.response.responseJSONObject error:&err];
}
- (NSArray <CommentaryModelItems *>*)getItems{
    if (_model.code == 200) {
        return  _model.data.items?_model.data.items:nil;
    }else{
        NSLog(@" %s%@",__PRETTY_FUNCTION__,_model.message);
        return nil;
    }
}
@end
