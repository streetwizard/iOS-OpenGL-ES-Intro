//
//  Vector3D.m
//  OpenGLIntroOBJModelLoader
//
//  Created by Streetwizard on 1/16/15.
//  Copyright (c) 2015 WizArt Interactive. All rights reserved.
//

#import "Vector3D.h"

@implementation Vector3D

-(instancetype)initWithX:(float)xValue Y:(float)yValue Z:(float)zValue
{
    if((self = [super init]))
    {
        self.X = xValue;
        self.Y = yValue;
        self.Z = zValue;
    }
    
    return self;
}

@end
