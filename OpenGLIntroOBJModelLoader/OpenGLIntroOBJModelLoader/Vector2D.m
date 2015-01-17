//
//  Vector2D.m
//  OpenGLIntroOBJModelLoader
//
//  Created by Streetwizard on 1/16/15.
//  Copyright (c) 2015 WizArt Interactive. All rights reserved.
//

#import "Vector2D.h"

@implementation Vector2D

-(instancetype)initWithX:(float)xValue Y:(float)yValue
{
    if((self = [super init]))
    {
        self.X = xValue;
        self.Y = yValue;
    }
    
    return self;
}

@end
