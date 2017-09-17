//
//  UnityHelper.m
//  FormFillter
//
//  Created by Xu, Jay on 9/14/17.
//  Copyright © 2017 Xu, Jay. All rights reserved.
//

#import "UnityHelper.h"

@implementation UnityHelper

+(UnityHelper *)sharedInstance {
    static UnityHelper *shared = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shared = [UnityHelper new];
    });
    return shared;
}

@end
