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
#import "Mushroom.h"
#import "Sword.h"
#import "Tree.h"

@interface ViewController ()
@end

@implementation ViewController
{
    BaseEffect *_shader;
    
    //Mushroom *_mushroom;
    Sword *_sword;
    Tree *_tree;
}

- (void)setupScene
{
    _shader = [[BaseEffect alloc] initWithVertexShader:@"VertexShader.glsl" fragmentShader:@"FragmentShader.glsl"];
    [_shader setProjectionMatrix:GLKMatrix4MakePerspective(GLKMathDegreesToRadians(85.0), self.view.bounds.size.width / self.view.bounds.size.height, 1, 150)];
    
    //_mushroom = [[Mushroom alloc]initWithShader:_shader];
    //[_mushroom setTranslation:GLKVector3Make(0.0f, -1.0f, 0.0f)];
    
    _sword = [[Sword alloc]initWithShader:_shader];
    [_sword setTranslation:GLKVector3Make(0.0f, 1.5f, 0.0f)];
    
    _tree = [[Tree alloc]initWithShader:_shader];
    [_tree setTranslation:GLKVector3Make(0.0f, -2.0f, 0.0f)];
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
    glClearColor(0, 104.0/255.0, 55.0/255.0, 1.0);
    glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
    glEnable(GL_DEPTH_TEST);
    glEnable(GL_CULL_FACE);
    glEnable(GL_BLEND);
    glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);
    
    GLKMatrix4 viewMatrix = GLKMatrix4MakeTranslation(0.0, 0.0f, -5.0f);
    viewMatrix = GLKMatrix4Rotate(viewMatrix, GLKMathDegreesToRadians(20), 1, 0, 0);
    
    //[_mushroom renderModelWithParentModelViewMatrix:viewMatrix];
    [_sword renderModelWithParentModelViewMatrix:viewMatrix];
    [_tree renderModelWithParentModelViewMatrix:viewMatrix];
}

- (void)update
{
    //[_mushroom updateWithDelta:[self timeSinceLastUpdate]];
    [_sword updateWithDelta:[self timeSinceLastUpdate]];
    [_tree updateWithDelta:[self timeSinceLastUpdate]];
}

@end
