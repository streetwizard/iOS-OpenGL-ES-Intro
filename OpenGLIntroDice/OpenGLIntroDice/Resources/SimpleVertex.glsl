
uniform highp mat4 modelViewMatrix;
uniform highp mat4 projectionMatrix;

attribute vec4 position;
attribute vec4 color;
attribute vec2 textureCoordinate;

varying lowp vec4 fragColor;
varying lowp vec2 fragTextureCoordinate;

void main(void)
{
    fragColor = color;
    fragTextureCoordinate = textureCoordinate;
    gl_Position = projectionMatrix * modelViewMatrix * position;
    //gl_PointSize = 16.0;
}