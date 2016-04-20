//
//  CHInputkeyboard.h
//  CommentaryModule
//
//  Created by Chausson on 16/4/19.
//  Copyright © 2016年 Chausson. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol CHCommentarySendDelegate <NSObject>

- (void)pressSendBtn:(NSString *)text;

@end

@interface CHInputkeyboard : UIView<UITextViewDelegate>
{
    id<CHCommentarySendDelegate>obj;
}

@property(nonatomic,strong)UITextView *textView;

@property(nonatomic,strong)UIButton *sendBtn;
/**
 *  @brief  初始化输入框API
 *  @param  预导入视图控制器 CHCommentarySendDelegate协议代理对象
 *  @return 返回实例对象
 */
- (instancetype)initWithOwner:(UIViewController <UITextViewDelegate, CHCommentarySendDelegate>*)controller ;

@end
