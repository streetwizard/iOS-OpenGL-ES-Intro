//
//  MaskedTexture.m
//  OpenGLIntroPictureFrame
//
//  Created by Streetwizard on 1/7/15.
//  Copyright (c) 2015 WizArt Interactive. All rights reserved.
//

#import "MaskedTexture.h"

const static Vertex vertices[] =
{
    //front face = 2
    {{1, -1, 1},    {1, 0, 0, 1}, {1, 0}}, // v0, Red, Tc(1,0)
    {{1, 1, 1},     {0, 1, 0, 1}, {1, 1}}, // v1, Green, Tc(1,1)
    {{-1, 1, 1},    {0, 0, 1, 1}, {0, 1}}, // v2, Blue, Tc(0,1)
    {{-1, -1, 1},   {0, 0, 0, 1}, {0, 0}}, // v3, Black, Tc(0,0)
};

const static GLubyte indices[] =
{
    //front
    0, 1, 2,
    2, 3, 0,
};

@implementation MaskedTexture

-(instancetype)initWithShader:(BaseEffect *)shader texture:(NSString *)textureFileName mask:(NSString *)maskFileName
{
    if((self = [super initWithName:"MaskedTextureModel"
                            shader:shader
                          vertices:(Vertex *)vertices
                       vertexCount:(sizeof(vertices) / sizeof(vertices[0]))
                           indices:(GLubyte *)indices
                        indexCount:(sizeof(indices) / sizeof(indices[0]))]))
    {
        self.texture = [self loadTexture:textureFileName];
        
        if(maskFileName)
        {
            self.mask = [self loadTexture:maskFileName];
        }
    }
    
    return self;
}

@end
