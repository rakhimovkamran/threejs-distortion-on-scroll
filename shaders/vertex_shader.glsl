uniform sampler2D uTexture;
uniform vec2 uOffset;

varying vec2 vUv;

float M_PI = 3.141529;

vec3 deformationCurve(vec3 position, vec2 uv, vec2 offset) {
    position.y = position.y + (sin(uv.x * M_PI) * offset.y);
    return position;
}

void main(){
    vUv = uv;

    vec3 curvedPosition = deformationCurve(position, uv, uOffset);



    gl_Position = projectionMatrix * modelViewMatrix * vec4(curvedPosition, 1.0);
}

