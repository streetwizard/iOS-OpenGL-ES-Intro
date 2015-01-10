varying lowp vec4 fragColor;
varying lowp vec2 fragTextureCoordinate;
varying lowp vec3 fragNormal;
varying lowp vec3 fragPosition;

uniform sampler2D uniformTexture;

uniform highp float uniformMaterialSpecularIntensity;
uniform highp float uniformShinines;

struct Light
{
    lowp vec3 Color;
    
    lowp float AmbientIntensity;
    
    lowp float DiffuseIntensity;
    lowp vec3 DiffuseDirection;
};

uniform Light uniformLight;

void main(void)
{
    //ambient lighting
    lowp vec3 ambientLightingColor = uniformLight.Color * uniformLight.AmbientIntensity;
    
    //diffuse lighting
    lowp vec3 normal = normalize(fragNormal);
    lowp float diffuseFactor = max(-dot(normal, uniformLight.DiffuseDirection), 0.0);
    lowp vec3 diffuseLightingColor = uniformLight.Color * uniformLight.DiffuseIntensity * diffuseFactor;
    
    //specular lighting
    lowp vec3 eye = normalize(fragPosition);
    lowp vec3 reflection = reflect(uniformLight.DiffuseDirection, normal);
    lowp float specularFactor = pow(max(0.0, -dot(reflection, eye)), uniformShinines);
    lowp vec3 specularLightingColor = uniformLight.Color * uniformMaterialSpecularIntensity * specularFactor;
    
    gl_FragColor = texture2D(uniformTexture, fragTextureCoordinate) * vec4((ambientLightingColor + diffuseLightingColor + specularLightingColor), 1.0);
}