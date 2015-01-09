varying lowp vec4 fragColor;
varying lowp vec2 fragTextureCoordinate;

uniform sampler2D uniformTexture;
uniform sampler2D uniformMask;

void main(void)
{
    //gl_FragColor = fragColor * texture2D(uniformTexture, fragTextureCoordinate);
    //gl_FragColor = texture2D(uniformTexture, fragTextureCoordinate);
    
    lowp vec4 textureColor = texture2D(uniformTexture, fragTextureCoordinate);
    lowp vec4 maskColor = texture2D(uniformMask, fragTextureCoordinate);
    
    gl_FragColor = vec4(textureColor.r, textureColor.g, textureColor.b, maskColor.a * textureColor.a);
}