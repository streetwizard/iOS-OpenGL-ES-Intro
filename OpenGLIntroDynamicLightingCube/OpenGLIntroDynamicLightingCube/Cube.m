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
    //front face = 2
    {{1, -1, 1},    {1, 0, 0, 1}, {1, 0}, {0, 0, 1}}, // v0, Red, Tc(1,0)
    {{1, 1, 1},     {0, 1, 0, 1}, {1, 1}, {0, 0, 1}}, // v1, Green, Tc(1,1)
    {{-1, 1, 1},    {0, 0, 1, 1}, {0, 1}, {0, 0, 1}}, // v2, Blue, Tc(0,1)
    {{-1, -1, 1},   {0, 0, 0, 1}, {0, 0}, {0, 0, 1}}, // v3, Black, Tc(0,0)
    
    //back face = 5
    {{-1, -1, -1},  {1, 0, 0, 1}, {1, 0}, {0, 0, -1}}, // v4, Red, Tc(1,0)
    {{-1, 1, -1},   {0, 1, 0, 1}, {1, 1}, {0, 0, -1}}, // v5, Green, Tc(1,0)
    {{1, 1, -1},    {0, 0, 1, 1}, {0, 1}, {0, 0, -1}}, // v6, Blue, Tc(0,1)
    {{1, -1, -1},   {0, 0, 0, 1}, {0, 0}, {0, 0, -1}}, // v7, Black, Tc(0,0)
    
    //right face = 3
    {{1, -1, -1},   {1, 0, 0, 1}, {1, 0}, {1, 0, 0}}, // v8, Red, Tc(1,0)
    {{1, 1, -1},    {0, 1, 0, 1}, {1, 1}, {1, 0, 0}}, // v9, Green, Tc(1,1)
    {{1, 1, 1},     {0, 0, 1, 1}, {0, 1}, {1, 0, 0}}, // v10, Blue, Tc(0,1)
    {{1, -1, 1},    {1, 0, 0, 1}, {0, 0}, {1, 0, 0}}, // v11, Black, Tc(0,0)
    
    //left face = 4
    {{-1, -1, 1},   {1, 0, 0, 1}, {1, 0}, {-1, 0, 0}}, // v12, Red, Tc(1,0)
    {{-1, 1, 1},    {0, 1, 0, 1}, {1, 1}, {-1, 0, 0}}, // v13, Green, Tc(1,1)
    {{-1, 1, -1},   {0, 0, 1, 1}, {0, 1}, {-1, 0, 0}}, // v14, Blue, Tc(0,1)
    {{-1, -1, -1},  {1, 0, 0, 1}, {0, 0}, {-1, 0, 0}}, // v15, Black, Tc(0,0)
    
    //top face = 1
    {{1, 1, 1},     {0, 0, 1, 1}, {1, 0}, {0, 1, 0}}, // v16, Blue, Tc(0,1)
    {{1, 1, -1},    {0, 0, 0, 1}, {1, 1}, {0, 1, 0}}, // v17, Black, Tc(0,0)
    {{-1, 1, -1},   {1, 0, 0, 1}, {0, 1}, {0, 1, 0}}, // v18, Red, Tc(1,0)
    {{-1, 1, 1},    {0, 1, 0, 1}, {0, 0}, {0, 1, 0}}, // v19, Green, Tc(1,1)
    
    //bottom face = 6
    {{1, -1, -1},   {1, 0, 0, 1}, {1, 0}, {0, -1, 0}}, // v20, Red, Tc(1,0)
    {{1, -1, 1},    {0, 1, 0, 1}, {1, 1}, {0, -1, 0}}, // v21, Green, Tc(1,1)
    {{-1, -1, 1},   {0, 0, 1, 1}, {0, 1}, {0, -1, 0}}, // v22, Blue, Tc(0,1)
    {{-1, -1, -1},  {1, 0, 0, 1}, {0, 0}, {0, -1, 0}}, // v23, Black, Tc(0,0)
};

const static GLubyte indices[] =
{
    //front
    0, 1, 2,
    2, 3, 0,
    //back
    4, 5, 6,
    6, 7, 4,
    //right
    8, 9, 10,
    10, 11, 8,
    //left
    12, 13, 14,
    14, 15, 12,
    //top
    16, 17, 18,
    18, 19, 16,
    //bottom
    20, 21, 22,
    22, 23, 20
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
        [self loadTexture:@"dungeon_128x128.png"];
        //[self loadTexture:@"dice_512x512.png"];
    }
    
    return self;
}

-(void)updateWithDelta:(NSTimeInterval)delta
{
    //self.rotationZ += M_PI * delta;
    self.rotationY += M_PI / 8 * delta;
}

@end
