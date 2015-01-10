//
//  RWTBaseEffect.h
//  HelloOpenGL
//
//  Created by Ray Wenderlich on 9/3/13.
//  Copyright (c) 2013 Ray Wenderlich. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <OpenGLES/ES2/glext.h>
#import <GLKit/GLKit.h>

@interface BaseEffect : NSObject

@property (nonatomic, assign) GLuint programHandle;

@property (nonatomic, assign) GLKMatrix4 modelViewMatrix;
@property (nonatomic, assign) GLKMatrix4 projectionMatrix;

@property (nonatomic, assign) GLuint texture;

@property (nonatomic, assign) GLKVector3 ambientLightingColor;
@property (nonatomic, assign) GLfloat ambientLightingIntensity;

@property (nonatomic, assign) GLKVector3 diffuseLightingDirection;
@property (nonatomic, assign) GLfloat diffuseLightingIntensity;

@property (nonatomic, assign) GLfloat materialSpecularLightingIntensity;
@property (nonatomic, assign) float specularLightingShininess;

- (id)initWithVertexShader:(NSString *)vertexShader
            fragmentShader:(NSString *)fragmentShader;
- (void)prepareToDraw;

@end
