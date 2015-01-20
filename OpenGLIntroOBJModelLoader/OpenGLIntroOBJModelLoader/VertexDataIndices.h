//
//  VertexDataIndices.h
//  OpenGLIntroOBJModelLoader
//
//  Created by Streetwizard on 1/19/15.
//  Copyright (c) 2015 WizArt Interactive. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VertexDataIndices : NSObject

@property (nonatomic, assign) int vertexIndex;
@property (nonatomic, assign) int textureCoordinateIndex;
@property (nonatomic, assign) int normalIndex;

-(instancetype)initWithString:(NSString*)string;

@end
