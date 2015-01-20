//
//  OBJModelParser.h
//  OpenGLIntroOBJModelLoader
//
//  Created by Streetwizard on 1/19/15.
//  Copyright (c) 2015 WizArt Interactive. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OBJModelPart.h"
#import "OBJModel.h"
#import "Material.h"
#import "Vector2D.h"
#import "Vector3D.h"
#import "VertexDataIndices.h"

@interface OBJModelParser : NSObject

@property (nonatomic, strong) NSMutableDictionary *models;

-(instancetype)initWithOBJFile:(NSString*)objFileName
                       MTLfile:(NSString*)mtlFileName;

@end
