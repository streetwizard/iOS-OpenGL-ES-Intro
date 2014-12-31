//
//  Terrain.m
//  OpenGLIntroDynamicHills
//
//  Created by Streetwizard on 12/30/14.
//  Copyright (c) 2014 WizArt Interactive. All rights reserved.
//

#import "Terrain.h"

#define hillsKeyPointsNumber 10
#define hillsSmoothSegments 10
#define hillsSmoothPoints ((hillsKeyPointsNumber - 1) * hillsSmoothSegments)
#define hillsVertices (hillsSmoothPoints * 2)

#define ARC4RANDOM_MAX 0xFFFFFFFFu
CGFloat RandomFloatRange(CGFloat min, CGFloat max)
{
    return ((double)arc4random() / ARC4RANDOM_MAX) * (max - min) + min;
}

@implementation Terrain
{
    BaseEffect* _shader;
    CGRect _rectangle;
    char * _name;
    
    GLuint _vertexBuffer;
    GLuint _vertexArrayObject;
    
    CGPoint _hillKeyPoints[hillsKeyPointsNumber];
    CGPoint _hillSmoothPoints[hillsSmoothPoints];
    
    Vertex _vertices[hillsVertices];
}

-(instancetype)initWithShader:(BaseEffect *)shader rectangle:(CGRect)rectangle
{
    if((self = [super init]))
    {
        _shader = shader;
        _name = "Terrain";
        _rectangle = rectangle;
        
        [self generateHillsKeyPointsWithRectangle:_rectangle];
        [self generateHillsSmoothPoints];
        [self generateHillsVerticesWithRectangle:_rectangle];
        
        //Create Vertex Array Object
        glGenVertexArraysOES(1, &_vertexArrayObject);
        glBindVertexArrayOES(_vertexArrayObject);
        
        // Create vertex buffer
        glGenBuffers(1, &_vertexBuffer);
        glBindBuffer(GL_ARRAY_BUFFER, _vertexBuffer);
        glBufferData(GL_ARRAY_BUFFER, (hillsVertices * sizeof(Vertex)), _vertices, GL_STATIC_DRAW);
        
        // Enable vertex attributes
        glEnableVertexAttribArray(VertexAttributePosition);
        glVertexAttribPointer(VertexAttributePosition, 3, GL_FLOAT, GL_FALSE, sizeof(Vertex), (const GLvoid *) offsetof(Vertex, Position));
        
        glEnableVertexAttribArray(VertexAttributeColor);
        glVertexAttribPointer(VertexAttributeColor, 4, GL_FLOAT, GL_FALSE, sizeof(Vertex), (const GLvoid *) offsetof(Vertex, Color));
        
        // Reset bindings
        glBindVertexArrayOES(0);
        glBindBuffer(GL_ARRAY_BUFFER, 0);
    }
    
    return self;
}

-(void)render
{
    [_shader prepareToDraw];
    
    glBindVertexArrayOES(_vertexArrayObject);
    glDrawArrays(GL_TRIANGLE_STRIP, 0, hillsVertices);
    glBindVertexArrayOES(0);
}

- (void) generateHillsKeyPointsWithRectangle:(CGRect)rectangle
{
    float startY = RandomFloatRange(rectangle.origin.y + rectangle.size.height * 0.20, rectangle.origin.y + rectangle.size.height * 0.40);
    
    float x = 0.0f;
    float y = 0.0f;
    
    _hillKeyPoints[0] = CGPointMake(_rectangle.origin.x, startY);
    NSLog(@"Key point 0: (%0.2f, %0.2f)", x, y);
    
    float sign = 1;
    
    int end = hillsKeyPointsNumber - 1;
    
    for(int i = 1; i < end; i++)
    {
        x += rectangle.size.width/(hillsKeyPointsNumber - 1);
        y += sign * RandomFloatRange(rectangle.size.height * 0.15, rectangle.size.height * 0.25);
        
        sign = -sign;
        
        _hillKeyPoints[i] = CGPointMake(x, y);
        
        NSLog(@"Key point %d: (%0.2f, %0.2f)", i, x, y);
    }
    
    _hillKeyPoints[end] = CGPointMake(rectangle.origin.x + rectangle.size.width, startY);
    
    NSLog(@"Key point %d: (%0.2f, %0.2f)", end, x, y);
}

- (void)generateHillsSmoothPoints
{
    for (int i = 0; i < hillsKeyPointsNumber; i++)
    {
        CGPoint p0 = _hillKeyPoints[i];
        CGPoint p1 = _hillKeyPoints[i + 1];
        
        float da = M_PI / (hillsSmoothSegments - 1);
        float ymid = (p0.y + p1.y) / 2;
        float ampl = (p0.y - p1.y) / 2;
        
        for (int i1 = 0; i1 < hillsSmoothSegments; i1++)
        {
            float alpha = (float)i1 / (float)(hillsSmoothSegments - 1);
            float x = (1 - alpha) * p0.x + alpha * p1.x;
            float y = ymid + ampl * cosf(da * i1);
        
            int index = (i * hillsSmoothSegments) + i1;
            _hillSmoothPoints[index] = CGPointMake(x, y);
            
            NSLog(@"Smooth point %d: (%0.2f, %0.2f)", index, x, y);
        }
    }
}

- (void)setHillVertexAtIndex:(int)index
                           x:(float)xValue
                           y:(float)yValue
                           r:(float)red
                           g:(float)green
                           b:(float)blue
                           a:(float)alpha
{
    _vertices[index].Position[0] = xValue;
    _vertices[index].Position[1] = yValue;
    _vertices[index].Position[2] = 0;
    _vertices[index].Color[0] = red;
    _vertices[index].Color[1] = green;
    _vertices[index].Color[2] = blue;
    _vertices[index].Color[3] = alpha;
    
    NSLog(@"Point %d: (%0.2f, %0.2f)", index, xValue, yValue);
}

- (void)generateHillsVerticesWithRectangle:(CGRect)rectangle
{
    for (int i = 0; i < hillsSmoothPoints; i++)
    {
        float r, g, b;
        getRainbowColor(((float)(hillsSmoothPoints - i) / (float)hillsSmoothPoints), &r, &g, &b);
        
        [self setHillVertexAtIndex:(i * 2) x:_hillSmoothPoints[i].x y:_hillSmoothPoints[i].y r:r g:g b:b a:1];
        [self setHillVertexAtIndex:((i * 2) + 1) x:_hillSmoothPoints[i].x y:rectangle.origin.y r:r g:g b:b a:1];
    }
}

@end
