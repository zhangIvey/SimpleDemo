//
//  UIAdapter.m
//  SimpleDemo
//
//  Created by zz on 2021/5/11.
//  Copyright © 2021 zz. All rights reserved.
//

#import "UIAdapter.h"


@implementation UIAdapter

// 1284*2778(6.7英寸)  iphone12 pro max
+ (CGSize)sizeFor67Inch
{
    return CGSizeMake(428, 926);
}

// 1170*2532(6.1英寸)  iPhone12 / iphone12 pro
+ (CGSize)sizeFor61Inch12
{
    return CGSizeMake(390, 844);
}

// 1242*2688(6.5英寸) iPhone 11 Pro Max / Xs Max
+ (CGSize)sizeFor65Inch
{
    return CGSizeMake(414, 896);
}

// 828*1792(6.1英寸)  iPhone11 / XR
+ (CGSize)sizeFor61Inch
{
    return CGSizeMake(414, 896);
}

// 1125*2436(5.8英寸) iPhone 11 Pro / X / XS
+ (CGSize)sizeFor58Inch
{
    return CGSizeMake(375, 812);
}

// 1242*2208(5.5英寸) 6+ / 6s+ / 7+ / 8+
+ (CGSize)sizeFor55Inch
{
    return CGSizeMake(414, 736);
}

// 1080*2340(5.4英寸) iphone12 mini
+ (CGSize)sizeFor54Inch
{
    return CGSizeMake(360, 780);
}

// 750*1334(4.7英寸) 6 / 6s /7 / 8
+ (CGSize)sizeFor47Inch
{
    return CGSizeMake(368, 667);
}

// 640*1136(4英寸) 5 / 5s / 5c / se
+ (CGSize)sizeFor40Inch
{
    return CGSizeMake(320, 568);
}

// 640*960(3.5英寸) 4 / 4s
+ (CGSize)sizeFor35Inch
{
    return CGSizeMake(320, 480);
}




@end
