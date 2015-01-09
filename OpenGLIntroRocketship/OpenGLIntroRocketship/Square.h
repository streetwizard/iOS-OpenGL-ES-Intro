//
//  Square.h
//  OpenGLIntroColorScreen
//
//  Created by Streetwizard on 12/30/14.
//  Copyright (c) 2014 WizArt Interactive. All rights reserved.
//
#import "Model.h"

@interface Square : Model

-(instancetype)initWithShader:(BaseEffect *)shader;
-(instancetype)initWithShader:(BaseEffect *)shader
                       scaleX:(float)scaleX
                       scaleY:(float)scaleY
                       scaleZ:(float)scaleZ;

@end
