//
//  Cube.m
//  OpenGLIntroRotatingCube
//
//  Created by Streetwizard on 1/2/15.
//  Copyright (c) 2015 WizArt Interactive. All rights reserved.
//

#import "Cube.h"

const static Vertex vertices[] =
{
    //front face
    {{1, -1, 1}, {1, 0, 0, 1}}, // v0, Red
    {{1, 1, 1}, {0, 1, 0, 1}}, // v1, Green
    {{-1, 1, 1}, {0, 0, 1, 1}}, // v2, Blue
    {{-1, -1, 1}, {0, 0, 0, 0}}, // v3, Black
    
    //back face
    {{-1, -1, -1}, {0, 0, 0, 0}}, // v7, Black
    {{-1, 1, -1}, {1, 0, 0, 1}}, // v4, Red
    {{1, 1, -1}, {0, 1, 0, 1}}, // v5, Green
    {{1, -1, -1}, {0, 0, 1, 1}} // v6, Blue
};

const static GLubyte indices[] =
{
    //front
    0, 1, 2,
    2, 3, 0,
    //back
    4, 5, 6,
    6, 7, 4,
    //left
    3, 2, 5,
    5, 4, 3,
    //right
    7, 6, 1,
    1, 0, 7,
    //top
    1, 6, 5,
    5, 2, 1,
    //bottom
    3, 4, 7,
    7, 0, 3
};

@implementation Cube

- (instancetype)initWithShader:(BaseEffect *)shader
{
    if((self = [super initWithName:"CubeModel"
                            shader:shader
                          vertices:(Vertex *)vertices
                       vertexCount:(sizeof(vertices) / sizeof(vertices[0]))
                           indices:(GLubyte *)indices
                        indexCount:(sizeof(indices) / sizeof(indices[0]))]))
    {
        
    }
    
    return self;
}

-(void)updateWithDelta:(NSTimeInterval)delta
{
    self.rotationZ += M_PI * delta;
    self.rotationY += M_PI * delta;
}

@end
