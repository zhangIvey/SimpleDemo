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


#define UI(x) AdapteUI(x)
#define RECTADAPTER(x, y , width, height) RectAdapter(x, y , width, height)


static inline NSInteger AdapteUI(float x)
{
//    1 - 分机型 返回特定的比例
    
//    2 - 以iPhone12 款机型为标准，通过比例进行换算 (此处以 宽390 为标准尺寸)
    
    CGFloat scale = 390 / CURRENT_WIDTH ;
    
    return (NSInteger)(x / scale);
}



static inline CGRect RectAdapter(float x, float y , float width , float height)
{
    
    return CGRectMake(AdapteUI(x), AdapteUI(y), AdapteUI(width), AdapteUI(height));
}



@interface UIAdapter : NSObject




@end


NS_ASSUME_NONNULL_END
