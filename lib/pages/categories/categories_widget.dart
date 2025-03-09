import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/category_components/category_card/category_card_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'categories_model.dart';
export 'categories_model.dart';

class CategoriesWidget extends StatefulWidget {
  const CategoriesWidget({super.key});

  @override
  State<CategoriesWidget> createState() => _CategoriesWidgetState();
}

class _CategoriesWidgetState extends State<CategoriesWidget>
    with TickerProviderStateMixin {
  late CategoriesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CategoriesModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'categories'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('CATEGORIES_PAGE_categories_ON_INIT_STATE');
      logFirebaseEvent('categories_update_page_state');
      _model.searchStarted = false;
      safeSetState(() {});
    });

    _model.tabBarController = TabController(
      vsync: this,
      length: 3,
      initialIndex: 0,
    )..addListener(() => safeSetState(() {}));
    _model.categorySearchTextFieldTextController ??= TextEditingController();
    _model.categorySearchTextFieldFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<CategoriesRecord>>(
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
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: SpinKitFadingFour(
                  color: FlutterFlowTheme.of(context).secondary,
                  size: 50.0,
                ),
              ),
            ),
          );
        }
        List<CategoriesRecord> categoriesCategoriesRecordList = snapshot.data!;

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(80.0),
              child: AppBar(
                backgroundColor:
                    FlutterFlowTheme.of(context).secondaryBackground,
                automaticallyImplyLeading: false,
                leading: FlutterFlowIconButton(
                  borderColor: Colors.transparent,
                  borderRadius: 30.0,
                  borderWidth: 1.0,
                  buttonSize: 60.0,
                  icon: Icon(
                    Icons.chevron_left_rounded,
                    color: FlutterFlowTheme.of(context).primaryText,
                    size: 30.0,
                  ),
                  onPressed: () async {
                    logFirebaseEvent(
                        'CATEGORIES_chevron_left_rounded_ICN_ON_T');
                    logFirebaseEvent('IconButton_navigate_back');
                    context.pop();
                  },
                ),
                actions: const [],
                flexibleSpace: FlexibleSpaceBar(
                  title: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      logFirebaseEvent('CATEGORIES_PAGE_Text_5g283yl8_ON_TAP');
                      logFirebaseEvent('Text_navigate_back');
                      context.safePop();
                    },
                    child: Text(
                      'Categories',
                      style: FlutterFlowTheme.of(context)
                          .headlineMedium
                          .override(
                            font: FlutterFlowTheme.of(context).headlineMedium,
                            color: FlutterFlowTheme.of(context).primaryText,
                            fontSize: 22.0,
                            letterSpacing: 0.0,
                          ),
                    ),
                  ),
                  centerTitle: false,
                  expandedTitleScale: 1.0,
                ),
                toolbarHeight: double.infinity,
                elevation: 0.0,
              ),
            ),
            body: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Align(
                        alignment: const Alignment(0.0, 0),
                        child: TabBar(
                          labelColor: FlutterFlowTheme.of(context).primaryText,
                          unselectedLabelColor:
                              FlutterFlowTheme.of(context).secondaryText,
                          labelStyle: FlutterFlowTheme.of(context)
                              .labelSmall
                              .override(
                                font: FlutterFlowTheme.of(context).labelSmall,
                                letterSpacing: 0.0,
                              ),
                          unselectedLabelStyle: const TextStyle(),
                          indicatorColor: FlutterFlowTheme.of(context).primary,
                          padding: const EdgeInsets.all(4.0),
                          tabs: const [
                            Tab(
                              text: 'All',
                              icon: Icon(
                                Icons.all_inclusive_sharp,
                              ),
                            ),
                            Tab(
                              text: 'Popular',
                              icon: Icon(
                                Icons.star,
                              ),
                            ),
                            Tab(
                              text: 'Favorites',
                              icon: Icon(
                                Icons.favorite_sharp,
                              ),
                            ),
                          ],
                          controller: _model.tabBarController,
                          onTap: (i) async {
                            [() async {}, () async {}, () async {}][i]();
                          },
                        ),
                      ),
                      Expanded(
                        child: TabBarView(
                          controller: _model.tabBarController,
                          physics: const NeverScrollableScrollPhysics(),
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Container(
                                    width: double.infinity,
                                    height: 45.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      boxShadow: const [
                                        BoxShadow(
                                          blurRadius: 3.0,
                                          color: Color(0x33000000),
                                          offset: Offset(
                                            0.0,
                                            1.0,
                                          ),
                                        )
                                      ],
                                      borderRadius: BorderRadius.circular(40.0),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          16.0, 0.0, 12.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Icon(
                                            Icons.search_rounded,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            size: 24.0,
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(4.0, 0.0, 0.0, 0.0),
                                              child: SizedBox(
                                                width: 200.0,
                                                child: TextFormField(
                                                  controller: _model
                                                      .categorySearchTextFieldTextController,
                                                  focusNode: _model
                                                      .categorySearchTextFieldFocusNode,
                                                  onChanged: (_) =>
                                                      EasyDebounce.debounce(
                                                    '_model.categorySearchTextFieldTextController',
                                                    const Duration(milliseconds: 500),
                                                    () => safeSetState(() {}),
                                                  ),
                                                  autofocus: false,
                                                  textInputAction:
                                                      TextInputAction.search,
                                                  obscureText: false,
                                                  decoration: InputDecoration(
                                                    labelStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .labelMedium
                                                        .override(
                                                          font: FlutterFlowTheme
                                                                  .of(context)
                                                              .labelMedium,
                                                          letterSpacing: 0.0,
                                                        ),
                                                    hintText:
                                                        'Search all categories...',
                                                    hintStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .labelMedium
                                                        .override(
                                                          font: FlutterFlowTheme
                                                                  .of(context)
                                                              .labelMedium,
                                                          letterSpacing: 0.0,
                                                        ),
                                                    enabledBorder:
                                                        InputBorder.none,
                                                    focusedBorder:
                                                        InputBorder.none,
                                                    errorBorder:
                                                        InputBorder.none,
                                                    focusedErrorBorder:
                                                        InputBorder.none,
                                                    filled: true,
                                                    fillColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primaryBackground,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        font:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium,
                                                        letterSpacing: 0.0,
                                                      ),
                                                  maxLength: 50,
                                                  maxLengthEnforcement:
                                                      MaxLengthEnforcement.none,
                                                  buildCounter: (context,
                                                          {required currentLength,
                                                          required isFocused,
                                                          maxLength}) =>
                                                      null,
                                                  cursorColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .tertiary,
                                                  validator: _model
                                                      .categorySearchTextFieldTextControllerValidator
                                                      .asValidator(context),
                                                ),
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              logFirebaseEvent(
                                                  'CATEGORIES_PAGE_Icon_1b6xzoss_ON_TAP');
                                              logFirebaseEvent(
                                                  'Icon_clear_text_fields_pin_codes');
                                              safeSetState(() {
                                                _model
                                                    .categorySearchTextFieldTextController
                                                    ?.clear();
                                              });
                                              logFirebaseEvent(
                                                  'Icon_update_page_state');
                                              _model.searchStarted = false;
                                              safeSetState(() {});
                                            },
                                            child: Icon(
                                              Icons.clear_rounded,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              size: 20.0,
                                            ),
                                          ),
                                          FlutterFlowIconButton(
                                            borderColor: Colors.transparent,
                                            borderRadius: 0.0,
                                            borderWidth: 1.0,
                                            buttonSize: 40.0,
                                            fillColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryBackground,
                                            icon: FaIcon(
                                              FontAwesomeIcons.diceThree,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              size: 24.0,
                                            ),
                                            onPressed: () async {
                                              logFirebaseEvent(
                                                  'CATEGORIES_PAGE_randomizeCategory_ON_TAP');
                                              logFirebaseEvent(
                                                  'randomizeCategory_set_form_field');
                                              safeSetState(() {
                                                _model.categorySearchTextFieldTextController
                                                        ?.text =
                                                    categoriesCategoriesRecordList
                                                        .elementAtOrNull(
                                                            random_data
                                                                .randomInteger(
                                                                    0, 9))!
                                                        .categoryName;
                                              });
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        5.0, 0.0, 5.0, 0.0),
                                    child: Builder(
                                      builder: (context) {
                                        final categoriesQuery =
                                            categoriesCategoriesRecordList
                                                .toList();

                                        return MasonryGridView.builder(
                                          gridDelegate:
                                              const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 2,
                                          ),
                                          crossAxisSpacing: 10.0,
                                          mainAxisSpacing: 10.0,
                                          itemCount: categoriesQuery.length,
                                          itemBuilder:
                                              (context, categoriesQueryIndex) {
                                            final categoriesQueryItem =
                                                categoriesQuery[
                                                    categoriesQueryIndex];
                                            return Visibility(
                                              visible: functions
                                                  .showCategoryInSearch(
                                                      _model
                                                          .categorySearchTextFieldTextController
                                                          .text,
                                                      categoriesQueryItem
                                                          .categoryName),
                                              child: AuthUserStreamWidget(
                                                builder: (context) =>
                                                    wrapWithModel(
                                                  model: _model
                                                      .categoryCardModels1
                                                      .getModel(
                                                    categoriesQueryItem
                                                        .reference.id,
                                                    categoriesQueryIndex,
                                                  ),
                                                  updateCallback: () =>
                                                      safeSetState(() {}),
                                                  child: CategoryCardWidget(
                                                    key: Key(
                                                      'Keysxz_${categoriesQueryItem.reference.id}',
                                                    ),
                                                    categoryDoc:
                                                        categoriesQueryItem,
                                                    isFavorite: (currentUserDocument
                                                                    ?.favoriteCategories
                                                                    .toList() ??
                                                                [])
                                                            .contains(
                                                                categoriesQueryItem
                                                                    .reference) ==
                                                        true,
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  5.0, 10.0, 5.0, 0.0),
                              child: Builder(
                                builder: (context) {
                                  final categoriesQuery =
                                      categoriesCategoriesRecordList.toList();

                                  return MasonryGridView.builder(
                                    gridDelegate:
                                        const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                    ),
                                    crossAxisSpacing: 10.0,
                                    mainAxisSpacing: 10.0,
                                    itemCount: categoriesQuery.length,
                                    itemBuilder:
                                        (context, categoriesQueryIndex) {
                                      final categoriesQueryItem =
                                          categoriesQuery[categoriesQueryIndex];
                                      return Visibility(
                                        visible: categoriesQueryItem.isPopular,
                                        child: AuthUserStreamWidget(
                                          builder: (context) => wrapWithModel(
                                            model: _model.categoryCardModels2
                                                .getModel(
                                              categoriesQueryItem.reference.id,
                                              categoriesQueryIndex,
                                            ),
                                            updateCallback: () =>
                                                safeSetState(() {}),
                                            child: CategoryCardWidget(
                                              key: Key(
                                                'Key0p6_${categoriesQueryItem.reference.id}',
                                              ),
                                              categoryDoc: categoriesQueryItem,
                                              isFavorite: (currentUserDocument
                                                              ?.favoriteCategories
                                                              .toList() ??
                                                          [])
                                                      .contains(
                                                          categoriesQueryItem
                                                              .reference) ==
                                                  true,
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  5.0, 10.0, 5.0, 0.0),
                              child: AuthUserStreamWidget(
                                builder: (context) => Builder(
                                  builder: (context) {
                                    final categoriesQuery = (currentUserDocument
                                                ?.favoriteCategories
                                                .toList() ??
                                            [])
                                        .toList();

                                    return MasonryGridView.builder(
                                      gridDelegate:
                                          const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                      ),
                                      crossAxisSpacing: 10.0,
                                      mainAxisSpacing: 10.0,
                                      itemCount: categoriesQuery.length,
                                      itemBuilder:
                                          (context, categoriesQueryIndex) {
                                        final categoriesQueryItem =
                                            categoriesQuery[
                                                categoriesQueryIndex];
                                        return FutureBuilder<CategoriesRecord>(
                                          future:
                                              CategoriesRecord.getDocumentOnce(
                                                  categoriesQueryItem),
                                          builder: (context, snapshot) {
                                            // Customize what your widget looks like when it's loading.
                                            if (!snapshot.hasData) {
                                              return Center(
                                                child: SizedBox(
                                                  width: 50.0,
                                                  height: 50.0,
                                                  child: SpinKitFadingFour(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondary,
                                                    size: 50.0,
                                                  ),
                                                ),
                                              );
                                            }

                                            final categoryCardCategoriesRecord =
                                                snapshot.data!;

                                            return wrapWithModel(
                                              model: _model.categoryCardModels3
                                                  .getModel(
                                                categoryCardCategoriesRecord
                                                    .reference.id,
                                                categoriesQueryIndex,
                                              ),
                                              updateCallback: () =>
                                                  safeSetState(() {}),
                                              child: CategoryCardWidget(
                                                key: Key(
                                                  'Key7tp_${categoryCardCategoriesRecord.reference.id}',
                                                ),
                                                categoryDoc:
                                                    categoryCardCategoriesRecord,
                                                isFavorite: (currentUserDocument
                                                                ?.favoriteCategories
                                                                .toList() ??
                                                            [])
                                                        .contains(
                                                            categoriesQueryItem) ==
                                                    true,
                                              ),
                                            );
                                          },
                                        );
                                      },
                                    );
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
