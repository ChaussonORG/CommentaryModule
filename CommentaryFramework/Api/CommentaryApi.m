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
-(NSString *)customUrl
{
    return @"http://p2pguide.sudaotech.com/platform/app/comment/list/28";

}

- (NSDictionary *)requestParameter{
    return @{@"offset":@(self.index)};
}
- (NSDictionary *)requestHeaderFieldValueDictionary
{
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    NSString *token = [NSString stringWithFormat:@"_MCH_AT=%@", @"8rc3%2BVwxuDpgiOEW%2Fe37%2FMAQjeHM6HFb6K3cNEpmVHQ1Gfvx8YI%2BpkAzov2ysr9ExKdh3MRoPFqlBoRqEqucSSDLPsTP%2FyAr1BHoRG%2BvDO5XBUtGzSvIGBjfEiim%2Fy97peUK8KsIYKi%2FJmNhAS4QtQ%3D%3D"];
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
        return nil;
    }
}
@end
