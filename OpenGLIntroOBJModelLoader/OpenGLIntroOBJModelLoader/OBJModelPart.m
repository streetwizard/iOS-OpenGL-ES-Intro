//
//  OBJModel.m
//  OpenGLIntroOBJModelLoader
//
//  Created by Streetwizard on 1/16/15.
//  Copyright (c) 2015 WizArt Interactive. All rights reserved.
//

#import "OBJModelPart.h"

@implementation OBJModelPart

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
