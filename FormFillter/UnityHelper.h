//
//  UnityHelper.h
//  FormFillter
//
//  Created by Xu, Jay on 9/14/17.
//  Copyright © 2017 Xu, Jay. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SampleGLResourceHandler.h"

@interface UnityHelper : NSObject

@property(weak, nonatomic) id<SampleGLResourceHandler> glResourceHandler;

+(UnityHelper *)sharedInstance;
-(instancetype) __unavailable init;

@end
