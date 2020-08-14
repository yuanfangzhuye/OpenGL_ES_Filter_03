precision highp float;
uniform sampler2D texture;
varying vec2 textureCoordsVarying;

uniform float Time;
const float PI = 3.1415926;

float rand(float n) {
    return fract(sin(n) * 43758.5453123);
}

void main() {
    float maxJitter = 0.06;
    float duration = 0.3;
    float colorRoffset = 0.01;
    float colorBoffset = -0.025;
    
    float time = mod(Time, duration * 2.0);
    float amplitude = max(sin(time * (PI / duration)), 0.0);
    float jitter = rand(textureCoordsVarying.y) * 2.0 - 1.0;
    
    bool needOffset = abs(jitter) < maxJitter * amplitude;
    float textureX = textureCoordsVarying.x + (needOffset ? jitter : (jitter * amplitude * 0.006));
    
    vec2 textureCoords = vec2(textureX, textureCoordsVarying.y);
    
    vec4 mask = texture2D(texture, textureCoords);
    vec4 maskR = texture2D(texture, textureCoords + vec2(colorRoffset * amplitude, 0.0));
    vec4 maskB = texture2D(texture, textureCoords + vec2(colorBoffset * amplitude, 0.0));
    
    gl_FragColor = vec4(maskR.r, mask.g, maskB.b, mask.a);
}
