import 'package:flutter/material.dart';
import 'package:flutter_shaders/flutter_shaders.dart';
import 'package:youtrust_lt_app/components/ticking_builder.dart';

class TitleBackgroundShader extends StatelessWidget {
  const TitleBackgroundShader({super.key});

  @override
  Widget build(BuildContext context) {
    return TickingBuilder(
      builder: (context, time) {
        return ShaderBuilder(
          assetKey: 'shaders/title_background.frag',
              (context, shader, child) => CustomPaint(
            size: MediaQuery.sizeOf(context),
            painter: _TitleShaderPainter(shader, time),
          ),
          child: const Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}

class _TitleShaderPainter extends CustomPainter {
  const _TitleShaderPainter(this.shader, this.time);

  final FragmentShader shader;
  final double time;

  @override
  void paint(Canvas canvas, Size size) {
    shader.setFloat(0, size.width);
    shader.setFloat(1, size.height);
    shader.setFloat(2, time);

    canvas.drawRect(
      Rect.fromLTWH(0, 0, size.width, size.height),
      Paint()..shader = shader,
    );
  }

  @override
  bool shouldRepaint(covariant _TitleShaderPainter oldDelegate) {
    return oldDelegate.shader != shader || oldDelegate.time != time;
  }
}
