//
//  XLStickerView.h
//  test
//
//  Created by xlp on 16/1/20.
//  Copyright © 2016年 realtech. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger, XLStickerViewButtons) {
    XLSTICKERVIEW_BUTTON_NULL,
    XLSTICKERVIEW_BUTTON_DEL,
    XLSTICKERVIEW_BUTTON_RESIZE,
    XLSTICKERVIEW_BUTTON_CUSTOM,
    XLSTICKERVIEW_BUTTON_MAX
};
@protocol XLStickerViewDelegate;

@interface XLStickerView : UIView
@property (strong, nonatomic) UIView *contentView;
@property (assign, nonatomic) BOOL preventsPostionOutsideSuperview;
@property (assign, nonatomic) BOOL preventsResizing;
@property (assign, nonatomic) BOOL preventsDeleting;
@property (assign, nonatomic) BOOL preventsCustomButton;
@property (assign, nonatomic) CGFloat minWidth;
@property (assign, nonatomic) CGFloat minHeight;

@property (weak, nonatomic) id <XLStickerViewDelegate> stickerViewDelegate;

- (void)hideDelHandler;
- (void)showDelHandler;
- (void)hideEditingHandlers;
- (void)showEditingHandlers;
- (void)showCustomHandler;
- (void)hideCustomHandler;
- (void)setButton:(XLStickerViewButtons)type image:(UIImage *)image;
- (BOOL)isEditinghandlersHidden;

@end

@protocol XLStickerViewDelegate <NSObject>

@required
@optional
- (void)stickerViewDidBeginEditing:(XLStickerView *)sticker;
- (void)stickerViewDidEndEditing:(XLStickerView *)sticker;
- (void)stickerViewDidCancelEditing:(XLStickerView *)sticker;
- (void)stickerViewDidClose:(XLStickerView *)sticker;
- (void)stickerViewDidLongPressed:(XLStickerView *)sticker;
- (void)stickerViewDidCustomButtonTap:(XLStickerView *)sticker;
@end
