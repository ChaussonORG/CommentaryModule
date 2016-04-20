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
@property (nonatomic, strong, readonly) NSMutableArray <CHCommentaryCellVM *> *cellViewModel;
//@property (nonatomic, assign, readonly) BOOL isFinish;//如果YES加载成功,提示成功! 如果NO表示加载失败,提示失败!
- (void)requestData;
- (void)requestFooterData;
- (void)sendWithMessage:(NSString *)message andCompletion:(void(^)())completion;
/**
 *  @brief 初始化viewmodel
 *  @param token代表用户的token url是接口地址 id代表接口参数
 *  @return 返回实例对象
 */
- (instancetype)initWithToken:(NSString *)token Url:(NSString *)url identifier:(NSString *)identifier;
@end
