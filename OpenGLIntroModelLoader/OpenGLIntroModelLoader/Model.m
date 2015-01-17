//
//  Model.m
//  OpenGLIntroColorScreen
//
//  Created by Streetwizard on 12/30/14.
//  Copyright (c) 2014 WizArt Interactive. All rights reserved.
//

#import "Model.h"

@implementation Model
{
    char * _name;
    
    GLuint _vertexArrayObject;
    GLuint _vertexBuffer;
    
    unsigned int _vertexCount;
    
    BaseEffect* _shader;
}

-(instancetype)initWithName:(char *)name
                     shader:(BaseEffect *)shader
                   vertices:(Vertex *)vertices
                vertexCount:(unsigned int)vertexCount
{
    if((self = [super init]))
    {
        _name = name;
        _shader = shader;
        _vertexCount = vertexCount;
        _shader = shader;
        
        self.translation = GLKVector3Make(0, 0, 0);
        self.rotationX = 0.0f;
        self.rotationY = 0.0f;
        self.rotationZ = 0.0f;
        self.scaleX = 1.0f;
        self.scaleY = 1.0f;
        self.scaleZ = 1.0f;
        
        //Generate vertex array objects
        glGenVertexArraysOES(1, &_vertexArrayObject);
        glBindVertexArrayOES(_vertexArrayObject);
        
        // Generate vertex buffer
        glGenBuffers(1, &_vertexBuffer);
        glBindBuffer(GL_ARRAY_BUFFER, _vertexBuffer);
        glBufferData(GL_ARRAY_BUFFER, (_vertexCount * sizeof(Vertex)), vertices, GL_STATIC_DRAW);
        
        // Enabling vertex attributes
        glEnableVertexAttribArray(VertexAttributePosition);
        glVertexAttribPointer(VertexAttributePosition, 3, GL_FLOAT, GL_FALSE, sizeof(Vertex), (const GLvoid *) offsetof(Vertex, Position));
        
        glEnableVertexAttribArray(VertexAttributeColor);
        glVertexAttribPointer(VertexAttributeColor, 4, GL_FLOAT, GL_FALSE, sizeof(Vertex), (const GLvoid *) offsetof(Vertex, Color));
        
        glEnableVertexAttribArray(VertexAttributeTextureCoordinate);
        glVertexAttribPointer(VertexAttributeTextureCoordinate, 2, GL_FLOAT, GL_FALSE, sizeof(Vertex), (const GLvoid *) offsetof(Vertex, TextureCoordinate));
        
        glEnableVertexAttribArray(VertexAttributeNormal);
        glVertexAttribPointer(VertexAttributeNormal, 3, GL_FLOAT, GL_FALSE, sizeof(Vertex), (const GLvoid *) offsetof(Vertex, Normal));
        
        glBindBuffer(GL_ARRAY_BUFFER, _vertexBuffer);
        
        glBindVertexArrayOES(0);
        glBindBuffer(GL_ARRAY_BUFFER, 0);
        glBindBuffer(GL_ELEMENT_ARRAY_BUFFER, 0);
    }
    
    return self;
}

- (GLKMatrix4)modelMatrix
{
    GLKMatrix4 modelMatrix = GLKMatrix4Identity;
    
    modelMatrix = GLKMatrix4Translate(modelMatrix, self.translation.x, self.translation.y, self.translation.z);

    modelMatrix = GLKMatrix4Rotate(modelMatrix, self.rotationX, 1, 0, 0);
    modelMatrix = GLKMatrix4Rotate(modelMatrix, self.rotationY, 0, 1, 0);
    modelMatrix = GLKMatrix4Rotate(modelMatrix, self.rotationZ, 0, 0, 1);
    
    modelMatrix = GLKMatrix4Scale(modelMatrix, self.scaleX, self.scaleY, self.scaleZ);
    
    return modelMatrix;
}

- (void)updateWithDelta:(NSTimeInterval)delta
{
    
}

- (void)renderModelWithParentModelViewMatrix:(GLKMatrix4)parentModelViewMatrix
{
    GLKMatrix4 modelViewMatrix = GLKMatrix4Multiply(parentModelViewMatrix, [self modelMatrix]);
    _shader.modelViewMatrix = modelViewMatrix;
    
    [_shader setTexture:self.texture];
    [_shader setAmbientLightingColor:self.ambientLightingColor];
    [_shader setDiffuseLightingColor:self.diffuseLightingColor];
    [_shader setSpecularLightingColor:self.specularLightingColor];
    [_shader setMaterialShininess:self.materialShininess];
    
    [_shader prepareToDraw];
    
    glBindVertexArrayOES(_vertexArrayObject);
    glDrawArrays(GL_TRIANGLES, 0, _vertexCount);
    glBindVertexArrayOES(0);
}

- (void)loadTexture:(NSString *)textureFileName
{
    NSError* error;
    NSString* path = [[NSBundle mainBundle]pathForResource:textureFileName ofType:nil];
    
    NSDictionary* options = @{ GLKTextureLoaderOriginBottomLeft: @YES };
    
    GLKTextureInfo* textureInfo = [GLKTextureLoader textureWithContentsOfFile:path options:options error:&error];
    
    if(textureInfo != nil)
    {
        self.texture = textureInfo.name;
    }
    else
    {
        NSLog(@"Error loading texture file: %@", error.localizedDescription);
    }
    
}

@end
