//
//  Material.m
//  OpenGLIntroOBJModelLoader
//
//  Created by Streetwizard on 1/16/15.
//  Copyright (c) 2015 WizArt Interactive. All rights reserved.
//

#import "Material.h"

@implementation Material

-(instancetype)initWithName:(NSString*)name
       ambientLightingColor:(Color*)ambientLightingColor
       diffuseLightingColor:(Color*)diffuseLightingColor
      specularLightingColor:(Color*)specularLightingColor
                  shininess:(float)shininess
                      alpha:(float)alpha
{
    if((self = [super init]))
    {
        self.name = name;
        
        self.ambientLightingColor = ambientLightingColor;
        self.diffuseLightingColor = diffuseLightingColor;
        self.specularLightingColor = specularLightingColor;
        
        self.shininess = shininess;
        self.alpha = alpha;
    }
    
    return self;
}

@end
