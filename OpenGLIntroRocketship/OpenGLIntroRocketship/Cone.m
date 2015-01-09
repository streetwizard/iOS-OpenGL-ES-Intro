//
//  Cone.m
//  OpenGLIntroRocketship
//
//  Created by Streetwizard on 1/6/15.
//  Copyright (c) 2015 WizArt Interactive. All rights reserved.
//

#import "Cone.h"

const static Vertex vertices[] =
{
    {{0, 0, 0}, {0, 0, 0, 1}}, //v0
    {{0.5, 0, 1}, {1, 0, 0, 1}}, //v1
    {{1, 0, 0.5}, {0, 1, 0, 1}}, //v2
    {{1, 0, -0.5}, {0, 0, 1, 1}}, //v3
    {{0.5, 0, -1}, {1, 0, 0, 1}}, //v4
    {{-0.5, 0, -1}, {0, 1, 0, 1}}, //v5
    {{-1, 0, -0.5}, {0, 0, 1, 1}}, //v6
    {{-1, 0, 0.5}, {1, 0, 0, 1}}, //v7
    {{-0.5, 0, 1}, {0, 1, 0, 1}}, //v8
    {{0, 1, 0}, {0, 0, 0, 1}} //v9
};

const static GLubyte indices[] =
{
    //bottom face
    0, 1, 2,
    0, 2, 3,
    0, 3, 4,
    0, 4, 5,
    0, 5, 6,
    0, 6, 7,
    0, 7, 8,
    0, 8, 1,
    //side faces
    9, 1, 2,
    9, 2, 3,
    9, 3, 4,
    9, 4, 5,
    9, 5, 6,
    9, 6, 7,
    9, 7, 8,
    9, 8, 1
};

@implementation Cone

- (instancetype)initWithShader:(BaseEffect *)shader
{
    if((self = [super initWithName:"ConeModel"
                            shader:shader
                          vertices:(Vertex *)vertices
                       vertexCount:(sizeof(vertices) / sizeof(vertices[0]))
                           indices:(GLubyte *)indices
                        indexCount:(sizeof(indices) / sizeof(indices[0]))]))
    {
        
    }
    
    return self;
}

- (instancetype)initWithShader:(BaseEffect *)shader scaleX:(float)scaleX scaleY:(float)scaleY scaleZ:(float)scaleZ
{
    if((self = [self initWithShader:shader]))
    {
        self.scaleX = scaleX;
        self.scaleY = scaleY;
        self.scaleZ = scaleZ;
    }
    
    return self;
}

- (void)updateWithDelta:(NSTimeInterval)delta;
{
    [super updateWithDelta:delta];
    self.rotationY += M_PI * delta;
}

@end
