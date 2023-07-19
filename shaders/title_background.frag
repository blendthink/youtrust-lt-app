#version 460 core

#include "utils/noise.glsl"
#include <flutter/runtime_effect.glsl>

#define OCTAVES 4
#define LACUNARITY 2.0
#define GAIN 0.5

precision mediump float;

uniform vec2 uResolution;
uniform float uTime;

out vec4 fragColor;

float fbm(in vec2 st) {
    float v = 0.0;
    float amplitude = 0.5;
    float frequency = 1.0;

    for (int i = 0; i < OCTAVES; i++) {
        v += amplitude * noise(st * frequency);
        frequency *= LACUNARITY;
        amplitude *= GAIN;
    }
    return v;
}

void main() {
    vec2 fragCoord = FlutterFragCoord();

    vec2 p = (fragCoord.xy * 2 - uResolution) / min(uResolution.x, uResolution.y);

    vec2 q = vec2(0.0);
    q.x = fbm(p + vec2(0.0));
    q.y = fbm(p + vec2(1.0));

    vec2 r = vec2(0.0);
    r.x = fbm(p + 0.5 * q + vec2(1.7, 9.2) + 0.08 * uTime);
    r.y = fbm(p + 0.05 * q + vec2(8.3, 2.8) + 0.001 * uTime);

    float f = fbm(p + r);

    vec3 color = mix(vec3(0.0), vec3(0.6, 0, 1), clamp(pow(f, 2), 0.0, 1.0));
    color = mix(color, vec3(0.0), clamp(q.x, 0.0, 1.0));
    color = mix(color, vec3(0, 0.4, 0.3), clamp(r.x, 0.0, 1.0));
    color = (pow(f, 3) + 1.8 * pow(f, 2) + 0.6 * f) * color;

    fragColor = vec4(color, 0.5);
}
