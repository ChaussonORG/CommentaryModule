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

CGFloat keyboardHeight;
@implementation CHInputkeyboard

#pragma mark init

- (instancetype)initWithOwner:(UIViewController <UITextViewDelegate, CHCommentarySendDelegate>*)controller{
    
    CGSize size = controller.view.frame.size;
   
    self = [super initWithFrame:CGRectMake(0, SCREENHEIGHT - 50-64, size.width, 50)];

    if (self) {
        
        self.backgroundColor = [UIColor colorWithRed:230/256.0 green:230/256.0 blue:230/256.0 alpha:1];
        
        [self prepareForLayout];
        
        self.textView.delegate = self;

        obj = controller;
        
        
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(handleKeyboardShow:)
                                                     name:UIKeyboardWillShowNotification
                                                   object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(handleKeyboardHide:)
                                                     name:UIKeyboardWillHideNotification
                                                   object:nil];
        
//        UIView *tapView = [[UIView alloc]initWithFrame:CGRectMake(0, 64, SCREENWITH, SCREENHEIGHT - 64 -keyboardHeight)];
//        [controller.view addSubview:tapView];
//        tapView.hidden = NO;
//        tapView.backgroundColor = [UIColor redColor];
        
        
        UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(keyboardHide:)];
        [controller.view addGestureRecognizer:tapGestureRecognizer];
    }
    
    return self;
    
}

- (void)prepareForLayout{
    

    
    _textView = [[UITextView alloc]initWithFrame:CGRectMake(10, 10, SCREENWITH - 75, 30)];
    _textView.layer.borderColor = [UIColor whiteColor].CGColor;
    _textView.layer.cornerRadius = 5;
    _textView.layer.borderWidth = 1;
    _textView.font = [UIFont systemFontOfSize:16*kWidthFactor];
    
    
    _sendBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    _sendBtn.frame = CGRectMake(SCREENWITH - 60, 10, 50, 30);
    [_sendBtn setTitle:@"发送" forState:UIControlStateNormal];
    _sendBtn.tintColor = [UIColor grayColor];
    _sendBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    _sendBtn.layer.cornerRadius = 5;
    [_sendBtn addTarget:self action:@selector(pressSendBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    _sendBtn.backgroundColor = [UIColor redColor];
    
    
    [self addSubview:self.recordBtn];
    [self addSubview:self.textView];
    [self addSubview:self.sendBtn];

    
   
}

#pragma mark textViewDelegate

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{

    if ([text isEqualToString:@"\n"]) {
        
        return NO;
    }
    
    return YES;
}


#pragma mark -hanlder

- (void)handleKeyboardShow:(NSNotification *) note{
    //     键盘的frame
    NSDictionary *userInfo = [note userInfo];
    NSValue *aValue = [userInfo objectForKey:UIKeyboardFrameEndUserInfoKey];
    CGRect keyboardRect = [aValue CGRectValue];
    int height = keyboardRect.size.height;
    keyboardHeight = height;
    CGRect rect = CGRectMake(0, SCREENHEIGHT - 50-64, [UIScreen mainScreen].bounds.size.width, 50);
    rect.origin.y = rect.origin.y - keyboardHeight;
    self.frame = rect;
    
}


- (void)handleKeyboardHide:(NSNotification *) note{
    
    [UIView animateWithDuration:.001 animations:^{
        CGRect rect = self.frame;
        rect = CGRectMake(0, SCREENHEIGHT - 50 - 64, SCREENWITH, 50);
        self.frame = rect;
        
    } completion:^(BOOL finished) {
        
    }];
}

- (void)pressSendBtnAction:(UIButton *)button{
    
    if (![self.textView.text isEqualToString:@""]) {
        
        [obj pressSendBtn:_textView.text];
        [_textView resignFirstResponder];
        self.textView.text = @"";
        
    }
   
}


#pragma mark Gesture

- (void)keyboardHide:(UITapGestureRecognizer*)tap{
    
    [_textView resignFirstResponder];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [_textView resignFirstResponder];
}

- (void)dealloc{
   
    [[NSNotificationCenter defaultCenter] removeObserver:self];
  
}
@end
