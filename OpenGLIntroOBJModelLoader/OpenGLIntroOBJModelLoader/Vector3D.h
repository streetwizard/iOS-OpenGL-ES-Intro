//
//  Vector3D.h
//  OpenGLIntroOBJModelLoader
//
//  Created by Streetwizard on 1/16/15.
//  Copyright (c) 2015 WizArt Interactive. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Vector3D : NSObject

@property (nonatomic, assign) float X;
@property (nonatomic, assign) float Y;
@property (nonatomic, assign) float Z;

-(instancetype)initWithX:(float)xValue Y:(float)yValue Z:(float)zValue;

@end
