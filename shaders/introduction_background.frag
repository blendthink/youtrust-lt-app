#version 460 core

#include "utils/random.glsl"
#include <flutter/runtime_effect.glsl>

precision mediump float;

uniform vec2 uResolution;
uniform float uTime;

out vec4 fragColor;

float text(in vec2 p, in float n) {
    p = floor(p);
    if (step(random(n), 0.5) == 0) {
        // 0
        float ellipse = pow(p.x, 2.0) / pow(4.0, 2.0) + pow(p.y, 2.0) / pow(6.0, 2.0);
        bool inEllipse = ellipse > 0.8 && ellipse < 1.2;
        return inEllipse ? 1 : 0;
    } else {
        // 1
        float headbar = -0.75 * p.x - p.y - 6;
        bool inHeadbar = smoothstep(-0.5, headbar, 0.5) == 1.0;
        if (inHeadbar && p.x > -4 && p.x < 0.0) {
            return 1;
        }
        float verticalbar = smoothstep(-0.1, p.x, 0.1) * step(abs(p.y), 6);
        float underbar = smoothstep(5.9, p.y, 6.1) * step(abs(p.x), 4);
        return underbar != 0 ? underbar : verticalbar;
    }
}

void main() {
    vec2 fragCoord = FlutterFragCoord();

    vec2 st = fragCoord / uResolution - 0.5;
    fragCoord.y -= 100.0 * uTime;

    float a = 0.0;
    a -= smoothstep(0.1, 1.4, length(st));

    float r = random(floor(fragCoord / 16.0));
    vec2 ip = mod(fragCoord, 16.0) - 8.0;
    a += text(ip, r) * (0.06 + max(0.0, 0.1 * sin(10.0 * r * uTime)));

    vec3 color = vec3(0.1, 0.3, 0.1);
    color += vec3(a);

    fragColor = vec4(color, 1.0);
}
