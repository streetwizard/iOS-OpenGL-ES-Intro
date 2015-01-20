//
//  Model3DOBJ.h
//  OpenGLIntroOBJModelLoader
//
//  Created by Streetwizard on 1/19/15.
//  Copyright (c) 2015 WizArt Interactive. All rights reserved.
//

#import "Model.h"

@interface Model3DOBJ : Model

@property (nonatomic, assign) Vertex *vertices;

-(instancetype)initWithShader:(BaseEffect*)shader
                      OBJFile:(NSString*)objFileName
                      MTLfile:(NSString*)mtlFileName;

@end
