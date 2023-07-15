#version 460 core

#include <flutter/runtime_effect.glsl>

precision mediump float;

uniform vec2 uResolution;
uniform float uTime;

out vec4 fragColor;

void main() {
    vec2 fragCoord = FlutterFragCoord();

    // 正規化して座標値の範囲を 0.0 から 1.0 の間に収める
    vec2 st = fragCoord.xy / uResolution;

    float pct = abs(sin(uTime));

    vec3 color = vec3(pct);

    vec2 translate = vec2(cos(uTime), sin(uTime));
    st += translate * 0.35;

    color = vec3(st.x, st.y, 0.8);

    fragColor = vec4(color, 1.0);
}
