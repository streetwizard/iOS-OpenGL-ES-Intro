//
//  Terrain.h
//  OpenGLIntroDynamicHills
//
//  Created by Streetwizard on 12/30/14.
//  Copyright (c) 2014 WizArt Interactive. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CGGeometry.h>
#import "BaseEffect.h"
#import "Vertex.h"
#import "RainbowColor.h"

@interface Terrain : NSObject

-(instancetype)initWithShader:(BaseEffect *)shader rectangle:(CGRect)rectangle;

-(void)render;

@end
