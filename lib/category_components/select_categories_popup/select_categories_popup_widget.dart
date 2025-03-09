import '/backend/backend.dart';
import '/category_components/post_to_category_tag/post_to_category_tag_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';
import 'select_categories_popup_model.dart';
export 'select_categories_popup_model.dart';

class SelectCategoriesPopupWidget extends StatefulWidget {
  const SelectCategoriesPopupWidget({super.key});

  @override
  State<SelectCategoriesPopupWidget> createState() =>
      _SelectCategoriesPopupWidgetState();
}

class _SelectCategoriesPopupWidgetState
    extends State<SelectCategoriesPopupWidget> with TickerProviderStateMixin {
  late SelectCategoriesPopupModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SelectCategoriesPopupModel());

    animationsMap.addAll({
      'staggeredViewOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 300.0.ms,
            duration: 400.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 300.0.ms,
            duration: 400.0.ms,
            begin: const Offset(0.0, 20.0),
            end: const Offset(0.0, 0.0),
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
    context.watch<FFAppState>();

    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(5.0, 15.0, 5.0, 5.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).primaryBackground,
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(0.0),
            bottomRight: Radius.circular(0.0),
            topLeft: Radius.circular(15.0),
            topRight: Radius.circular(15.0),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
                  child: Container(
                    width: 50.0,
                    height: 3.0,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          FlutterFlowTheme.of(context).primary,
                          FlutterFlowTheme.of(context).secondary
                        ],
                        stops: const [0.0, 1.0],
                        begin: const AlignmentDirectional(0.0, -1.0),
                        end: const AlignmentDirectional(0, 1.0),
                      ),
                      borderRadius: BorderRadius.circular(3.0),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Align(
                        alignment: const AlignmentDirectional(0.0, -1.0),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              5.0, 15.0, 0.0, 0.0),
                          child: Text(
                            'Select categories to post to',
                            style: FlutterFlowTheme.of(context)
                                .titleLarge
                                .override(
                                  font: FlutterFlowTheme.of(context).titleLarge,
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Icon(
                        Icons.info_outline_rounded,
                        color: FlutterFlowTheme.of(context).secondaryText,
                        size: 24.0,
                      ),
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              5.0, 0.0, 0.0, 0.0),
                          child: Text(
                            'Only select categories your quote applies to (2 Max.)',
                            textAlign: TextAlign.start,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: FlutterFlowTheme.of(context).bodyMedium,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(5.0, 15.0, 5.0, 15.0),
                child: FutureBuilder<List<CategoriesRecord>>(
                  future: FFAppState().getAllCategories(
                    requestFn: () => queryCategoriesRecordOnce(
                      queryBuilder: (categoriesRecord) => categoriesRecord
                          .where(
                            'isDisabled',
                            isEqualTo: false,
                          )
                          .orderBy('ranking'),
                    ),
                  ),
                  builder: (context, snapshot) {
                    // Customize what your widget looks like when it's loading.
                    if (!snapshot.hasData) {
                      return Center(
                        child: SizedBox(
                          width: 50.0,
                          height: 50.0,
                          child: SpinKitFadingFour(
                            color: FlutterFlowTheme.of(context).secondary,
                            size: 50.0,
                          ),
                        ),
                      );
                    }
                    List<CategoriesRecord> staggeredViewCategoriesRecordList =
                        snapshot.data!;

                    return MasonryGridView.builder(
                      gridDelegate:
                          const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                      ),
                      crossAxisSpacing: 10.0,
                      mainAxisSpacing: 10.0,
                      itemCount: staggeredViewCategoriesRecordList.length,
                      itemBuilder: (context, staggeredViewIndex) {
                        final staggeredViewCategoriesRecord =
                            staggeredViewCategoriesRecordList[
                                staggeredViewIndex];
                        return Visibility(
                          visible: (staggeredViewCategoriesRecord.reference !=
                                  FFAppState().followingCategoryReference) &&
                              (staggeredViewCategoriesRecord.reference !=
                                  FFAppState().premiumQuotesCategoryRef) &&
                              (staggeredViewCategoriesRecord.reference !=
                                  FFAppState().recommendedCategoryRef),
                          child: wrapWithModel(
                            model: _model.postToCategoryTagModels.getModel(
                              staggeredViewCategoriesRecord.reference.id,
                              staggeredViewIndex,
                            ),
                            updateCallback: () => safeSetState(() {}),
                            updateOnChange: true,
                            child: PostToCategoryTagWidget(
                              key: Key(
                                'Keyqsv_${staggeredViewCategoriesRecord.reference.id}',
                              ),
                              categoryDoc: staggeredViewCategoriesRecord,
                            ),
                          ),
                        );
                      },
                    ).animateOnPageLoad(
                        animationsMap['staggeredViewOnPageLoadAnimation']!);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
