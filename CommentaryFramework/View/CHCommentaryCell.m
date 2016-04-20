//
//  CHCommentaryCell.m
//  CommentaryModule
//
//  Created by Chausson on 16/4/19.
//  Copyright © 2016年 Chausson. All rights reserved.
//

#import "CHCommentaryCell.h"
#define SCREENWITH   [UIScreen mainScreen].bounds.size.width
#define SCREENHEIGHT [UIScreen mainScreen].bounds.size.height

#define kWidthFactor ([UIScreen mainScreen].bounds.size.width/375)
#define kHeightFactor ([UIScreen mainScreen].bounds.size.height/667)

#define COMMENTARYNAMEFONTSIZE 15
#define COMMENTARYTIMEFONTSIZE 10
#define COMMENTARYCONTENTFONTSIZE 16
#define COMMENTARYPRAISENUMFONTSIZE 15
@implementation CHCommentaryCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        [self prepareLayout];
        
    }
    return self;
    
}

- (void)prepareLayout{
    
    
    _nameBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    _nameBtn.titleLabel.font = [UIFont systemFontOfSize:COMMENTARYNAMEFONTSIZE*kWidthFactor];
    _nameBtn.titleLabel.textAlignment = NSTextAlignmentLeft;
    
    
    _imageBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    _imageBtn.layer.cornerRadius = 200*kHeightFactor/2;
    
    
    _timeLabel = [[UILabel alloc]init];
    _timeLabel.font = [UIFont systemFontOfSize:COMMENTARYTIMEFONTSIZE*kWidthFactor];
    _timeLabel.textColor = [UIColor grayColor];
    _timeLabel.textAlignment = NSTextAlignmentLeft;
    
    
    _contentLabel = [[UILabel alloc]init];
    NSLog(@"******%f %f",_contentLabel.frame.size.height,_contentLabel.frame.size.width);
    _contentLabel.font = [UIFont systemFontOfSize:COMMENTARYCONTENTFONTSIZE*kWidthFactor];

    
    
    _praiseBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [_praiseBtn setImage:[UIImage imageNamed:@"Normal"] forState:UIControlStateNormal];
    [_praiseBtn setImage:[UIImage imageNamed:@"selected"] forState:UIControlStateSelected];
    
    
    _vipSymbolBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [_vipSymbolBtn setImage:[UIImage imageNamed:@"crown"] forState:UIControlStateNormal];
   

    [self.contentView addSubview:self.nameBtn];
    [self.contentView addSubview:self.imageBtn];
    [self.contentView addSubview:self.timeLabel];
    [self.contentView addSubview:self.contentLabel];
    [self.contentView addSubview:self.praiseBtn];
    [self.contentView addSubview:self.vipSymbolBtn];
}

- (void)setCellWithModel:(CHCommentaryCellVM*)model{
    
    _nameBtn.titleLabel.numberOfLines = 0;
    _nameBtn.titleLabel.text = model.name;
    _nameBtn.frame = CGRectMake(215*kWidthFactor, 10*kHeightFactor, 100, 18*kHeightFactor);
    CGFloat vipSymbolY = _nameBtn.frame.size.width + 215*kWidthFactor;
    NSLog(@"*******%f",_nameBtn.frame.size.width);
    
    _imageBtn.frame = CGRectMake(10*kWidthFactor, 10*kHeightFactor, 200*kWidthFactor, 200*kHeightFactor);
    NSURL *url  =[NSURL URLWithString:model.imageUrl];
    NSData *data = [NSData dataWithContentsOfURL:url];
    UIImage *headerImage = [UIImage imageWithData:data];
    [_imageBtn setImage:headerImage forState:UIControlStateNormal];
    
    _timeLabel.frame = CGRectMake(215*kWidthFactor, 30*kHeightFactor, 150*kWidthFactor, 12*kHeightFactor);
    _timeLabel.text = model.time;
    
    _contentLabel.text = model.content;
    _contentLabel.numberOfLines = 0;
    _contentLabel.lineBreakMode = NSLineBreakByWordWrapping|NSLineBreakByTruncatingTail;
    NSAttributedString* atrString = [[NSAttributedString alloc] initWithString:model.content];
    NSRange range = NSMakeRange(0, atrString.length);
    NSDictionary* dic = [atrString attributesAtIndex:0 effectiveRange:&range];
    CGSize size = [model.content boundingRectWithSize:CGSizeMake(SCREENWITH - 215*kWidthFactor, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil].size;
    _contentLabel.frame = CGRectMake(215*kWidthFactor, 50*kHeightFactor, size.width, size.height);
//   [_contentLabel sizeToFit];
    
    _praiseBtn.frame = CGRectMake(0, 0, 0, 0);
    _praiseBtn.titleLabel.text = [NSString stringWithFormat:@"%ld",model.praiseNum];

    _vipSymbolBtn.frame = CGRectMake(vipSymbolY, 10*kHeightFactor, 15, 15);
    if (model.isVIP) {
        _vipSymbolBtn.hidden = NO;
    }
    else{
        _vipSymbolBtn.hidden = YES;
    }
}

+ (CGSize)calculateStringLength:(NSString *)str{
    
    CGSize size;
    
    
    
    NSAttributedString* atrString = [[NSAttributedString alloc] initWithString:str];
    
    
    
    NSRange range = NSMakeRange(0, atrString.length);
    
    
    
    NSDictionary* dic = [atrString attributesAtIndex:0 effectiveRange:&range];
    
    
    
    size = [str boundingRectWithSize:CGSizeMake(SCREENWITH - 215*kWidthFactor, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil].size;
    

    size = CGSizeMake(SCREENWITH, size.height + 30*kHeightFactor);
    
    return  size;
}
@end
