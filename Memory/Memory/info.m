//
//  info.m
//  Memory
//
//  Created by yanhe on 2018/4/19.
//  Copyright © 2018年 yanhe. All rights reserved.
//

#import "info.h"

@implementation info
+(UIImage *)getImageWithName:(NSInteger)nameId{
    switch (nameId) {
        case 0:{
            return [UIImage imageNamed:@"1"];
        }
            break;
            
        default:
            break;
    }
    return nil;
}

@end
