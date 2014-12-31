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
    GLuint _indexBuffer;
    
    unsigned int _vertexCount;
    unsigned int _indexCount;
    
    BaseEffect* _shader;
}

-(instancetype)initWithName:(char *)name
                     shader:(BaseEffect *)shader
                   vertices:(Vertex *)vertices
                vertexCount:(unsigned int)vertexCount
                    indices:(GLubyte *)indices
                 indexCount:(unsigned int)indexCount
{
    if((self = [super init]))
    {
        _name = name;
        _shader = shader;
        _vertexCount = vertexCount;
        _indexCount = indexCount;
        _shader = shader;
        
        //Generate vertex array objects
        glGenVertexArraysOES(1, &_vertexArrayObject);
        glBindVertexArrayOES(_vertexArrayObject);
        
        // Generate vertex buffer
        glGenBuffers(1, &_vertexBuffer);
        glBindBuffer(GL_ARRAY_BUFFER, _vertexBuffer);
        glBufferData(GL_ARRAY_BUFFER, (_vertexCount * sizeof(Vertex)), vertices, GL_STATIC_DRAW);
        
        // Generate index buffer
        glGenBuffers(1, &_indexBuffer);
        glBindBuffer(GL_ELEMENT_ARRAY_BUFFER, _indexBuffer);
        glBufferData(GL_ELEMENT_ARRAY_BUFFER, (_indexCount * sizeof(GLubyte)), indices, GL_STATIC_DRAW);
        
        // Enabling vertex attributes
        glEnableVertexAttribArray(VertexAttributePosition);
        glVertexAttribPointer(VertexAttributePosition, 3, GL_FLOAT, GL_FALSE, sizeof(Vertex), (const GLvoid *) offsetof(Vertex, Position));
        
        glEnableVertexAttribArray(VertexAttributeColor);
        glVertexAttribPointer(VertexAttributeColor, 4, GL_FLOAT, GL_FALSE, sizeof(Vertex), (const GLvoid *) offsetof(Vertex, Color));
        
        glBindBuffer(GL_ARRAY_BUFFER, _vertexBuffer);
        glBindBuffer(GL_ELEMENT_ARRAY_BUFFER, _indexBuffer);
        
        glBindVertexArrayOES(0);
        glBindBuffer(GL_ARRAY_BUFFER, 0);
        glBindBuffer(GL_ELEMENT_ARRAY_BUFFER, 0);
    }
    
    return self;
}

- (void)renderModel
{
    
    [_shader prepareToDraw];
    
    glBindVertexArrayOES(_vertexArrayObject);
    //glDrawArrays(GL_TRIANGLES, 0, 3);
    glDrawElements(GL_TRIANGLES, _indexCount, GL_UNSIGNED_BYTE, 0);
    glBindVertexArrayOES(0);
}

@end
