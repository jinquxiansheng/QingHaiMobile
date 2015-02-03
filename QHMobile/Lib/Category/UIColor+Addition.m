//
//  UIColor+Addition.m
//  QHMobile
//
//  Created by yao on 15/2/3.
//  Copyright (c) 2015年 yao. All rights reserved.
//

#import "UIColor+Addition.h"

@implementation UIColor (Addition)
+(UIColor*) colorWithHex:(uint)hex;
{
    int red, green, blue, alpha;
    
    blue = hex & 0x000000FF;
    green = ((hex & 0x0000FF00) >> 8);
    red = ((hex & 0x00FF0000) >> 16);
    alpha = ((hex & 0xFF000000) >> 24);
    
    return [UIColor colorWithRed:red/255.0f
                           green:green/255.0f
                            blue:blue/255.0f
                           alpha:alpha/255.f];
}

@end
