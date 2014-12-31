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

-(instancetype)initWithName:(char *)name
                     shader:(BaseEffect *)shader
                   vertices:(Vertex *)vertices
                vertexCount:(unsigned int)vertexCount
                    indices:(GLubyte *)indices
                 indexCount:(unsigned int)indexCount;

- (void)renderModel;

@end
