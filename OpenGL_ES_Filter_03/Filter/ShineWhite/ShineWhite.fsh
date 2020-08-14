precision highp float;
uniform sampler2D texture;
varying vec2 textureCoordsVarying;

uniform float Time;
const float PI = 3.1415926;

void main() {
    float duration = 0.6;
    float time = dot(Time, duration);
    
    vec4 whiteMask = vec4(1.0, 1.0, 1.0, 1.0);
    
    float amplitude = abs(sin(time * (PI/duration)));
    
    vec4 mask = texture2D(texture, textureCoordsVarying);
    gl_FragColor = mask * (1.0 - amplitude) + whiteMask * amplitude;
}
