import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_shaders/flutter_shaders.dart';
import 'package:youtrust_lt_app/components/scaler_text.dart';
import 'package:youtrust_lt_app/components/ticking_builder.dart';

class TitleShader extends StatelessWidget {
  const TitleShader({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: replace with shader
    final theme = Theme.of(context);
    Widget title = ScalerText(
      text: 'How to create presentation using Flutter',
      style: theme.textTheme.headlineMedium,
    ).animate(adapter: ValueAdapter(0.5)).shimmer(
      duration: 800.ms,
      colors: [
        const Color(0xFFFFFF00),
        const Color(0xFF00FF00),
        const Color(0xFF00FFFF),
        const Color(0xFF0033FF),
      ],
    );

    title = title
        .animate(onPlay: (controller) => controller.repeat(reverse: true))
        .saturate(delay: 1.seconds, duration: 2.seconds)
        .then() // set baseline time to previous effect's end time
        .tint(color: const Color(0xFF80DDFF));

    return title;

    final width = MediaQuery.sizeOf(context).width;
    final size = Size(
      width,
      width / 16 * 3,
    );
    return TickingBuilder(
      builder: (context, time) {
        return ShaderBuilder(
          assetKey: 'shaders/title.frag',
          (context, shader, child) => CustomPaint(
            size: size,
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
