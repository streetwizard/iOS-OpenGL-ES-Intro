//
//  OBJModel.h
//  OpenGLIntroOBJModelLoader
//
//  Created by Streetwizard on 1/16/15.
//  Copyright (c) 2015 WizArt Interactive. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Material.h"

@interface OBJModelPart : NSObject

@property (nonatomic, strong) NSMutableArray *faces;
@property (nonatomic, strong) Material *material;

-(instancetype)initWithFaces:(NSMutableArray*)faces
                    material:(Material*)material;

@end
