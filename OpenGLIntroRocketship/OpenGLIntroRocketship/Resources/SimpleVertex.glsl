
uniform highp mat4 modelViewMatrix;
uniform highp mat4 projectionMatrix;

attribute vec4 position;
attribute vec4 color;

varying lowp vec4 fragColor;

void main(void)
{
    fragColor = color;
    gl_Position = projectionMatrix * modelViewMatrix * position;
    //gl_PointSize = 16.0;
}