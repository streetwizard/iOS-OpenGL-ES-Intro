//
//  Material.h
//  OpenGLIntroOBJModelLoader
//
//  Created by Streetwizard on 1/16/15.
//  Copyright (c) 2015 WizArt Interactive. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Color.h"

@interface Material : NSObject

@property (nonatomic, strong) NSString *name;

@property (nonatomic, strong) Color *ambientLightingColor;
@property (nonatomic, strong) Color *diffuseLightingColor;
@property (nonatomic, strong) Color *specularLightingColor;

@property (nonatomic, assign) float shininess;
@property (nonatomic, assign) float alpha;

-(instancetype)initWithName:(NSString*)name
       ambientLightingColor:(Color*)ambientLightingColor
       diffuseLightingColor:(Color*)diffuseLightingColor
      specularLightingColor:(Color*)specularLightingColor
                  shininess:(float)shininess
                      alpha:(float)alpha;

@end
