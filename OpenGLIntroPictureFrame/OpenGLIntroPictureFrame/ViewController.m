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
#import "MaskedTexture.h"

@interface ViewController ()
@end

@implementation ViewController
{
    BaseEffect* _shader;
    
    MaskedTexture* _pictureFrame;
    MaskedTexture* _picture;
}

- (void)setupScene
{
    _shader = [[BaseEffect alloc] initWithVertexShader:@"SimpleVertex.glsl" fragmentShader:@"SimpleFragment.glsl"];
    
    _pictureFrame = [[MaskedTexture alloc]initWithShader:_shader texture:@"picture_frame.png" mask:nil];
    _picture = [[MaskedTexture alloc]initWithShader:_shader texture:@"picture.png" mask:@"picture_frame_mask.png"];
    _picture.translation = GLKVector3Make(0.0f, 0.0f, 0.1f);
    
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
    glClearColor(0, 104.0/255.0, 55.0/255.0, 1.0);
    glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
    glEnable(GL_DEPTH_TEST);
    glEnable(GL_CULL_FACE);
    glEnable(GL_BLEND);
    glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);
    
    GLKMatrix4 viewMatrix = GLKMatrix4MakeTranslation(0.0, 0.0f, -5.0f);
    
    //[_pictureFrame renderModelWithParentModelViewMatrix:viewMatrix];
    [_picture renderModelWithParentModelViewMatrix:viewMatrix];
}

- (void)update
{
    //[_square updateWithDelta:self.timeSinceLastUpdate];
}

@end
