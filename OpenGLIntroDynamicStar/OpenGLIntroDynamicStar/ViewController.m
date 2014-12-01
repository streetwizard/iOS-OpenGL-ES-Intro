//
//  ViewController.m
//  OpenGLIntro
//
//  Created by Streetwizard on 11/11/14.
//  Copyright (c) 2014 Wizart Interactive. All rights reserved.
//

#import "ViewController.h"
#import "Vertex.h"
#import "BaseEffect.h"

@interface ViewController ()

@end

@implementation ViewController
{
    GLuint _vertexBuffer;
    BaseEffect *_shader;
    
    Vertex _vertices[STAR_PEAKS * 3 * 2];
    
    GLfloat _screenWidth;
    GLfloat _screenHeight;
}

#define DEGREES_TO_RADIANS(x) (M_PI * x / 180 )

- (void)setuptVertexBuffer
{
    NSMutableString *vertexString = [[NSMutableString alloc]init];
    
    BOOL isPair = ((STAR_PEAKS % 2) == 0) ? YES : NO;
    
    int end = STAR_PEAKS * 3 * 2;
    
    float increment = DEGREES_TO_RADIANS(360/STAR_PEAKS);
    float tethaInterior = increment/2;
    float tethaExterior = increment;
    
    GLfloat xInternal = INTERNAL_RADIUS * cosf(tethaInterior);
    GLfloat yInternal = INTERNAL_RADIUS * sinf(tethaInterior);
    
    Vertex center = {0, 0, 0};
    
    _vertices[0].Position[0] = isPair ? xInternal : yInternal;
    _vertices[0].Position[1] = isPair ? yInternal : xInternal;
    _vertices[0].Position[2] = 0;
    
    [vertexString appendFormat:@"(%0.2f,%0.2f),", _vertices[0].Position[0], _vertices[0].Position[1]];
    
    tethaInterior+=increment;
    
    for (int i=1; i<end; i+=6)
    {
        GLfloat xExternal = EXTERNAL_RADIUS * cos(tethaExterior);
        GLfloat yExternal = EXTERNAL_RADIUS * sin(tethaExterior);
        
        xInternal = INTERNAL_RADIUS * cosf(tethaInterior);
        yInternal = INTERNAL_RADIUS * sinf(tethaInterior);
        
        _vertices[i].Position[0] = isPair ? xExternal : yExternal;
        _vertices[i].Position[1] = isPair ? yExternal : xExternal;
        _vertices[i].Position[2] = 0;
        
        [vertexString appendFormat:@"(%0.2f,%0.2f),", _vertices[i].Position[0], _vertices[i].Position[1]];
        
        _vertices[i + 1].Position[0] = isPair ? xInternal : yInternal;
        _vertices[i + 1].Position[1] = isPair ? yInternal : xInternal;
        _vertices[i + 1].Position[2] = 0;
        
        [vertexString appendFormat:@"(%0.2f,%0.2f),", _vertices[i + 1].Position[0], _vertices[i + 1].Position[1]];
        
        _vertices[i + 2] = _vertices[i + 1];
        [vertexString appendFormat:@"(%0.2f,%0.2f),", _vertices[i + 2].Position[0], _vertices[i + 2].Position[1]];
        _vertices[i + 3] = _vertices[i - 1];
        [vertexString appendFormat:@"(%0.2f,%0.2f),", _vertices[i + 3].Position[0], _vertices[i + 3].Position[1]];
        _vertices[i + 4] = center;
        [vertexString appendFormat:@"(%0.2f,%0.2f),", _vertices[i + 4].Position[0], _vertices[i + 4].Position[1]];
        _vertices[i + 5] = _vertices[i + 2];
        [vertexString appendFormat:@"(%0.2f,%0.2f),", _vertices[i + 5].Position[0], _vertices[i + 5].Position[1]];
        
        tethaInterior+=increment;
        tethaExterior+=increment;
    }
    
    NSLog(@"Vertices: %@", vertexString);
    
    glGenBuffers(1, &_vertexBuffer); //1. Creates buffer on the GPU
    glBindBuffer(GL_ARRAY_BUFFER, _vertexBuffer); //2. Bind buffer to make it the active buffer on the GPU
    glBufferData(GL_ARRAY_BUFFER, sizeof(_vertices), _vertices, GL_STATIC_DRAW); // 3. Send the data to the GPU
}

- (void)setupShader
{
    _shader = [[BaseEffect alloc]
               initWithVertexShader:@"SimpleVertex.glsl" fragmentShader:@"SimpleFragment.glsl"];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    GLKView *glView = (GLKView *)[self view];
    [glView setContext:[[EAGLContext alloc]initWithAPI:kEAGLRenderingAPIOpenGLES2]];
    [EAGLContext setCurrentContext:[glView context]];
    
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    _screenWidth = screenRect.size.width;
    _screenHeight = screenRect.size.height;
    
    [self setuptVertexBuffer];
    [self setupShader];
}

- (void)glkView:(GLKView *)view drawInRect:(CGRect)rect
{
    glClearColor(0, 104.0/255, 55.0/255, 1.0);
    glClear(GL_COLOR_BUFFER_BIT);
    
    [_shader prepareToDraw];
    
    //enabling vertex attrib
    glEnableVertexAttribArray(VertexAttribPosition);
    glVertexAttribPointer(VertexAttribPosition, 3, GL_FLOAT, GL_FALSE, sizeof(Vertex), (const GLvoid *)offsetof(Vertex, Position));
    
    //binding the buffer and drawing
    
    glBindBuffer(GL_ARRAY_BUFFER, _vertexBuffer);
    glDrawArrays(GL_TRIANGLES, 0, sizeof(_vertices));
    
    //disabling the vertex attrib
    glDisableVertexAttribArray(VertexAttribPosition);
}

@end
