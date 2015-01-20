//
//  OBJ.h
//  OpenGLIntroOBJModelLoader
//
//  Created by Streetwizard on 1/16/15.
//  Copyright (c) 2015 WizArt Interactive. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OBJModel : NSObject

@property (nonatomic, strong) NSString *name;

@property (nonatomic, strong) NSMutableArray *vertices;
@property (nonatomic, strong) NSMutableArray *textureCoordinates;
@property (nonatomic, strong) NSMutableArray *normals;
@property (nonatomic, strong) NSMutableArray *objModelParts;

-(instancetype)initWithName:(NSString*)name
                    vertices:(NSMutableArray*)vertices
          textureCoordinates:(NSMutableArray*)textureCoordinates
                     normals:(NSMutableArray*)normals;
-(instancetype)initWithName:(NSString*)name
                    vertices:(NSMutableArray*)vertices
          textureCoordinates:(NSMutableArray*)textureCoordinates
                     normals:(NSMutableArray*)normals
               objModelParts:(NSMutableArray*)objModelParts;

@end
