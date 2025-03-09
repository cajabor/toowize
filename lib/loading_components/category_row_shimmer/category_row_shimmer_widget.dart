import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'category_row_shimmer_model.dart';
export 'category_row_shimmer_model.dart';

class CategoryRowShimmerWidget extends StatefulWidget {
  const CategoryRowShimmerWidget({super.key});

  @override
  State<CategoryRowShimmerWidget> createState() =>
      _CategoryRowShimmerWidgetState();
}

class _CategoryRowShimmerWidgetState extends State<CategoryRowShimmerWidget>
    with TickerProviderStateMixin {
  late CategoryRowShimmerModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CategoryRowShimmerModel());

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
      'containerOnPageLoadAnimation3': AnimationInfo(
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
      'containerOnPageLoadAnimation4': AnimationInfo(
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
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Align(
            alignment: const AlignmentDirectional(0.0, 0.0),
            child: Container(
              width: 100.0,
              height: 60.0,
              decoration: BoxDecoration(
                color: const Color(0xFFC1C1BD),
                borderRadius: BorderRadius.circular(25.0),
              ),
              alignment: const AlignmentDirectional(0.0, 0.0),
            ).animateOnPageLoad(
                animationsMap['containerOnPageLoadAnimation1']!),
          ),
          Align(
            alignment: const AlignmentDirectional(0.0, 0.0),
            child: Container(
              width: 100.0,
              height: 60.0,
              decoration: BoxDecoration(
                color: const Color(0xFFC1C1BD),
                borderRadius: BorderRadius.circular(25.0),
              ),
              alignment: const AlignmentDirectional(0.0, 0.0),
            ).animateOnPageLoad(
                animationsMap['containerOnPageLoadAnimation2']!),
          ),
          Align(
            alignment: const AlignmentDirectional(0.0, 0.0),
            child: Container(
              width: 100.0,
              height: 60.0,
              decoration: BoxDecoration(
                color: const Color(0xFFC1C1BD),
                borderRadius: BorderRadius.circular(25.0),
              ),
              alignment: const AlignmentDirectional(0.0, 0.0),
            ).animateOnPageLoad(
                animationsMap['containerOnPageLoadAnimation3']!),
          ),
          Align(
            alignment: const AlignmentDirectional(0.0, 0.0),
            child: Container(
              width: 100.0,
              height: 60.0,
              decoration: BoxDecoration(
                color: const Color(0xFFC1C1BD),
                borderRadius: BorderRadius.circular(25.0),
              ),
              alignment: const AlignmentDirectional(0.0, 0.0),
            ).animateOnPageLoad(
                animationsMap['containerOnPageLoadAnimation4']!),
          ),
        ].divide(const SizedBox(width: 12.0)),
      ),
    );
  }
}
