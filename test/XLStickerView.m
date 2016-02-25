//
//  XLStickerView.m
//  test
//
//  Created by xlp on 16/1/20.
//  Copyright © 2016年 realtech. All rights reserved.
//

#import "XLStickerView.h"

@interface XLStickerView()
@property (strong, nonatomic) UIImageView *resizingControlView;
@property (strong, nonatomic) UIImageView *deleteControlView;
@property (strong, nonatomic) UIImageView *customControlView;

@property (assign, nonatomic) BOOL preventsLayoutWhileResizing;

@property (assign, nonatomic) CGFloat deltaAngle;
@property (assign, nonatomic) CGPoint preventPoint;
@property (assign, nonatomic) CGAffineTransform startTransform;
@property (assign, nonatomic) CGPoint touchStart;

@end
@implementation XLStickerView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}
- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
    }
    return self;
}
- (void)setupDefaultAttributes {
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
