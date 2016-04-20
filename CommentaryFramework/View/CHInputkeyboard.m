//
//  CHInputkeyboard.m
//  CommentaryModule
//
//  Created by Chausson on 16/4/19.
//  Copyright © 2016年 Chausson. All rights reserved.
//

#import "CHInputkeyboard.h"
#define SCREENWITH   [UIScreen mainScreen].bounds.size.width
#define SCREENHEIGHT [UIScreen mainScreen].bounds.size.height

#define kWidthFactor ([UIScreen mainScreen].bounds.size.width/375)
#define kHeightFactor ([UIScreen mainScreen].bounds.size.height/667)
@implementation CHInputkeyboard
- (instancetype)initWithObj:(id<CHCommentarySendDelegate>)o{
    self = [super init];
    if (self) {
        
        [self prepareForLayout];
        obj = o;
        
    }
    return self;
}
- (void)prepareForLayout{
    
    _textView = [[UITextView alloc]initWithFrame:CGRectMake(10*kWidthFactor, 5*kHeightFactor, SCREENWITH - 100*kWidthFactor, 40*kHeightFactor)];
    
    _sendBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    _sendBtn.frame = CGRectMake(SCREENWITH - 85*kWidthFactor, 5*kHeightFactor, 80*kWidthFactor, 40*kHeightFactor);
    [_sendBtn setTitle:@"send" forState:UIControlStateNormal];
    [_sendBtn addTarget:self action:@selector(pressSendBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:self.textView];
    [self addSubview:self.sendBtn];
}

- (void)pressSendBtnAction:(UIButton *)button{
    
    [obj pressSendBtn:_textView.text];

}
@end
