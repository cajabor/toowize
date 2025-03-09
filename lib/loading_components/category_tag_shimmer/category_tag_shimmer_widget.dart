import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'category_tag_shimmer_model.dart';
export 'category_tag_shimmer_model.dart';

class CategoryTagShimmerWidget extends StatefulWidget {
  const CategoryTagShimmerWidget({super.key});

  @override
  State<CategoryTagShimmerWidget> createState() =>
      _CategoryTagShimmerWidgetState();
}

class _CategoryTagShimmerWidgetState extends State<CategoryTagShimmerWidget>
    with TickerProviderStateMixin {
  late CategoryTagShimmerModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CategoryTagShimmerModel());

    animationsMap.addAll({
      'containerOnPageLoadAnimation': AnimationInfo(
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
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(17.0),
          child: Container(
            width: MediaQuery.sizeOf(context).width * 0.15,
            height: 35.0,
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
              borderRadius: BorderRadius.circular(17.0),
            ),
          ),
        ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation']!),
      ),
    );
  }
}
