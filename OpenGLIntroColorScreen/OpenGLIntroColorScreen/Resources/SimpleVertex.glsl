attribute vec4 a_Position;
attribute vec4 a_Color;

varying lowp vec4 fragColor;

void main(void)
{
    fragColor = a_Color;
    gl_Position = a_Position;
    //gl_PointSize = 16.0;
}