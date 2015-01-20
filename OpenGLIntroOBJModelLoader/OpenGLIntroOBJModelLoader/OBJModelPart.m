//
//  OBJModel.m
//  OpenGLIntroOBJModelLoader
//
//  Created by Streetwizard on 1/16/15.
//  Copyright (c) 2015 WizArt Interactive. All rights reserved.
//

#import "OBJModelPart.h"

@implementation OBJModelPart

-(instancetype)init
{
    if((self = [super init]))
    {
        self.material = nil;
        self.faces = [NSMutableArray array];
    }
    
    return self;
}

-(instancetype)initWithFaces:(NSMutableArray*)faces
                    material:(Material*)material
{
    if((self = [super init]))
    {
        self.faces = faces;
        self.material = material;
    }
    
    return self;
}

@end
