import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:youtrust_lt_app/components/display_title.dart';
import 'package:youtrust_lt_app/components/scaler_gap.dart';
import 'package:youtrust_lt_app/components/scaler_text.dart';
import 'package:youtrust_lt_app/config.dart';
import 'package:youtrust_lt_app/shortcuts/app_intents.dart';

class ConclusionSlide extends StatelessWidget {
  const ConclusionSlide({super.key});

  static const path = '/12';

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scale = context.appScale;
    final qrSize = 160 * scale;
    final framePadding = 12 * scale;

    final body = Stack(
      children: [
        Positioned(
          top: framePadding,
          right: framePadding,
          child: IconButton(
            onPressed: () {
              showLicensePage(
                context: context,
                applicationName: 'YOUTRUST LT APP',
                useRootNavigator: true,
              );
            },
            icon: const Icon(Icons.info_outline),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const DisplayTitle('Thank you for watching'),
            const ScalerGap(32),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    QrImageView(
                      data: 'https://github.com/blendthink/youtrust-lt-app',
                      size: qrSize,
                      backgroundColor: Colors.white,
                    ),
                    const ScalerGap(8),
                    ScalerText(
                      text: 'GitHub ( youtrust-lt-app )',
                      style: theme.textTheme.labelLarge,
                    ),
                  ],
                ),
                Column(
                  children: [
                    QrImageView(
                      data: 'https://twitter.com/blendthink',
                      size: qrSize,
                      backgroundColor: Colors.white,
                    ),
                    const ScalerGap(8),
                    ScalerText(
                      text: 'Twitter',
                      style: theme.textTheme.labelLarge,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ],
    );

    return WillPopScope(
      onWillPop: () async => false,
      child: Actions(
        actions: <Type, Action<Intent>>{
          BackIntent: _BackAction(context),
          NextIntent: _NextAction(context),
        },
        child: Focus(
          autofocus: true,
          child: Scaffold(
            body: body,
          ),
        ),
      ),
    );
  }
}

class _BackAction extends Action<BackIntent> {
  _BackAction(this.context);

  final BuildContext context;

  @override
  void invoke(BackIntent intent) {
    context.pop();
  }
}

class _NextAction extends Action<NextIntent> {
  _NextAction(this.context);

  final BuildContext context;

  @override
  void invoke(NextIntent intent) {}
}
