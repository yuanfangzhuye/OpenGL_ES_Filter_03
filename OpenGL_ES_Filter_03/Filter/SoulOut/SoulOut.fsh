precision highp float;
uniform sampler2D texture;
varying vec2 textureCoordsVarying;

uniform float Time;

void main() {
    float duration = 0.7;
    float maxAlpha = 0.4;
    float maxScale = 1.8;
    
    float process = mod(Time, duration) / duration;
    float alpha = maxAlpha * (1.0 - process);
    float scale = 1.0 + (maxScale - 1.0) * process;
    
    float weakX = 0.5 + (textureCoordsVarying.x - 0.5) / scale;
    float weakY = 0.5 + (textureCoordsVarying.y - 0.5) / scale;
    
    vec2 weakTextureCoords = vec2(weakX, weakY);
    vec4 weakMask = texture2D(texture, weakTextureCoords);
    
    vec4 mask = texture2D(texture, textureCoordsVarying);
    gl_FragColor = mask * (1.0 - alpha) + weakMask * alpha;
}
