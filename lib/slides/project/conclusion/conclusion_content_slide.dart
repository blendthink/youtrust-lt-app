import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:youtrust_lt_app/components/display_title.dart';
import 'package:youtrust_lt_app/shortcuts/app_intents.dart';
import 'package:youtrust_lt_app/slides/agenda/agenda_slide.dart';
import 'package:youtrust_lt_app/slides/project/conclusion/conclusion_slide.dart';

class ConclusionContentSlide extends StatelessWidget {
  const ConclusionContentSlide({super.key});

  static const path = '/11';

  @override
  Widget build(BuildContext context) {
    const body = Center(
      child: DisplayTitle(agendaTitle04),
    );

    return WillPopScope(
      onWillPop: () async => false,
      child: Actions(
        actions: <Type, Action<Intent>>{
          BackIntent: _BackAction(context),
          NextIntent: _NextAction(context),
        },
        child: const Focus(
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
  void invoke(NextIntent intent) {
    context.push(ConclusionSlide.path);
  }
}
