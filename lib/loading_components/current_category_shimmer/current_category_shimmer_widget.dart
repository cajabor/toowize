import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'current_category_shimmer_model.dart';
export 'current_category_shimmer_model.dart';

class CurrentCategoryShimmerWidget extends StatefulWidget {
  const CurrentCategoryShimmerWidget({super.key});

  @override
  State<CurrentCategoryShimmerWidget> createState() =>
      _CurrentCategoryShimmerWidgetState();
}

class _CurrentCategoryShimmerWidgetState
    extends State<CurrentCategoryShimmerWidget> with TickerProviderStateMixin {
  late CurrentCategoryShimmerModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CurrentCategoryShimmerModel());

    animationsMap.addAll({
      'containerOnPageLoadAnimation1': AnimationInfo(
        loop: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ShimmerEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            color: const Color(0x80FFFFFF),
            angle: 1.396,
          ),
        ],
      ),
      'containerOnPageLoadAnimation2': AnimationInfo(
        loop: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ShimmerEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            color: const Color(0x80FFFFFF),
            angle: 1.396,
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
      child: Container(
        width: double.infinity,
        height: 54.0,
        constraints: const BoxConstraints(
          maxWidth: 170.0,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              FlutterFlowTheme.of(context).primary,
              FlutterFlowTheme.of(context).secondary
            ],
            stops: const [0.0, 1.0],
            begin: const AlignmentDirectional(-1.0, 0.0),
            end: const AlignmentDirectional(1.0, 0),
          ),
          borderRadius: BorderRadius.circular(25.0),
        ),
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(3.0, 0.0, 3.0, 0.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipOval(
                child: Container(
                  width: 35.0,
                  height: 35.0,
                  decoration: const BoxDecoration(
                    color: Color(0xFFC1C1BD),
                    shape: BoxShape.circle,
                  ),
                ),
              ).animateOnPageLoad(
                  animationsMap['containerOnPageLoadAnimation1']!),
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Container(
                    width: 110.0,
                    height: 20.0,
                    decoration: BoxDecoration(
                      color: const Color(0xFFC1C1BD),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ).animateOnPageLoad(
                    animationsMap['containerOnPageLoadAnimation2']!),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
