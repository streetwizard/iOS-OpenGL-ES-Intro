//
//  Color.m
//  OpenGLIntroOBJModelLoader
//
//  Created by Streetwizard on 1/16/15.
//  Copyright (c) 2015 WizArt Interactive. All rights reserved.
//

#import "Color.h"

@implementation Color

-(instancetype)initWithR:(float)red G:(float)green B:(float)blue
{
    if((self = [self initWithR:red
                             G:green
                             B:blue
                             A:1.0f]))
    {
    }
    
    return self;
}

-(instancetype)initWithR:(float)red G:(float)green B:(float)blue A:(float)alpha
{
    if((self = [super init]))
    {
        self.R = red;
        self.G = green;
        self.B = blue;
        self.A = alpha;
    }
    
    return self;
}

@end
