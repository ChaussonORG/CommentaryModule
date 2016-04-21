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
   
    self = [super initWithFrame:CGRectMake(0, SCREENHEIGHT - 50*kHeightFactor-64, size.width, 50*kHeightFactor)];
    NSLog(@"%f",SCREENHEIGHT - 50*kHeightFactor);
    if (self) {
        
        self.backgroundColor = [UIColor grayColor];
        
        [self prepareForLayout];
        
        self.textView.delegate = self;

        obj = controller;
    

        
        UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(keyboardHide:)];
        [controller.view addGestureRecognizer:tapGestureRecognizer];
        
        
        
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(handleKeyboardShow:)
                                                     name:UIKeyboardWillShowNotification
                                                   object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(handleKeyboardHide:)
                                                     name:UIKeyboardWillHideNotification
                                                   object:nil];
        
    }
    
    return self;
    
}

- (void)prepareForLayout{
    
    _recordBtn = [UIButton buttonWithType:UIButtonTypeInfoLight];
    _recordBtn.frame = CGRectMake(10*kWidthFactor, 5*kHeightFactor, 40*kWidthFactor, 40*kHeightFactor);
     _recordBtn.tintColor = [UIColor lightGrayColor];
    _recordBtn.layer.cornerRadius = 20;

    
    _textView = [[UITextView alloc]initWithFrame:CGRectMake(55*kWidthFactor, 5*kHeightFactor, SCREENWITH - 130*kWidthFactor, 40*kHeightFactor)];
    _textView.backgroundColor = [UIColor lightGrayColor];
    _textView.layer.borderColor = [UIColor whiteColor].CGColor;
    _textView.layer.cornerRadius = 5;
    _textView.layer.borderWidth = 1;
    _textView.font = [UIFont systemFontOfSize:20];
    
    
    _sendBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    _sendBtn.frame = CGRectMake(SCREENWITH - 70*kWidthFactor, 5*kHeightFactor, 60*kWidthFactor, 40*kHeightFactor);
    [_sendBtn setTitle:@"发送" forState:UIControlStateNormal];
    _sendBtn.tintColor = [UIColor whiteColor];
    _sendBtn.titleLabel.font = [UIFont systemFontOfSize:20];
    _sendBtn.layer.cornerRadius = 5;
    _sendBtn.hidden = YES;
    [_sendBtn addTarget:self action:@selector(pressSendBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    _sendBtn.backgroundColor = [UIColor greenColor];
    
    _addBtn = [UIButton buttonWithType:UIButtonTypeContactAdd];
    _addBtn.frame = CGRectMake(SCREENWITH - 70*kWidthFactor, 5*kHeightFactor, 60*kWidthFactor, 40*kHeightFactor);
    _addBtn.tintColor = [UIColor lightGrayColor];
    
    [self addSubview:self.recordBtn];
    [self addSubview:self.textView];
    [self addSubview:self.sendBtn];
    [self addSubview:self.addBtn];
    
   
}

#pragma mark textViewDelegate
- (void)textViewDidChange:(UITextView *)textView{
    if (![textView.text isEqualToString:@""]) {
        _sendBtn.hidden = NO;
        _addBtn.hidden = YES;
    }
    else{
        _sendBtn.hidden =YES;
        _addBtn.hidden = NO;
    }
}
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{

    if ([text isEqualToString:@"\n"]) {
        
        return NO;
    }
    
    return YES;
}


#pragma mark -hanlder

- (void)handleKeyboardShow:(NSNotification *) note{
    NSDictionary *userInfo = note.userInfo;
    
    //     键盘的frame
    CGRect keyboardF = [userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    
    keyboardHeight = keyboardF.size.height;
    // 执行动画
    [UIView animateWithDuration:.5 animations:^{
        CGRect rect = self.frame;
        rect.origin.y = rect.origin.y - keyboardHeight;
        self.frame = rect;
    } completion:^(BOOL finished) {
        
    }];
    
}


- (void)handleKeyboardHide:(NSNotification *) note{
    
    [UIView animateWithDuration:.5 animations:^{
        CGRect rect = self.frame;
        rect = CGRectMake(0, SCREENHEIGHT - 50*kHeightFactor-64, SCREENWITH, 50*kHeightFactor);
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
