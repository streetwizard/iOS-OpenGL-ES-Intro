varying lowp vec4 fragColor;
varying lowp vec2 fragTextureCoordinate;

uniform sampler2D uniformTexture;

void main(void)
{
    //gl_FragColor = fragColor * texture2D(uniformTexture, fragTextureCoordinate);
    gl_FragColor = texture2D(uniformTexture, fragTextureCoordinate);
}