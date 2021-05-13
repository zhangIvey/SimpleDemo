//
//  UIAdapter.h
//  SimpleDemo
//
//  Created by zz on 2021/5/11.
//  Copyright © 2021 zz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

#define IS_LANDSCAPE UIInterfaceOrientationIsLandscape([[UIApplication sharedApplication] statusBarOrientation]) //是否是横屏

//根据屏幕的横竖屏情况调整宽高
#define CURRENT_WIDTH (IS_LANDSCAPE ? [UIScreen mainScreen].bounds.size.height : [UIScreen mainScreen].bounds.size.width)
#define CURRENT_HEIGHT (IS_LANDSCAPE ? [UIScreen mainScreen].bounds.size.width : [UIScreen mainScreen].bounds.size.height)



#define IS_PHONE_X ( CURRENT_WIDTH == [UIAdapter sizeFor58Inch].width && CURRENT_HEIGHT == [UIAdapter sizeFor58Inch].height )
#define IS_PHONE_XS ( CURRENT_WIDTH == [UIAdapter sizeFor58Inch].width && CURRENT_HEIGHT == [UIAdapter sizeFor58Inch].height )
#define IS_PHONE_XR ( CURRENT_WIDTH == [UIAdapter sizeFor61Inch].width && CURRENT_HEIGHT == [UIAdapter sizeFor61Inch].height )
#define IS_PHONE_XS_MAX ( CURRENT_WIDTH == [UIAdapter sizeFor65Inch].width && CURRENT_HEIGHT==[UIAdapter sizeFor65Inch].height )
#define IS_PHONE_11 ( CURRENT_WIDTH==[UIAdapter sizeFor61Inch].width && CURRENT_HEIGHT==[UIAdapter sizeFor61Inch].height )
#define IS_PHONE_11_PRO ( CURRENT_WIDTH==[UIAdapter sizeFor58Inch].width && CURRENT_HEIGHT==[UIAdapter sizeFor58Inch].height )
#define IS_PHONE_11_PRO_MAX ( CURRENT_WIDTH==[UIAdapter sizeFor65Inch].width && CURRENT_HEIGHT==[UIAdapter sizeFor65Inch].height )
#define IS_PHONE_12_MINI ( CURRENT_WIDTH==[UIAdapter sizeFor54Inch].width && CURRENT_HEIGHT==[UIAdapter sizeFor54Inch].height )
#define IS_PHONE_12 ( CURRENT_WIDTH==[UIAdapter sizeFor61Inch12].width && CURRENT_HEIGHT==[UIAdapter sizeFor61Inch12].height )
#define IS_PHONE_12_PRO ( CURRENT_WIDTH==[UIAdapter sizeFor61Inch12].width && CURRENT_HEIGHT==[UIAdapter sizeFor61Inch12].height )
#define IS_PHONE_12_PRO_MAX ( CURRENT_WIDTH==[UIAdapter sizeFor67Inch].width && CURRENT_HEIGHT==[UIAdapter sizeFor67Inch].height )

// 根据尺寸来判断机型
#define IS_PHONE_LIKEX ( IS_PHONE_X || IS_PHONE_XS || IS_PHONE_XR || IS_PHONE_XS_MAX || IS_PHONE_11 || IS_PHONE_11_PRO || IS_PHONE_11_PRO_MAX || IS_PHONE_12_MINI || IS_PHONE_12 || IS_PHONE_12_PRO || IS_PHONE_12_PRO_MAX )


// 刘海屏的状态栏高度是44
#define STATEBARHEIGHT (IS_PHONE_LIKEX?44:20)

#define UI(x) AdapteUI(x)
#define RECTADAPTER(x, y , width, height) RectAdapter(x, y , width, height)


static inline NSInteger AdapteUI(float x)
{
//    1 - 分机型 返回特定的比例
    
//    2 - 以一款机型为标准，通过比例进行换算 (此处以 宽390 为标准尺寸)
    
    CGFloat scale = 390 / CURRENT_WIDTH ;
    
    return (NSInteger)(x / scale);
}



static inline CGRect RectAdapter(float x, float y , float width , float height)
{
    
    return CGRectMake(AdapteUI(x), AdapteUI(y), AdapteUI(width), AdapteUI(height));
}




@interface UIAdapter : NSObject


// 1284*2778(6.7英寸)  iphone12 pro max
+ (CGSize)sizeFor67Inch;

// 1170*2532(6.1英寸)  iPhone12 / iphone12 pro
+ (CGSize)sizeFor61Inch12;

// 1242*2688(6.5英寸) iPhone 11 Pro Max / Xs Max
+ (CGSize)sizeFor65Inch;

// 828*1792(6.1英寸)  iPhone11 / XR
+ (CGSize)sizeFor61Inch;

// 1125*2436(5.8英寸) iPhone 11 Pro / X / XS
+ (CGSize)sizeFor58Inch;

// 1242*2208(5.5英寸) 6+ / 6s+ / 7+ / 8+
+ (CGSize)sizeFor55Inch;

// 1080*2340(5.4英寸) iphone12 mini
+ (CGSize)sizeFor54Inch;

// 750*1334(4.7英寸) 6 / 6s /7 / 8
+ (CGSize)sizeFor47Inch;

// 640*1136(4英寸) 5 / 5s / 5c / se
+ (CGSize)sizeFor40Inch;

// 640*960(3.5英寸) 4 / 4s
+ (CGSize)sizeFor35Inch;


@end


NS_ASSUME_NONNULL_END
