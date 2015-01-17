//
//  Vector2D.h
//  OpenGLIntroOBJModelLoader
//
//  Created by Streetwizard on 1/16/15.
//  Copyright (c) 2015 WizArt Interactive. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Vector2D : NSObject

@property (nonatomic, assign) float X;
@property (nonatomic, assign) float Y;

-(instancetype)initWithX:(float)xValue Y:(float)yValue;

@end
