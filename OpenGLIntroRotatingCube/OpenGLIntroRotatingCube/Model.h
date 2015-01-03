//
//  Model.h
//  OpenGLIntroColorScreen
//
//  Created by Streetwizard on 12/30/14.
//  Copyright (c) 2014 WizArt Interactive. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseEffect.h"
#import "Vertex.h"

@interface Model : NSObject

// @property (nonatomic, strong) BaseEffect* shader;
@property (nonatomic, assign) GLKVector3 translation;

@property (nonatomic, assign) float rotationX;
@property (nonatomic, assign) float rotationY;
@property (nonatomic, assign) float rotationZ;

@property (nonatomic, assign) float scale;

-(instancetype)initWithName:(char *)name
                     shader:(BaseEffect *)shader
                   vertices:(Vertex *)vertices
                vertexCount:(unsigned int)vertexCount
                    indices:(GLubyte *)indices
                 indexCount:(unsigned int)indexCount;
- (void)updateWithDelta:(NSTimeInterval)delta;
- (void)renderModelWithParentModelViewMatrix:(GLKMatrix4)parentModelViewMatrix;

@end
