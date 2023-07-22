#version 460 core

#include "utils/random.glsl"
#include <flutter/runtime_effect.glsl>

precision mediump float;

uniform vec2 uResolution;
uniform float uTime;

out vec4 fragColor;

float invader(in vec2 p, in float n) {
    p.x = abs(p.x);
    p.y = floor(p.y);
    return step(p.x, 2.8) * step(1.0, floor(mod(10 * n / (exp2(floor(p.x - 2.0 * p.y))), 2.8)));
}

void main() {
    vec2 fragCoord = FlutterFragCoord();

    vec2 st = fragCoord / uResolution - 0.5;
    fragCoord.y -= 100.0 * uTime;

    float a = 0.0;
    a -= smoothstep(0.1, 1.4, length(st));

    float r = random(floor(fragCoord / 16.0));
    vec2 ip = mod(fragCoord, 16.0) - 8.0;
    a += invader(ip, r) * (0.06 + max(0.0, 0.1 * sin(10.0 * r * uTime)));

    vec3 color = vec3(0.1, 0.3, 0.1);
    color += vec3(a);

    fragColor = vec4(color, 1.0);
}
