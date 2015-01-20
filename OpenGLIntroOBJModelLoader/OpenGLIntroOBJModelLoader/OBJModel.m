//
//  OBJ.m
//  OpenGLIntroOBJModelLoader
//
//  Created by Streetwizard on 1/16/15.
//  Copyright (c) 2015 WizArt Interactive. All rights reserved.
//

#import "OBJModel.h"

@implementation OBJModel

-(instancetype)init
{
    if((self = [super init]))
    {
        self.name = nil;
        self.vertices = [NSMutableArray array];
        self.textureCoordinates = [NSMutableArray array];
        self.normals = [NSMutableArray array];
        self.objModelParts = [NSMutableArray array];
    }
    
    return self;
}

-(instancetype)initWithName:(NSString*)name
                    vertices:(NSMutableArray*)vertices
          textureCoordinates:(NSMutableArray*)textureCoordinates
                     normals:(NSMutableArray*)normals
{
    if((self = [self initWithName:name
                         vertices:vertices
               textureCoordinates:textureCoordinates
                          normals:normals
                    objModelParts:[NSMutableArray array]]))
    {
        
    }
    
    return self;
}

-(instancetype)initWithName:(NSString*)name
                    vertices:(NSMutableArray*)vertices
          textureCoordinates:(NSMutableArray*)textureCoordinates
                     normals:(NSMutableArray*)normals
               objModelParts:(NSMutableArray*)objModelParts
{
    if((self = [super init]))
    {
        self.name = name;
        self.vertices = vertices;
        self.textureCoordinates = textureCoordinates;
        self.normals = normals;
        self.objModelParts = objModelParts;
    }
    
    return self;
}


@end
