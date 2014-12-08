//
//  ViewController.m
//  OpenGLIntroSingleTriangle
//
//  Created by Streetwizard on 11/30/14.
//  Copyright (c) 2014 WizArt Interactive. All rights reserved.
//

#import "ViewController.h"
#import "Vertex.h"
#import "BaseEffect.h"

@interface ViewController ()

@end

@implementation ViewController
{
    GLuint _vertexBuffer;
    GLuint _indexBuffer;
    
    BaseEffect *_shader;
    
    GLsizei _indexCount;
}

- (void)setupVertexBuffer
{
    
    const static Vertex vertices[] =
    {
        {{1, -1, 0}, {1, 0, 0, 1}},     //v0, Red
        {{1, 1, 0}, {0, 1, 0, 1} },     //v1, Green
        {{-1, 1, 0}, {0, 0, 1, 1}},     //v2, Blue
        {{-1, -1, 0}, {0, 0, 0, 0}}     //v3, Black
    };
    
    const static GLubyte indices[] =
    {
        0, 1, 2,
        2, 3, 0
    };
    
    _indexCount = sizeof(indices) / sizeof(indices[0]);
    
    glGenBuffers(1, &_vertexBuffer);
    glBindBuffer(GL_ARRAY_BUFFER, _vertexBuffer);
    glBufferData(GL_ARRAY_BUFFER, sizeof(vertices), vertices, GL_STATIC_DRAW);
    
    glGenBuffers(1, &_indexBuffer);
    glBindBuffer(GL_ELEMENT_ARRAY_BUFFER, _indexBuffer);
    glBufferData(GL_ELEMENT_ARRAY_BUFFER, sizeof(indices), indices, GL_STATIC_DRAW);
}

- (void)setupShader
{
    _shader = [[BaseEffect alloc] initWithVertexShader:@"SimpleVertex.glsl" fragmentShader:@"SimpleFragment.glsl"];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    GLKView *view = (GLKView *)self.view;
    view.context = [[EAGLContext alloc] initWithAPI:kEAGLRenderingAPIOpenGLES2];
    
    [EAGLContext setCurrentContext:view.context];
    
    [self setupShader];
    [self setupVertexBuffer];
}

- (void)glkView:(GLKView *)view drawInRect:(CGRect)rect
{
    glClearColor(0, 104.0/255.0, 55.0/255.0, 1.0);
    glClear(GL_COLOR_BUFFER_BIT);
    
    [_shader prepareToDraw];
    
    glEnableVertexAttribArray(VertexAttributePosition);
    glVertexAttribPointer(VertexAttributePosition, 3, GL_FLOAT, GL_FALSE, sizeof(Vertex), (const GLvoid *) offsetof(Vertex, Position));
    
    
    glEnableVertexAttribArray(VertexAttributeColor);
    glVertexAttribPointer(VertexAttributeColor, 4, GL_FLOAT, GL_FALSE, sizeof(Vertex), (const GLvoid *) offsetof(Vertex, Color));
    
    glBindBuffer(GL_ARRAY_BUFFER, _vertexBuffer);
    glBindBuffer(GL_ELEMENT_ARRAY_BUFFER, _indexBuffer);
    //glDrawArrays(GL_TRIANGLES, 0, 3);
    glDrawElements(GL_TRIANGLES, _indexCount, GL_UNSIGNED_BYTE, 0);
    
    glDisableVertexAttribArray(VertexAttributePosition);
    glDisableVertexAttribArray(VertexAttributeColor);
}

@end
