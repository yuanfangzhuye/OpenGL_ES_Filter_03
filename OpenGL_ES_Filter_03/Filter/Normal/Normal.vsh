attribute vec4 position;
attribute vec2 textureCoords;
varying vec2 textureCoordsVarying;

void main() {
    gl_Position = position;
    textureCoordsVarying = textureCoords;
}
