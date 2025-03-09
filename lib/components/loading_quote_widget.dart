import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'loading_quote_model.dart';
export 'loading_quote_model.dart';

class LoadingQuoteWidget extends StatefulWidget {
  const LoadingQuoteWidget({super.key});

  @override
  State<LoadingQuoteWidget> createState() => _LoadingQuoteWidgetState();
}

class _LoadingQuoteWidgetState extends State<LoadingQuoteWidget>
    with TickerProviderStateMixin {
  late LoadingQuoteModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LoadingQuoteModel());

    animationsMap.addAll({
      'iconOnPageLoadAnimation': AnimationInfo(
        loop: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.bounceOut,
            delay: 0.0.ms,
            duration: 990.0.ms,
            begin: const Offset(0.0, 0.0),
            end: const Offset(0.0, 19.0),
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 990.0.ms,
            duration: 600.0.ms,
            begin: const Offset(0.0, 0.0),
            end: const Offset(0.0, -51.0),
          ),
        ],
      ),
    });
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const AlignmentDirectional(0.0, 0.0),
      child: Icon(
        Icons.format_quote,
        color: FlutterFlowTheme.of(context).primary,
        size: 40.0,
      ).animateOnPageLoad(animationsMap['iconOnPageLoadAnimation']!),
    );
  }
}
