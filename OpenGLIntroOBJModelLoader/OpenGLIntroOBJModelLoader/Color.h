//
//  Color.h
//  OpenGLIntroOBJModelLoader
//
//  Created by Streetwizard on 1/16/15.
//  Copyright (c) 2015 WizArt Interactive. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Color : NSObject

@property (nonatomic, assign) float R;
@property (nonatomic, assign) float G;
@property (nonatomic, assign) float B;
@property (nonatomic, assign) float A;

-(instancetype)initWithR:(float)red G:(float)green B:(float)blue;
-(instancetype)initWithR:(float)red G:(float)green B:(float)blue A:(float)alpha;

@end
