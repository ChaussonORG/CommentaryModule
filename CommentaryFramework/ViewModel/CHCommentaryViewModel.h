//
//  CHCommentaryViewModel.h
//  CommentaryModule
//
//  Created by Chausson on 16/4/19.
//  Copyright © 2016年 Chausson. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CHCommentaryCellVM.h"
@interface CHCommentaryViewModel : NSObject
@property (nonatomic, strong) NSMutableArray <CHCommentaryCellVM *> *cellViewModel;
- (void)requestData;
- (void)requestFooterData;
@property (nonatomic, strong)NSString *isFinish;
- (void)sendText:(NSString *)text;
/**
 *  @brief 初始化viewmodel
 *  @param token代表用户的token url是接口地址 id代表接口参数
 *  @return 返回实例对象
 */
- (instancetype)initWithToken:(NSString *)token Url:(NSString *)url identifier:(NSString *)identifier;
@end
