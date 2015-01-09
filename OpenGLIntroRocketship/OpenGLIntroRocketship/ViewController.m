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
#import "Square.h"
//#import "Cube.h"
#import "Cone.h"

@interface ViewController ()
@end

@implementation ViewController
{
    BaseEffect* _shader;
    Square* _square;
    //Cube* _cube;
    Cone* _cone;
    
    float _cameraRotationDegreesY;
}

- (void)setupScene
{
    _shader = [[BaseEffect alloc] initWithVertexShader:@"SimpleVertex.glsl" fragmentShader:@"SimpleFragment.glsl"];
    _square = [[Square alloc]initWithShader:_shader scaleX:10.0f scaleY:10.0f scaleZ:10.0f];
    
    _square.rotationX = -GLKMathDegreesToRadians(90);
    //_cube = [[Cube alloc]initWithShader:_shader];
    _cone = [[Cone alloc]initWithShader:_shader scaleX:0.25f scaleY:2.0f scaleZ:0.25f];
    _cone.velocity = GLKVector3Make(0, 2, 0);
    
    _cameraRotationDegreesY = 45;
    
    _shader.projectionMatrix = GLKMatrix4MakePerspective(GLKMathDegreesToRadians(85.0), self.view.bounds.size.width / self.view.bounds.size.height, 1, 150);
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    GLKView *view = (GLKView *)self.view;
    view.context = [[EAGLContext alloc] initWithAPI:kEAGLRenderingAPIOpenGLES2];
    view.drawableDepthFormat = GLKViewDrawableDepthFormat16;
    
    [EAGLContext setCurrentContext:view.context];
    
    [self setupScene];
}

- (void)glkView:(GLKView *)view drawInRect:(CGRect)rect
{
    //glClearColor(0, 104.0/255.0, 55.0/255.0, 1.0);
    glClearColor(0.0f, 0.0f, 0.0f, 1.0f);
    glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
    glEnable(GL_DEPTH_TEST);
    glEnable(GL_CULL_FACE);
    
    GLKMatrix4 viewMatrix = GLKMatrix4MakeTranslation(0.0, -1.0f, -5.0f);
    viewMatrix = GLKMatrix4Rotate(viewMatrix, GLKMathDegreesToRadians(_cameraRotationDegreesY), 1, 0, 0);
    
    //using look at function
    //GLKMatrix4 viewMatrix = GLKMatrix4MakeLookAt(0, _shakeOffset, -5, _cone.translation.x, _cone.translation.y + _shakeOffset, _cone.translation.z, 0, 1, 0);
    
    [_square renderModelWithParentModelViewMatrix:viewMatrix];
    //[_cube renderModelWithParentModelViewMatrix:viewMatrix];
    [_cone renderModelWithParentModelViewMatrix:viewMatrix];
}

- (void)update
{
    if(_cameraRotationDegreesY >= -45)
    {
        _cameraRotationDegreesY -= 20 * self.timeSinceLastUpdate;
        
        NSLog(@"Camera Rotation Y: %0.2f", _cameraRotationDegreesY);
    }
        
    //[_square updateWithDelta:self.timeSinceLastUpdate];
    //[_cube updateWithDelta:self.timeSinceLastUpdate];
    [_cone updateWithDelta:self.timeSinceLastUpdate];
}

@end
