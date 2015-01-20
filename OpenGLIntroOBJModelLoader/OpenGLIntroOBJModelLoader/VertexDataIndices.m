//
//  VertexDataIndices.m
//  OpenGLIntroOBJModelLoader
//
//  Created by Streetwizard on 1/19/15.
//  Copyright (c) 2015 WizArt Interactive. All rights reserved.
//

#import "VertexDataIndices.h"

@implementation VertexDataIndices

-(instancetype)initWithString:(NSString*)string
{
    if((self = [super init]))
    {
        NSArray *components = [string componentsSeparatedByString:@"/"];
        
        if([components count] < 3)
        {
            return nil;
        }
        
        self.vertexIndex = [components[0] intValue];
        self.textureCoordinateIndex = [components[1] intValue];
        self.normalIndex = [components[2] intValue];
    }
    
    return self;
}

@end
