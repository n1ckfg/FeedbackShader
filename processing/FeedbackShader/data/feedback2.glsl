uniform sampler2D tex0; 
uniform float time; 
uniform vec2 resolution;
uniform float cells = 50.0;

const float strength = 0.4;
const float amp = 0.12;
const float freq = 5.0;

void mainImage(out vec4 fragColor, in vec2 fragCoord) {
    vec2 uv = fragCoord.xy / resolution.xy;
    uv = vec2(uv.x, abs(1.0 - uv.y));
    vec3 texCol = texture2D(tex0, uv).xyz;

    vec3 shiftCol = texCol + amp * sin(time * freq);

    float rampHLines = mod(uv.x * cells, 1.0) * strength;
    float rampVLines = mod(uv.y * cells, 1.0) * strength;

    vec3 col = shiftCol;
    col.g += rampHLines;
    col.r += rampVLines;

    fragColor = vec4(col, 1.0);
}

void main() {
    mainImage(gl_FragColor, gl_FragCoord.xy);
}