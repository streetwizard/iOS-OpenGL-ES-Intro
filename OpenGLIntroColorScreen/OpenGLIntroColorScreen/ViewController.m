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

@interface ViewController ()
@end

@implementation ViewController
{
    BaseEffect* _shader;
    Square* _square;
}

- (void)setupScene
{
    _shader = [[BaseEffect alloc] initWithVertexShader:@"SimpleVertex.glsl" fragmentShader:@"SimpleFragment.glsl"];
    _square = [[Square alloc]initWithShader:_shader];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    GLKView *view = (GLKView *)self.view;
    view.context = [[EAGLContext alloc] initWithAPI:kEAGLRenderingAPIOpenGLES2];
    
    [EAGLContext setCurrentContext:view.context];
    
    [self setupScene];
}

- (void)glkView:(GLKView *)view drawInRect:(CGRect)rect
{
    glClearColor(0, 104.0/255.0, 55.0/255.0, 1.0);
    glClear(GL_COLOR_BUFFER_BIT);
    
    [_square renderModel];
}

@end
