import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:youtrust_lt_app/shortcuts/app_intents.dart';

class IntroductionSlide extends StatelessWidget {
  const IntroductionSlide({super.key});

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
            child: Text('IntroductionSlide'),
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
  void invoke(BackPageIntent intent) {
    context.pop();
  }
}

class _NextPageAction extends Action<NextPageIntent> {
  _NextPageAction(this.context);

  final BuildContext context;

  @override
  void invoke(NextPageIntent intent) {
    // const IntroductionRoute().push(context);
  }
}
