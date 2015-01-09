//
//  Square.m
//  OpenGLIntroColorScreen
//
//  Created by Streetwizard on 12/30/14.
//  Copyright (c) 2014 WizArt Interactive. All rights reserved.
//

#import "Square.h"

const static Vertex vertices[] =
{
    {{1, -1, 0}, {1, 0, 0, 1}}, // v0, Red
    {{1, 1, 0}, {0, 1, 0, 1}}, // v1, Green
    {{-1, 1, 0}, {0, 0, 1, 1}}, // v2, Blue
    {{-1, -1, 0}, {0, 0, 0, 0}} // v3, Black
};

const static GLubyte indices[] =
{
    0, 1, 2,
    2, 3, 0
};

@implementation Square

- (instancetype)initWithShader:(BaseEffect *)shader
{
    if((self = [super initWithName:"SquareModel"
                            shader:shader
                          vertices:(Vertex *)vertices
                       vertexCount:(sizeof(vertices) / sizeof(vertices[0]))
                           indices:(GLubyte *)indices
                        indexCount:(sizeof(indices) / sizeof(indices[0]))]))
    {
        
    }
    
    return self;
}

- (void)updateWithDelta:(NSTimeInterval)delta
{
    float seconds = 2;
    self.translation = GLKVector3Make(sinf(CACurrentMediaTime() * 2 * M_PI / seconds), self.translation.y, self.translation.z);
}

@end
