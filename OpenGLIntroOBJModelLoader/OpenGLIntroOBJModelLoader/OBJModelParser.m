//
//  OBJModelParser.m
//  OpenGLIntroOBJModelLoader
//
//  Created by Streetwizard on 1/19/15.
//  Copyright (c) 2015 WizArt Interactive. All rights reserved.
//

#import "OBJModelParser.h"

@implementation OBJModelParser

-(instancetype)initWithOBJFile:(NSString*)objFileName
                       MTLfile:(NSString*)mtlFileName
{
    if((self = [super init]))
    {
        self.models = [NSMutableDictionary dictionary];
        
        if(!([self parseOBJ:objFileName withMaterials:[self parseMTL:mtlFileName]]))
        {
            return nil;
        }
    }
    
    return self;
}

-(NSMutableDictionary*)parseMTL:(NSString*)mtlFileName
{
    Material *material = nil;
    
    NSMutableDictionary *materials = [NSMutableDictionary dictionary];
    
    NSError* error;
    NSString* mtlPath = [[NSBundle mainBundle]pathForResource:mtlFileName ofType:nil];
    NSString *mtlString = [NSString stringWithContentsOfFile:mtlPath encoding:NSASCIIStringEncoding error:&error];
    NSArray *mtlLines = [mtlString componentsSeparatedByCharactersInSet:[NSCharacterSet newlineCharacterSet]];
    
    if(error)
    {
        return nil;
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
                [materials setValue:material forKey:[material name]];
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
        [materials setObject:material forKey:[material name]];
    }
    
    return materials;
}

-(BOOL)parseOBJ:(NSString*)objFileName withMaterials:(NSMutableDictionary*)materials
{
    OBJModel *objModel = nil;
    OBJModelPart *objModelPart = nil;
    
    NSError* error;
    NSString* mtlPath = [[NSBundle mainBundle]pathForResource:objFileName ofType:nil];
    NSString *mtlString = [NSString stringWithContentsOfFile:mtlPath encoding:NSASCIIStringEncoding error:&error];
    NSArray *objLines = [mtlString componentsSeparatedByCharactersInSet:[NSCharacterSet newlineCharacterSet]];
    
    if(error || !materials)
    {
        return NO;
    }
    
    for(NSString *line in objLines)
    {
        NSArray *components = [line componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
        
        NSString *key = components[0];
        
        if([components count] < 1)
        {
            continue;
        }
        
        //name
        if ([key isEqualToString:@"o"])
        {
            if([components count] < 2)
            {
                continue;
            }
            
            if(objModel)
            {
                [self.models setObject:objModel forKey:[objModel name]];
            }
            
            objModel = [[OBJModel alloc] init];
            objModel.name = [components[1] stringByReplacingOccurrencesOfString:@"." withString:@""];
        }
        //vertices v
        else if ([key isEqualToString:@"v"])
        {
            if([components count] < 4)
            {
                continue;
            }
            
            Vector3D *vertex = [[Vector3D alloc]initWithX:[components[1] floatValue]
                                                        Y:[components[2] floatValue]
                                                        Z:[components[3] floatValue]];
            
            [[objModel vertices]addObject:vertex];
        }
        //texture coordinates vt
        else if ([key isEqualToString:@"vt"])
        {
            if([components count] < 3)
            {
                continue;
            }
            
            Vector2D *textureCoordinate = [[Vector2D alloc]initWithX:[components[1] floatValue]
                                                                   Y:[components[2] floatValue]];
            
            [[objModel textureCoordinates]addObject:textureCoordinate];
        }
        //normals vn
        else if ([key isEqualToString:@"vn"])
        {
            if([components count] < 4)
            {
                continue;
            }
            
            Vector3D *normal = [[Vector3D alloc]initWithX:[components[1] floatValue]
                                                        Y:[components[2] floatValue]
                                                        Z:[components[3] floatValue]];
            
            [[objModel normals]addObject:normal];
        }
        //material usemtl
        else if ([key isEqualToString:@"usemtl"])
        {
            if([components count] < 2)
            {
                continue;
            }
            
            if (objModelPart)
            {
                [objModel.objModelParts addObject:objModelPart];
            }
            
            NSString *materialName = components[1];
            
            objModelPart = [[OBJModelPart alloc] init];
            objModelPart.material = materials[materialName];
        }
        //faces f
        else if ([key isEqualToString:@"f"])
        {
            if([components count] < 4)
            {
                continue;
            }
            
            [[objModelPart faces]addObject:[[VertexDataIndices alloc] initWithString:components[1]]];
            [[objModelPart faces]addObject:[[VertexDataIndices alloc] initWithString:components[2]]];
            [[objModelPart faces]addObject:[[VertexDataIndices alloc] initWithString:components[3]]];
        }
    }
    
    if(objModelPart)
    {
        [[objModel objModelParts]addObject:objModelPart];
    }
    
    if(objModel)
    {
        [self.models setObject:objModel forKey:[objModel name]];
    }
    
    return YES;
}

@end
