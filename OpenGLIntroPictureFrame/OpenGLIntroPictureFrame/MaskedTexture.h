//
//  MaskedTexture.h
//  OpenGLIntroPictureFrame
//
//  Created by Streetwizard on 1/7/15.
//  Copyright (c) 2015 WizArt Interactive. All rights reserved.
//

#import "Model.h"

@interface MaskedTexture : Model

-(instancetype)initWithShader:(BaseEffect *)shader texture:(NSString *)textureFileName mask:(NSString *)mask;

@end
