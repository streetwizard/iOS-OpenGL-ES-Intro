//
//  Model3DOBJ.m
//  OpenGLIntroOBJModelLoader
//
//  Created by Streetwizard on 1/19/15.
//  Copyright (c) 2015 WizArt Interactive. All rights reserved.
//

#import "Model3DOBJ.h"

@implementation Model3DOBJ
{
    Vertex *vertices;
    
    unsigned int vertexCount;
}

-(instancetype)initWithShader:(BaseEffect*)shader
                      OBJFile:(NSString*)objFileName
                      MTLfile:(NSString*)mtlFileName
{
    
    OBJModelParser *objModel = [[OBJModelParser alloc]initWithOBJFile:objFileName MTLfile:mtlFileName];
    
    if((self = [super initWithName:"Model"
                            shader:shader
                          vertices:_vertices
                       vertexCount:vertexCount]))
    {
        
    }
    
    return self;
}

-(BOOL)loadDataFromOBJModel:(OBJModelParser*)objModel
{
    int size = [objModel.obj ];
    
    Vertex vertices[size]
    
    return YES;
}

@end
