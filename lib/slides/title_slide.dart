import 'package:flutter/material.dart';
import 'package:youtrust_lt_app/router/router.dart';
import 'package:youtrust_lt_app/shortcuts/app_intents.dart';

class TitleSlide extends StatelessWidget {
  const TitleSlide({super.key});

  @override
  Widget build(BuildContext context) {
    return Actions(
      actions: <Type, Action<Intent>>{
        BackPageIntent: _BackPageAction(context),
        NextPageIntent: _NextPageAction(context),
      },
      child: const Focus(
        autofocus: true,
        child: Scaffold(
          backgroundColor: Colors.brown,
          body: Center(
            child: Text('TitleSlide'),
          ),
        ),
      ),
    );
  }
}

class _BackPageAction extends Action<BackPageIntent> {
  _BackPageAction(this.context);

  final BuildContext context;

  @override
  void invoke(BackPageIntent intent) {}
}

class _NextPageAction extends Action<NextPageIntent> {
  _NextPageAction(this.context);

  final BuildContext context;

  @override
  void invoke(NextPageIntent intent) {
    const IntroductionRoute().push(context);
  }
}
