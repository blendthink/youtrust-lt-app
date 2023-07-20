#version 460 core

#include <flutter/runtime_effect.glsl>

precision mediump float;

uniform vec2 uResolution;
uniform float uTime;

out vec4 fragColor;

void main() {
    vec2 fragCoord = FlutterFragCoord();

    vec3 color = vec3(0.0);

    fragColor = vec4(color, 1.0);
}
