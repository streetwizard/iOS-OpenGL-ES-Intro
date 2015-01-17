//
//  OBJ.m
//  OpenGLIntroOBJModelLoader
//
//  Created by Streetwizard on 1/16/15.
//  Copyright (c) 2015 WizArt Interactive. All rights reserved.
//

#import "OBJModel.h"

@implementation OBJModel

-(instancetype)initWithOBJFile:(NSString*)objFileName
                       MTLfile:(NSString*)mtlFileName
{
    if((self = [super init]))
    {
        [self parseMTL:mtlFileName];
        
        NSLog(@"Materials: %lu", (unsigned long)[self.materials count]);
    }
    
    return self;
}

-(BOOL)parseMTL:(NSString*)mtlFileName
{
    Material *material = nil;
    
    self.materials = [NSMutableDictionary dictionary];
    
    NSError* error;
    NSString* mtlPath = [[NSBundle mainBundle]pathForResource:mtlFileName ofType:nil];
    NSString *mtlString = [NSString stringWithContentsOfFile:mtlPath encoding:NSASCIIStringEncoding error:&error];
    NSArray *mtlLines = [mtlString componentsSeparatedByCharactersInSet:[NSCharacterSet newlineCharacterSet]];
    
    if(error)
    {
        return NO;
    }
    
    for (NSString *line in mtlLines)
    {
        NSArray *components = [line componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
        
        if (components.count < 1)
        {
            continue;
        }
        
        NSString *type = (NSString*)components[0];
        
        //material name
        if([type isEqualToString:@"newmtl"])
        {
            if([components count] < 2)
            {
                continue;
            }
            
            if(material)
            {
                [self.materials setValue:material forKey:[material name]];
            }
            
            material = [[Material alloc]init];
            [material setName:[components[1] stringByReplacingOccurrencesOfString:@"." withString:@""]];
        }
        //ambient lighting color
        else if([type isEqualToString:@"Ka"])
        {
            if([components count] < 3)
            {
                continue;
            }
            
            Color *ambientLightingColor = [[Color alloc]initWithR:[components[1] floatValue]
                                                                G:[components[2] floatValue]
                                                                B:[components[3] floatValue]];
            
            [material setAmbientLightingColor:ambientLightingColor];
        }
        //diffuse lighting color
        else if([type isEqualToString:@"Kd"])
        {
            if([components count] < 3)
            {
                continue;
            }
            
            Color *diffuseLightingColor = [[Color alloc]initWithR:[components[1] floatValue]
                                                                G:[components[2] floatValue]
                                                                B:[components[3] floatValue]];
            
            [material setDiffuseLightingColor:diffuseLightingColor];
        }
        //specular lighting color
        else if([type isEqualToString:@"Ks"])
        {
            if([components count] < 3)
            {
                continue;
            }
            
            Color *specularLightingColor = [[Color alloc]initWithR:[components[1] floatValue]
                                                                 G:[components[2] floatValue]
                                                                 B:[components[3] floatValue]];
            
            [material setSpecularLightingColor:specularLightingColor];
        }
        //shininess
        else if([type isEqualToString:@"Ns"])
        {
            if([components count] < 2)
            {
                continue;
            }
            
            [material setShininess:[components[1] floatValue]];
        }
        //alpha
        else if([type isEqualToString:@"d"])
        {
            if([components count] < 2)
            {
                continue;
            }
            
            [material setAlpha:[components[1] floatValue]];
        }
    }
    
    if(material)
    {
        [self.materials setObject:material forKey:[material name]];
    }
    
    return YES;
}

@end
