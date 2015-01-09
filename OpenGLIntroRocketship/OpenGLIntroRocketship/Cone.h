//
//  Cone.h
//  OpenGLIntroRocketship
//
//  Created by Streetwizard on 1/6/15.
//  Copyright (c) 2015 WizArt Interactive. All rights reserved.
//

#import "Model.h"

@interface Cone : Model

-(instancetype)initWithShader:(BaseEffect *)shader;
-(instancetype)initWithShader:(BaseEffect *)shader
                       scaleX:(float)scaleX
                       scaleY:(float)scaleY
                       scaleZ:(float)scaleZ;

@end
