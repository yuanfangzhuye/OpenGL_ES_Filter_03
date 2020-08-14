precision highp float;
uniform sampler2D texture;
varying vec2 textureCoordsVarying;

uniform float Time;

void main() {
    float duration = 0.7;
    float maxScale = 1.1;
    float offset = 0.02;
    
    float process = mod(Time, duration) / duration;
    vec2 offsetCoords = vec2(offset, offset) * process;
    
    vec4 maskR = texture2D(texture, textureCoordsVarying + offsetCoords);
    vec4 maskB = texture2D(texture, textureCoordsVarying - offsetCoords);
    vec4 mask = texture2D(texture, textureCoordsVarying);
    
    gl_FragColor = vec4(maskR.r, mask.g, maskB.b, mask.a);
}
