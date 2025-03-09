import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/category_components/select_categories_popup/select_categories_popup_widget.dart';
import '/components/premium_paywall_widget.dart';
import '/create_quote_components/image_search_popup/image_search_popup_widget.dart';
import '/create_quote_components/quote_preview/quote_preview_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/user_management/onboarding/verify_email/verify_email_widget.dart';
import 'dart:async';
import '/flutter_flow/admob_util.dart' as admob;
import '/flutter_flow/random_data_util.dart' as random_data;
import '/flutter_flow/revenue_cat_util.dart' as revenue_cat;
import 'package:aligned_tooltip/aligned_tooltip.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'create_page_model.dart';
export 'create_page_model.dart';

class CreatePageWidget extends StatefulWidget {
  const CreatePageWidget({super.key});

  @override
  State<CreatePageWidget> createState() => _CreatePageWidgetState();
}

class _CreatePageWidgetState extends State<CreatePageWidget>
    with TickerProviderStateMixin {
  late CreatePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CreatePageModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'createPage'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('CREATE_createPage_ON_INIT_STATE');
      logFirebaseEvent('createPage_update_app_state');
      FFAppState().selectedCategories = [];
      FFAppState().numCategoriesSelected = 0;
      safeSetState(() {});
    });

    _model.quoteTextTextController ??= TextEditingController();
    _model.quoteTextFocusNode ??= FocusNode();

    _model.contextAuthorTextController ??= TextEditingController();
    _model.contextAuthorFocusNode ??= FocusNode();

    _model.contextBackstoryTextController ??= TextEditingController();
    _model.contextBackstoryFocusNode ??= FocusNode();

    _model.contextSwitchValue = false;
    animationsMap.addAll({
      'containerOnActionTriggerAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          TiltEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 200.0.ms,
            begin: const Offset(3.142, 0),
            end: const Offset(0, 0),
          ),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 200.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'containerOnActionTriggerAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          TiltEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 200.0.ms,
            begin: const Offset(0, 0),
            end: const Offset(-3.142, 0),
          ),
          FadeEffect(
            curve: Curves.linear,
            delay: 0.0.ms,
            duration: 200.0.ms,
            begin: 1.0,
            end: 0.0,
          ),
        ],
      ),
      'stackOnActionTriggerAnimation': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          RotateEffect(
            curve: Curves.easeInOut,
            delay: 290.0.ms,
            duration: 500.0.ms,
            begin: 0.0,
            end: 0.5,
          ),
          RotateEffect(
            curve: Curves.easeInOut,
            delay: 290.0.ms,
            duration: 500.0.ms,
            begin: 0.5,
            end: 1.5,
          ),
          RotateEffect(
            curve: Curves.easeInOut,
            delay: 290.0.ms,
            duration: 500.0.ms,
            begin: 1.5,
            end: 1.0,
          ),
        ],
      ),
    });
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

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
        List<CategoriesRecord> createPageCategoriesRecordList = snapshot.data!;

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: WillPopScope(
            onWillPop: () async => false,
            child: Scaffold(
              key: scaffoldKey,
              backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
              appBar: AppBar(
                backgroundColor:
                    FlutterFlowTheme.of(context).secondaryBackground,
                automaticallyImplyLeading: false,
                title: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 50.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Align(
                        alignment: const AlignmentDirectional(-1.0, -1.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            logFirebaseEvent(
                                'CREATE_PAGE_PAGE_CLEAR_BTN_ON_TAP');
                            logFirebaseEvent(
                                'Button_clear_text_fields_pin_codes');
                            safeSetState(() {
                              _model.quoteTextTextController?.clear();
                              _model.contextAuthorTextController?.clear();
                              _model.contextBackstoryTextController?.clear();
                            });
                            logFirebaseEvent('Button_clear_uploaded_data');
                            safeSetState(() {
                              _model.isDataUploading1 = false;
                              _model.uploadedLocalFile1 =
                                  FFUploadedFile(bytes: Uint8List.fromList([]));
                            });

                            logFirebaseEvent('Button_update_app_state');
                            FFAppState().selectedGoogleImage = '';
                            FFAppState().selectedCategories = [];
                            safeSetState(() {});
                          },
                          text: 'Clear',
                          options: FFButtonOptions(
                            width: 80.0,
                            height: 40.0,
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            textStyle: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  font:
                                      FlutterFlowTheme.of(context).labelMedium,
                                  letterSpacing: 0.0,
                                ),
                            elevation: 0.0,
                            borderSide: const BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Align(
                          alignment: const AlignmentDirectional(0.0, 0.0),
                          child: AutoSizeText(
                            'Create Quote',
                            textAlign: TextAlign.center,
                            minFontSize: 12.0,
                            style: FlutterFlowTheme.of(context)
                                .headlineMedium
                                .override(
                                  font: FlutterFlowTheme.of(context)
                                      .headlineMedium,
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                actions: const [],
                centerTitle: false,
                elevation: 0.0,
              ),
              body: SafeArea(
                top: true,
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(5.0, 15.0, 5.0, 0.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Flexible(
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 15.0),
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                boxShadow: const [
                                  BoxShadow(
                                    blurRadius: 4.0,
                                    color: Color(0x33000000),
                                    offset: Offset(
                                      0.0,
                                      2.0,
                                    ),
                                  )
                                ],
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Icon(
                                    Icons.format_quote_sharp,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: 20.0,
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        8.0, 0.0, 8.0, 0.0),
                                    child: Form(
                                      key: _model.formKey1,
                                      autovalidateMode:
                                          AutovalidateMode.disabled,
                                      child: TextFormField(
                                        controller:
                                            _model.quoteTextTextController,
                                        focusNode: _model.quoteTextFocusNode,
                                        autofocus: false,
                                        textCapitalization:
                                            TextCapitalization.sentences,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          isDense: false,
                                          labelText: 'Quote Text',
                                          labelStyle: FlutterFlowTheme.of(
                                                  context)
                                              .labelMedium
                                              .override(
                                                font:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium,
                                                fontSize: 20.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w300,
                                              ),
                                          hintText:
                                              'Tap here to whip up a quote',
                                          enabledBorder: InputBorder.none,
                                          focusedBorder: InputBorder.none,
                                          errorBorder: InputBorder.none,
                                          focusedErrorBorder: InputBorder.none,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font: FlutterFlowTheme.of(context)
                                                  .bodyMedium,
                                              fontSize: 20.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w100,
                                            ),
                                        textAlign: TextAlign.center,
                                        maxLines: 5,
                                        maxLength: 200,
                                        maxLengthEnforcement:
                                            MaxLengthEnforcement.enforced,
                                        validator: _model
                                            .quoteTextTextControllerValidator
                                            .asValidator(context),
                                      ),
                                    ),
                                  ),
                                  if (valueOrDefault<bool>(
                                    _model.contextSwitchValue,
                                    false,
                                  ))
                                    Container(
                                      width: double.infinity,
                                      decoration: const BoxDecoration(),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Container(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        0.45,
                                                height: 2.0,
                                                decoration: BoxDecoration(
                                                  gradient: LinearGradient(
                                                    colors: [
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondary
                                                    ],
                                                    stops: const [0.0, 1.0],
                                                    begin: const AlignmentDirectional(
                                                        -1.0, 0.0),
                                                    end: const AlignmentDirectional(
                                                        1.0, 0),
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                              ),
                                              Container(
                                                width: 8.0,
                                                height: 8.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondary,
                                                  shape: BoxShape.circle,
                                                ),
                                              ),
                                              Container(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        0.45,
                                                height: 2.0,
                                                decoration: BoxDecoration(
                                                  gradient: LinearGradient(
                                                    colors: [
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondary
                                                    ],
                                                    stops: const [0.0, 1.0],
                                                    begin: const AlignmentDirectional(
                                                        1.0, 0.0),
                                                    end: const AlignmentDirectional(
                                                        -1.0, 0),
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Form(
                                            key: _model.formKey2,
                                            autovalidateMode:
                                                AutovalidateMode.disabled,
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Container(
                                                  height: 70.0,
                                                  decoration: const BoxDecoration(),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(8.0, 0.0,
                                                                8.0, 0.0),
                                                    child: TextFormField(
                                                      controller: _model
                                                          .contextAuthorTextController,
                                                      focusNode: _model
                                                          .contextAuthorFocusNode,
                                                      autofocus: true,
                                                      textCapitalization:
                                                          TextCapitalization
                                                              .sentences,
                                                      textInputAction:
                                                          TextInputAction.done,
                                                      obscureText: false,
                                                      decoration:
                                                          InputDecoration(
                                                        labelText:
                                                            'Said by (Required)',
                                                        labelStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .override(
                                                                  font: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium,
                                                                  fontSize:
                                                                      15.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w300,
                                                                ),
                                                        hintText: '[J. Cole]',
                                                        enabledBorder:
                                                            InputBorder.none,
                                                        focusedBorder:
                                                            InputBorder.none,
                                                        errorBorder:
                                                            InputBorder.none,
                                                        focusedErrorBorder:
                                                            InputBorder.none,
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                font: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .tertiary,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                      textAlign:
                                                          TextAlign.center,
                                                      maxLength: 25,
                                                      maxLengthEnforcement:
                                                          MaxLengthEnforcement
                                                              .enforced,
                                                      validator: _model
                                                          .contextAuthorTextControllerValidator
                                                          .asValidator(context),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 5.0),
                                                  child: Container(
                                                    height: 90.0,
                                                    decoration: const BoxDecoration(),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  8.0,
                                                                  0.0,
                                                                  8.0,
                                                                  0.0),
                                                      child: TextFormField(
                                                        controller: _model
                                                            .contextBackstoryTextController,
                                                        focusNode: _model
                                                            .contextBackstoryFocusNode,
                                                        autofocus: false,
                                                        textCapitalization:
                                                            TextCapitalization
                                                                .sentences,
                                                        textInputAction:
                                                            TextInputAction
                                                                .done,
                                                        obscureText: false,
                                                        decoration:
                                                            InputDecoration(
                                                          labelText:
                                                              'Said about (optional)',
                                                          labelStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .override(
                                                                    font: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium,
                                                                    fontSize:
                                                                        12.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w300,
                                                                  ),
                                                          hintText:
                                                              '[On Love Yourz]',
                                                          enabledBorder:
                                                              InputBorder.none,
                                                          focusedBorder:
                                                              InputBorder.none,
                                                          errorBorder:
                                                              InputBorder.none,
                                                          focusedErrorBorder:
                                                              InputBorder.none,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  font: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  fontSize:
                                                                      12.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w300,
                                                                ),
                                                        textAlign:
                                                            TextAlign.center,
                                                        maxLines: 2,
                                                        maxLength: 55,
                                                        maxLengthEnforcement:
                                                            MaxLengthEnforcement
                                                                .enforced,
                                                        validator: _model
                                                            .contextBackstoryTextControllerValidator
                                                            .asValidator(
                                                                context),
                                                      ),
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
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            if (valueOrDefault<bool>(
                              (_model.uploadedLocalFile1.bytes
                                          ?.isNotEmpty ??
                                      false),
                              false,
                            ))
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(3.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        logFirebaseEvent(
                                            'CREATE_PAGE_PAGE_Image_x4bviebh_ON_TAP');
                                        logFirebaseEvent('Image_expand_image');
                                        await Navigator.push(
                                          context,
                                          PageTransition(
                                            type: PageTransitionType.fade,
                                            child: FlutterFlowExpandedImageView(
                                              image: Image.memory(
                                                _model.uploadedLocalFile1
                                                        .bytes ??
                                                    Uint8List.fromList([]),
                                                fit: BoxFit.contain,
                                                errorBuilder: (context, error,
                                                        stackTrace) =>
                                                    Image.asset(
                                                  'assets/images/error_image.png',
                                                  fit: BoxFit.contain,
                                                ),
                                              ),
                                              allowRotation: false,
                                              tag: 'imageTag1',
                                              useHeroAnimation: true,
                                            ),
                                          ),
                                        );
                                      },
                                      child: Hero(
                                        tag: 'imageTag1',
                                        transitionOnUserGestures: true,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          child: Image.memory(
                                            _model.uploadedLocalFile1.bytes ??
                                                Uint8List.fromList([]),
                                            width: 100.0,
                                            height: 60.0,
                                            fit: BoxFit.fill,
                                            errorBuilder:
                                                (context, error, stackTrace) =>
                                                    Image.asset(
                                              'assets/images/error_image.png',
                                              width: 100.0,
                                              height: 60.0,
                                              fit: BoxFit.fill,
                                            ),
                                          ),
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
                                          'CREATE_PAGE_PAGE_Icon_hs0f9u86_ON_TAP');
                                      logFirebaseEvent(
                                          'Icon_clear_uploaded_data');
                                      safeSetState(() {
                                        _model.isDataUploading1 = false;
                                        _model.uploadedLocalFile1 =
                                            FFUploadedFile(
                                                bytes: Uint8List.fromList([]));
                                      });

                                      logFirebaseEvent('Icon_widget_animation');
                                      if (animationsMap[
                                              'containerOnActionTriggerAnimation2'] !=
                                          null) {
                                        animationsMap[
                                                'containerOnActionTriggerAnimation2']!
                                            .controller
                                            .reverse();
                                      }
                                      logFirebaseEvent('Icon_widget_animation');
                                      if (animationsMap[
                                              'containerOnActionTriggerAnimation1'] !=
                                          null) {
                                        animationsMap[
                                                'containerOnActionTriggerAnimation1']!
                                            .controller
                                            .reverse();
                                      }
                                      logFirebaseEvent(
                                          'Icon_update_page_state');
                                      _model.selectingUploadSource = false;
                                      safeSetState(() {});
                                    },
                                    child: FaIcon(
                                      FontAwesomeIcons.minusCircle,
                                      color: FlutterFlowTheme.of(context).error,
                                      size: 24.0,
                                    ),
                                  ),
                                ],
                              ),
                            if (valueOrDefault<bool>(
                              FFAppState().selectedGoogleImage != '',
                              false,
                            ))
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(3.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        logFirebaseEvent(
                                            'CREATE_PAGE_PAGE_Image_mg0ikz5e_ON_TAP');
                                        logFirebaseEvent('Image_expand_image');
                                        await Navigator.push(
                                          context,
                                          PageTransition(
                                            type: PageTransitionType.fade,
                                            child: FlutterFlowExpandedImageView(
                                              image: Image.network(
                                                FFAppState()
                                                    .selectedGoogleImage,
                                                fit: BoxFit.contain,
                                                errorBuilder: (context, error,
                                                        stackTrace) =>
                                                    Image.asset(
                                                  'assets/images/error_image.png',
                                                  fit: BoxFit.contain,
                                                ),
                                              ),
                                              allowRotation: false,
                                              tag: FFAppState()
                                                  .selectedGoogleImage,
                                              useHeroAnimation: true,
                                            ),
                                          ),
                                        );
                                      },
                                      child: Hero(
                                        tag: FFAppState().selectedGoogleImage,
                                        transitionOnUserGestures: true,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          child: Image.network(
                                            FFAppState().selectedGoogleImage,
                                            width: 100.0,
                                            height: 60.0,
                                            fit: BoxFit.fill,
                                            errorBuilder:
                                                (context, error, stackTrace) =>
                                                    Image.asset(
                                              'assets/images/error_image.png',
                                              width: 100.0,
                                              height: 60.0,
                                              fit: BoxFit.fill,
                                            ),
                                          ),
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
                                          'CREATE_PAGE_PAGE_Icon_fkb11s2p_ON_TAP');
                                      logFirebaseEvent('Icon_update_app_state');
                                      FFAppState().selectedGoogleImage = '';
                                      safeSetState(() {});
                                      logFirebaseEvent('Icon_widget_animation');
                                      if (animationsMap[
                                              'containerOnActionTriggerAnimation2'] !=
                                          null) {
                                        animationsMap[
                                                'containerOnActionTriggerAnimation2']!
                                            .controller
                                            .reverse();
                                      }
                                      logFirebaseEvent('Icon_widget_animation');
                                      if (animationsMap[
                                              'containerOnActionTriggerAnimation1'] !=
                                          null) {
                                        animationsMap[
                                                'containerOnActionTriggerAnimation1']!
                                            .controller
                                            .reverse();
                                      }
                                      logFirebaseEvent(
                                          'Icon_update_page_state');
                                      _model.selectingUploadSource = false;
                                      safeSetState(() {});
                                    },
                                    child: FaIcon(
                                      FontAwesomeIcons.minusCircle,
                                      color: FlutterFlowTheme.of(context).error,
                                      size: 24.0,
                                    ),
                                  ),
                                ],
                              ),
                          ],
                        ),
                        Container(
                          width: double.infinity,
                          height: 80.0,
                          decoration: BoxDecoration(
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      'Add who said it',
                                      style: FlutterFlowTheme.of(context)
                                          .titleLarge
                                          .override(
                                            font: FlutterFlowTheme.of(context)
                                                .titleLarge,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.normal,
                                          ),
                                    ),
                                    Align(
                                      alignment:
                                          const AlignmentDirectional(0.0, -1.0),
                                      child: AlignedTooltip(
                                        content: Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: Text(
                                            'Enable this to add the person who said the quote and in what context they said it (optional). Example:  J. Cole on Love Yourz',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyLarge
                                                .override(
                                                  font: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyLarge,
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                        offset: 4.0,
                                        preferredDirection: AxisDirection.down,
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                        elevation: 4.0,
                                        tailBaseWidth: 24.0,
                                        tailLength: 12.0,
                                        waitDuration:
                                            const Duration(milliseconds: 100),
                                        showDuration:
                                            const Duration(milliseconds: 1500),
                                        triggerMode: TooltipTriggerMode.tap,
                                        child: Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 5.0, 0.0, 0.0),
                                          child: Icon(
                                            Icons.info_outline_rounded,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            size: 20.0,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Switch.adaptive(
                                  value: _model.contextSwitchValue!,
                                  onChanged: (newValue) async {
                                    safeSetState(() =>
                                        _model.contextSwitchValue = newValue);

                                    if (!newValue) {
                                      logFirebaseEvent(
                                          'CREATE_contextSwitch_ON_TOGGLE_OFF');
                                      logFirebaseEvent(
                                          'contextSwitch_clear_text_fields_pin_code');
                                      safeSetState(() {
                                        _model.contextAuthorTextController
                                            ?.clear();
                                        _model.contextBackstoryTextController
                                            ?.clear();
                                      });
                                    }
                                  },
                                  activeColor:
                                      FlutterFlowTheme.of(context).primary,
                                  activeTrackColor:
                                      FlutterFlowTheme.of(context).tertiary,
                                  inactiveTrackColor:
                                      FlutterFlowTheme.of(context)
                                          .secondaryText,
                                  inactiveThumbColor:
                                      FlutterFlowTheme.of(context).primary,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Stack(
                          children: [
                            Container(
                              width: double.infinity,
                              height: 80.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                borderRadius: BorderRadius.circular(8.0),
                                border: Border.all(
                                  color: valueOrDefault<bool>(
                                    revenue_cat.activeEntitlementIds
                                        .contains('TooWize Premium'),
                                    true,
                                  )
                                      ? const Color(0x00000000)
                                      : const Color(0xFFE9B135),
                                  width: 2.0,
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          logFirebaseEvent(
                                              'CREATE_UPLOAD_FROM_DEVICE_BTN_ON_TAP');
                                          logFirebaseEvent(
                                              'Button_store_media_for_upload');
                                          final selectedMedia =
                                              await selectMediaWithSourceBottomSheet(
                                            context: context,
                                            maxWidth: 2500.00,
                                            maxHeight: 2500.00,
                                            imageQuality: 100,
                                            allowPhoto: true,
                                            includeBlurHash: true,
                                            pickerFontFamily: 'Outfit',
                                          );
                                          if (selectedMedia != null &&
                                              selectedMedia.every((m) =>
                                                  validateFileFormat(
                                                      m.storagePath,
                                                      context))) {
                                            safeSetState(() =>
                                                _model.isDataUploading1 = true);
                                            var selectedUploadedFiles =
                                                <FFUploadedFile>[];

                                            try {
                                              showUploadMessage(
                                                context,
                                                'Uploading file...',
                                                showLoading: true,
                                              );
                                              selectedUploadedFiles =
                                                  selectedMedia
                                                      .map(
                                                          (m) => FFUploadedFile(
                                                                name: m
                                                                    .storagePath
                                                                    .split('/')
                                                                    .last,
                                                                bytes: m.bytes,
                                                                height: m
                                                                    .dimensions
                                                                    ?.height,
                                                                width: m
                                                                    .dimensions
                                                                    ?.width,
                                                                blurHash:
                                                                    m.blurHash,
                                                              ))
                                                      .toList();
                                            } finally {
                                              ScaffoldMessenger.of(context)
                                                  .hideCurrentSnackBar();
                                              _model.isDataUploading1 = false;
                                            }
                                            if (selectedUploadedFiles.length ==
                                                selectedMedia.length) {
                                              safeSetState(() {
                                                _model.uploadedLocalFile1 =
                                                    selectedUploadedFiles.first;
                                              });
                                              showUploadMessage(
                                                  context, 'Success!');
                                            } else {
                                              safeSetState(() {});
                                              showUploadMessage(context,
                                                  'Failed to upload data');
                                              return;
                                            }
                                          }

                                          logFirebaseEvent(
                                              'Button_update_app_state');
                                          FFAppState().selectedGoogleImage = '';
                                          safeSetState(() {});
                                        },
                                        text: 'Upload from device',
                                        icon: Icon(
                                          Icons.file_upload_outlined,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          size: 15.0,
                                        ),
                                        options: FFButtonOptions(
                                          height: 50.0,
                                          padding: const EdgeInsets.all(3.0),
                                          iconPadding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .titleSmall
                                              .override(
                                                font:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                fontSize: 12.0,
                                                letterSpacing: 0.0,
                                              ),
                                          elevation: 2.0,
                                          borderSide: const BorderSide(
                                            color: Colors.transparent,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 100.0,
                                      child: VerticalDivider(
                                        thickness: 1.0,
                                        color: Color(0xFFA9A7A7),
                                      ),
                                    ),
                                    Expanded(
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          logFirebaseEvent(
                                              'CREATE_SEARCH_FOR_AN_IMAGE_BTN_ON_TAP');
                                          logFirebaseEvent(
                                              'Button_bottom_sheet');
                                          await showModalBottomSheet(
                                            isScrollControlled: true,
                                            backgroundColor: Colors.transparent,
                                            useSafeArea: true,
                                            context: context,
                                            builder: (context) {
                                              return WebViewAware(
                                                child: GestureDetector(
                                                  onTap: () {
                                                    FocusScope.of(context)
                                                        .unfocus();
                                                    FocusManager
                                                        .instance.primaryFocus
                                                        ?.unfocus();
                                                  },
                                                  child: Padding(
                                                    padding:
                                                        MediaQuery.viewInsetsOf(
                                                            context),
                                                    child: SizedBox(
                                                      height: MediaQuery.sizeOf(
                                                                  context)
                                                              .height *
                                                          0.8,
                                                      child:
                                                          ImageSearchPopupWidget(
                                                        quoteText: _model
                                                            .quoteTextTextController
                                                            .text,
                                                        context: _model
                                                            .contextSwitchValue!,
                                                        contextAuthor: _model
                                                            .contextAuthorTextController
                                                            .text,
                                                        contextBackground: _model
                                                            .contextBackstoryTextController
                                                            .text,
                                                        uploadedFileParam: _model
                                                            .uploadedLocalFile1,
                                                        searchInitialText:
                                                            FFAppState()
                                                                .lastImageSearchText,
                                                        clearStoredData:
                                                            () async {
                                                          logFirebaseEvent(
                                                              '_clear_uploaded_data');
                                                          safeSetState(() {
                                                            _model.isDataUploading1 =
                                                                false;
                                                            _model.uploadedLocalFile1 =
                                                                FFUploadedFile(
                                                                    bytes: Uint8List
                                                                        .fromList(
                                                                            []));
                                                          });
                                                        },
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                          ).then(
                                              (value) => safeSetState(() {}));
                                        },
                                        text: 'Search for an image',
                                        icon: Icon(
                                          Icons.image_search_rounded,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          size: 15.0,
                                        ),
                                        options: FFButtonOptions(
                                          height: 50.0,
                                          padding: const EdgeInsets.all(3.0),
                                          iconPadding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .titleSmall
                                              .override(
                                                font:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                fontSize: 12.0,
                                                letterSpacing: 0.0,
                                              ),
                                          elevation: 2.0,
                                          borderSide: const BorderSide(
                                            color: Colors.transparent,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ).animateOnActionTrigger(
                              animationsMap[
                                  'containerOnActionTriggerAnimation1']!,
                            ),
                            if (!valueOrDefault<bool>(
                              _model.selectingUploadSource,
                              true,
                            ))
                              Builder(
                                builder: (context) => InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    logFirebaseEvent(
                                        'CREATE_addImageContainer_ON_TAP');
                                    await authManager.refreshUser();
                                    if (!currentUserEmailVerified) {
                                      logFirebaseEvent(
                                          'addImageContainer_alert_dialog');
                                      await showDialog(
                                        context: context,
                                        builder: (dialogContext) {
                                          return Dialog(
                                            elevation: 0,
                                            insetPadding: EdgeInsets.zero,
                                            backgroundColor: Colors.transparent,
                                            alignment: const AlignmentDirectional(
                                                    0.0, 0.0)
                                                .resolve(
                                                    Directionality.of(context)),
                                            child: WebViewAware(
                                              child: GestureDetector(
                                                onTap: () {
                                                  FocusScope.of(dialogContext)
                                                      .unfocus();
                                                  FocusManager
                                                      .instance.primaryFocus
                                                      ?.unfocus();
                                                },
                                                child: SizedBox(
                                                  height:
                                                      MediaQuery.sizeOf(context)
                                                              .height *
                                                          0.5,
                                                  width: double.infinity,
                                                  child: const VerifyEmailWidget(),
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      );

                                      return;
                                    }
                                    logFirebaseEvent(
                                        'addImageContainer_revenue_cat');
                                    final isEntitled = await revenue_cat
                                            .isEntitled('TooWize Premium') ??
                                        false;
                                    if (!isEntitled) {
                                      await revenue_cat.loadOfferings();
                                    }

                                    if (!isEntitled) {
                                      if (!getRemoteConfigBool(
                                          'freeImageAddition')) {
                                        logFirebaseEvent(
                                            'addImageContainer_bottom_sheet');
                                        await showModalBottomSheet(
                                          isScrollControlled: true,
                                          backgroundColor: Colors.transparent,
                                          enableDrag: false,
                                          useSafeArea: true,
                                          context: context,
                                          builder: (context) {
                                            return WebViewAware(
                                              child: GestureDetector(
                                                onTap: () {
                                                  FocusScope.of(context)
                                                      .unfocus();
                                                  FocusManager
                                                      .instance.primaryFocus
                                                      ?.unfocus();
                                                },
                                                child: Padding(
                                                  padding:
                                                      MediaQuery.viewInsetsOf(
                                                          context),
                                                  child: SizedBox(
                                                    height: MediaQuery.sizeOf(
                                                                context)
                                                            .height *
                                                        0.85,
                                                    child:
                                                        const PremiumPaywallWidget(),
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                        ).then((value) => safeSetState(() {}));

                                        return;
                                      }
                                    }
                                    logFirebaseEvent(
                                        'addImageContainer_widget_animation');
                                    if (animationsMap[
                                            'containerOnActionTriggerAnimation2'] !=
                                        null) {
                                      animationsMap[
                                              'containerOnActionTriggerAnimation2']!
                                          .controller
                                          .forward(from: 0.0);
                                    }
                                    logFirebaseEvent(
                                        'addImageContainer_widget_animation');
                                    if (animationsMap[
                                            'containerOnActionTriggerAnimation1'] !=
                                        null) {
                                      animationsMap[
                                              'containerOnActionTriggerAnimation1']!
                                          .controller
                                          .forward(from: 0.0);
                                    }
                                    logFirebaseEvent(
                                        'addImageContainer_update_page_state');
                                    _model.selectingUploadSource = true;
                                    safeSetState(() {});
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    height: 80.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      borderRadius: BorderRadius.circular(8.0),
                                      border: Border.all(
                                        color: valueOrDefault<bool>(
                                          revenue_cat.activeEntitlementIds
                                              .contains('TooWize Premium'),
                                          true,
                                        )
                                            ? const Color(0x00000000)
                                            : const Color(0xFFE9B135),
                                        width: 2.0,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Add background picture',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .titleLarge
                                                        .override(
                                                          font: FlutterFlowTheme
                                                                  .of(context)
                                                              .titleLarge,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                              ),
                                              if (valueOrDefault<bool>(
                                                !valueOrDefault<bool>(
                                                      revenue_cat
                                                          .activeEntitlementIds
                                                          .contains(
                                                              'TooWize Premium'),
                                                      true,
                                                    ) &&
                                                    getRemoteConfigBool(
                                                        'freeImageAddition'),
                                                false,
                                              ))
                                                Text(
                                                  'Free for a limited time!',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        font:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                            ],
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 8.0, 0.0),
                                            child: Stack(
                                              children: [
                                                Align(
                                                  alignment:
                                                      const AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Icon(
                                                    Icons.add_photo_alternate,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    size: 35.0,
                                                  ),
                                                ),
                                                if (!valueOrDefault<bool>(
                                                  revenue_cat
                                                      .activeEntitlementIds
                                                      .contains(
                                                          'TooWize Premium'),
                                                  true,
                                                ))
                                                  const Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            -1.0, -1.0),
                                                    child: FaIcon(
                                                      FontAwesomeIcons.crown,
                                                      color: Color(0xFFE9B135),
                                                      size: 17.0,
                                                    ),
                                                  ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ).animateOnActionTrigger(
                                  animationsMap[
                                      'containerOnActionTriggerAnimation2']!,
                                ),
                              ),
                          ],
                        ),
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            logFirebaseEvent(
                                'CREATE_Container_pfzqhogv_ON_TAP');
                            logFirebaseEvent('Container_bottom_sheet');
                            await showModalBottomSheet(
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              useSafeArea: true,
                              context: context,
                              builder: (context) {
                                return WebViewAware(
                                  child: GestureDetector(
                                    onTap: () {
                                      FocusScope.of(context).unfocus();
                                      FocusManager.instance.primaryFocus
                                          ?.unfocus();
                                    },
                                    child: Padding(
                                      padding: MediaQuery.viewInsetsOf(context),
                                      child: SizedBox(
                                        height:
                                            MediaQuery.sizeOf(context).height *
                                                0.75,
                                        child: const SelectCategoriesPopupWidget(),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ).then((value) => safeSetState(() {}));
                          },
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Post to categories',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .titleLarge
                                                      .override(
                                                        font:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleLarge,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 8.0, 0.0),
                                              child: Stack(
                                                alignment: const AlignmentDirectional(
                                                    1.0, -1.0),
                                                children: [
                                                  Icon(
                                                    Icons.category_rounded,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    size: 35.0,
                                                  ),
                                                  Icon(
                                                    Icons.add_circle_rounded,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .tertiary,
                                                    size: 14.0,
                                                  ),
                                                ],
                                              ).animateOnActionTrigger(
                                                animationsMap[
                                                    'stackOnActionTriggerAnimation']!,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            if (FFAppState()
                                                    .numCategoriesSelected ==
                                                0)
                                              Align(
                                                alignment: const AlignmentDirectional(
                                                    -1.0, 0.0),
                                                child: Text(
                                                  'No categories selected',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        font:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .error,
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ),
                                            if (valueOrDefault<bool>(
                                              FFAppState()
                                                  .selectedCategories
                                                  .isNotEmpty,
                                              false,
                                            ))
                                              Builder(
                                                builder: (context) {
                                                  final selectedCategoryTags =
                                                      createPageCategoriesRecordList
                                                          .toList();

                                                  return Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: List.generate(
                                                        selectedCategoryTags
                                                            .length,
                                                        (selectedCategoryTagsIndex) {
                                                      final selectedCategoryTagsItem =
                                                          selectedCategoryTags[
                                                              selectedCategoryTagsIndex];
                                                      return Visibility(
                                                        visible: FFAppState()
                                                            .selectedCategories
                                                            .contains(
                                                                selectedCategoryTagsItem
                                                                    .reference),
                                                        child: Flexible(
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets.all(
                                                                    3.0),
                                                            child: ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          17.0),
                                                              child: Container(
                                                                height: 40.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  gradient:
                                                                      LinearGradient(
                                                                    colors: [
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondary
                                                                    ],
                                                                    stops: const [
                                                                      0.0,
                                                                      1.0
                                                                    ],
                                                                    begin:
                                                                        const AlignmentDirectional(
                                                                            -1.0,
                                                                            0.0),
                                                                    end:
                                                                        const AlignmentDirectional(
                                                                            1.0,
                                                                            0),
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              17.0),
                                                                ),
                                                                child: Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .all(
                                                                              3.0),
                                                                  child:
                                                                      Container(
                                                                    width: double
                                                                        .infinity,
                                                                    height: double
                                                                        .infinity,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              15.0),
                                                                    ),
                                                                    child:
                                                                        Align(
                                                                      alignment:
                                                                          const AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                      child:
                                                                          Text(
                                                                        selectedCategoryTagsItem
                                                                            .categoryName,
                                                                        textAlign:
                                                                            TextAlign.center,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              font: FlutterFlowTheme.of(context).bodyMedium,
                                                                              letterSpacing: 0.0,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    }),
                                                  );
                                                },
                                              ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 10.0, 0.0, 10.0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              logFirebaseEvent(
                                  'CREATE_PAGE_PAGE_PREVIEW_BTN_ON_TAP');
                              logFirebaseEvent('Button_bottom_sheet');
                              await showModalBottomSheet(
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                useSafeArea: true,
                                context: context,
                                builder: (context) {
                                  return WebViewAware(
                                    child: GestureDetector(
                                      onTap: () {
                                        FocusScope.of(context).unfocus();
                                        FocusManager.instance.primaryFocus
                                            ?.unfocus();
                                      },
                                      child: Padding(
                                        padding:
                                            MediaQuery.viewInsetsOf(context),
                                        child: SizedBox(
                                          height: MediaQuery.sizeOf(context)
                                                  .height *
                                              0.8,
                                          child: QuotePreviewWidget(
                                            quoteText: _model
                                                .quoteTextTextController.text,
                                            contextBy: _model
                                                .contextAuthorTextController
                                                .text,
                                            contextBackground: _model
                                                .contextBackstoryTextController
                                                .text,
                                            uploadedFileParam:
                                                _model.uploadedLocalFile1,
                                            googleImageURLParam: FFAppState()
                                                .selectedGoogleImage,
                                            context: _model.contextSwitchValue!,
                                            isPicUploaded:
                                                (_model
                                                            .uploadedLocalFile1
                                                            .bytes
                                                            ?.isNotEmpty ??
                                                        false),
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ).then((value) => safeSetState(() {}));
                            },
                            text: 'Preview',
                            icon: const Icon(
                              Icons.preview,
                              color: Colors.black,
                              size: 15.0,
                            ),
                            options: FFButtonOptions(
                              width: 150.0,
                              height: 40.0,
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  24.0, 0.0, 24.0, 0.0),
                              iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: const Color(0xFFE7E9F6),
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    font:
                                        FlutterFlowTheme.of(context).titleSmall,
                                    color: Colors.black,
                                    letterSpacing: 0.0,
                                  ),
                              elevation: 3.0,
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).tertiary,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ),
                        Builder(
                          builder: (context) => Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 10.0, 0.0, 40.0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                logFirebaseEvent(
                                    'CREATE_PAGE_PAGE_POST_BTN_ON_TAP');
                                await authManager.refreshUser();
                                var shouldSetState = false;
                                if (!currentUserEmailVerified) {
                                  logFirebaseEvent('Button_alert_dialog');
                                  await showDialog(
                                    context: context,
                                    builder: (dialogContext) {
                                      return Dialog(
                                        elevation: 0,
                                        insetPadding: EdgeInsets.zero,
                                        backgroundColor: Colors.transparent,
                                        alignment:
                                            const AlignmentDirectional(0.0, 0.0)
                                                .resolve(
                                                    Directionality.of(context)),
                                        child: WebViewAware(
                                          child: GestureDetector(
                                            onTap: () {
                                              FocusScope.of(dialogContext)
                                                  .unfocus();
                                              FocusManager.instance.primaryFocus
                                                  ?.unfocus();
                                            },
                                            child: SizedBox(
                                              height: MediaQuery.sizeOf(context)
                                                      .height *
                                                  0.5,
                                              width: double.infinity,
                                              child: const VerifyEmailWidget(),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  );

                                  if (shouldSetState) safeSetState(() {});
                                  return;
                                }
                                logFirebaseEvent('Button_validate_form');
                                if (_model.formKey1.currentState == null ||
                                    !_model.formKey1.currentState!.validate()) {
                                  return;
                                }
                                if (_model.contextSwitchValue!) {
                                  logFirebaseEvent('Button_validate_form');
                                  if (_model.formKey2.currentState == null ||
                                      !_model.formKey2.currentState!
                                          .validate()) {
                                    return;
                                  }
                                }
                                if (FFAppState().numCategoriesSelected > 0) {
                                  logFirebaseEvent('Button_backend_call');
                                  _model.morderateTextReturn =
                                      await ModerateTextCall.call(
                                    screenedText:
                                        '${_model.quoteTextTextController.text} - ${_model.contextAuthorTextController.text} , ${_model.contextBackstoryTextController.text}',
                                    key: getRemoteConfigString(
                                        'azureModerationApiKey'),
                                  );

                                  shouldSetState = true;
                                  if (valueOrDefault<bool>(
                                        ModerateTextCall.pii(
                                              (_model.morderateTextReturn
                                                      ?.jsonBody ??
                                                  ''),
                                            ) !=
                                            null,
                                        false,
                                      ) ||
                                      ((double sexplicitScore,
                                              double sexuallySuggestiveScore,
                                              double offensiveScore,
                                              double maxRating) {
                                        return (sexplicitScore +
                                                sexuallySuggestiveScore +
                                                offensiveScore) >=
                                            maxRating;
                                      }(
                                          valueOrDefault<double>(
                                            ModerateTextCall.score1(
                                              (_model.morderateTextReturn
                                                      ?.jsonBody ??
                                                  ''),
                                            ),
                                            0.0,
                                          ),
                                          valueOrDefault<double>(
                                            ModerateTextCall.score2(
                                              (_model.morderateTextReturn
                                                      ?.jsonBody ??
                                                  ''),
                                            ),
                                            0.0,
                                          ),
                                          valueOrDefault<double>(
                                            ModerateTextCall.score3(
                                              (_model.morderateTextReturn
                                                      ?.jsonBody ??
                                                  ''),
                                            ),
                                            0.0,
                                          ),
                                          getRemoteConfigDouble(
                                              'textMaxFoulRating')))) {
                                    logFirebaseEvent('Button_alert_dialog');
                                    await showDialog(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return WebViewAware(
                                          child: AlertDialog(
                                            title: const Text('Whoa whoa!'),
                                            content: const Text(
                                                'It looks like your post may be too sexual, offensive or reveal personal information. '),
                                            actions: [
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext),
                                                child: const Text('Ok, my bad'),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    );
                                    if (shouldSetState) safeSetState(() {});
                                    return;
                                  }
                                  if ((_model.uploadedLocalFile1.bytes
                                              ?.isNotEmpty ??
                                          false)) {
                                    logFirebaseEvent(
                                        'Button_upload_media_to_firebase');
                                    {
                                      safeSetState(
                                          () => _model.isDataUploading2 = true);
                                      var selectedUploadedFiles =
                                          <FFUploadedFile>[];
                                      var selectedMedia = <SelectedFile>[];
                                      var downloadUrls = <String>[];
                                      try {
                                        selectedUploadedFiles = _model
                                                .uploadedLocalFile1
                                                .bytes!
                                                .isNotEmpty
                                            ? [_model.uploadedLocalFile1]
                                            : <FFUploadedFile>[];
                                        selectedMedia =
                                            selectedFilesFromUploadedFiles(
                                          selectedUploadedFiles,
                                        );
                                        downloadUrls = (await Future.wait(
                                          selectedMedia.map(
                                            (m) async => await uploadData(
                                                m.storagePath, m.bytes),
                                          ),
                                        ))
                                            .where((u) => u != null)
                                            .map((u) => u!)
                                            .toList();
                                      } finally {
                                        _model.isDataUploading2 = false;
                                      }
                                      if (selectedUploadedFiles.length ==
                                              selectedMedia.length &&
                                          downloadUrls.length ==
                                              selectedMedia.length) {
                                        safeSetState(() {
                                          _model.uploadedLocalFile2 =
                                              selectedUploadedFiles.first;
                                          _model.uploadedFileUrl2 =
                                              downloadUrls.first;
                                        });
                                      } else {
                                        safeSetState(() {});
                                        return;
                                      }
                                    }

                                    logFirebaseEvent('Button_wait__delay');
                                    await Future.delayed(
                                        const Duration(milliseconds: 1000));
                                    logFirebaseEvent('Button_backend_call');
                                    _model.modImageReturn =
                                        await ModerateImageCall.call(
                                      screenedImage: _model.uploadedFileUrl2,
                                      key: getRemoteConfigString(
                                          'azureModerationApiKey'),
                                    );

                                    shouldSetState = true;
                                    if (ModerateImageCall.isAdultImage(
                                          (_model.modImageReturn?.jsonBody ??
                                              ''),
                                        )! ||
                                        (ModerateImageCall.racyScore(
                                              (_model.modImageReturn
                                                      ?.jsonBody ??
                                                  ''),
                                            )! >=
                                            0.7)) {
                                      logFirebaseEvent('Button_alert_dialog');
                                      unawaited(
                                        () async {
                                          await showDialog(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return WebViewAware(
                                                child: AlertDialog(
                                                  title: const Text('Whoa whoa!'),
                                                  content: const Text(
                                                      'It looks like your image may be too sexual, offensive or reveal personal information. '),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              alertDialogContext),
                                                      child: const Text('Ok, my bad'),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            },
                                          );
                                        }(),
                                      );
                                      logFirebaseEvent('Button_delete_data');
                                      await FirebaseStorage.instance
                                          .refFromURL(_model.uploadedFileUrl2)
                                          .delete();
                                      if (shouldSetState) safeSetState(() {});
                                      return;
                                    } else {
                                      // add to premium quotes
                                      logFirebaseEvent(
                                          'Button_addtopremiumquotes');
                                      FFAppState().addToSelectedCategories(
                                          FFAppState()
                                              .premiumQuotesCategoryRef!);
                                      logFirebaseEvent(
                                          'Button_update_page_state');
                                      _model.tempFirestoreURL =
                                          _model.uploadedFileUrl2;
                                      _model.isImageUploaded = true;
                                    }
                                  } else {
                                    if (FFAppState().selectedGoogleImage !=
                                            '') {
                                      // add to premium quotes
                                      logFirebaseEvent(
                                          'Button_addtopremiumquotes');
                                      FFAppState().addToSelectedCategories(
                                          FFAppState()
                                              .premiumQuotesCategoryRef!);
                                      logFirebaseEvent(
                                          'Button_update_page_state');
                                      _model.tempFirestoreURL =
                                          FFAppState().selectedGoogleImage;
                                      _model.isImageUploaded = false;
                                    }
                                  }

                                  // create quote document
                                  logFirebaseEvent(
                                      'Button_createquotedocument');

                                  var quotesRecordReference =
                                      QuotesRecord.collection.doc();
                                  await quotesRecordReference.set({
                                    ...createQuotesRecordData(
                                      quoteText:
                                          _model.quoteTextTextController.text,
                                      numLikes: 0,
                                      context: _model.contextSwitchValue,
                                      contextBy: _model
                                          .contextAuthorTextController.text,
                                      contextBackground: _model
                                          .contextBackstoryTextController.text,
                                      postedBy: currentUserReference,
                                      snippetDisplayName:
                                          currentUserDisplayName,
                                      numComments: 0,
                                      randomIndex: random_data.randomString(
                                        12,
                                        12,
                                        true,
                                        true,
                                        true,
                                      ),
                                      backgroundImage: _model.tempFirestoreURL,
                                      snippetPhotoUrl: currentUserPhoto,
                                      createdTime: getCurrentTimestamp,
                                      isImageUploaded: _model.isImageUploaded,
                                      foulRating: 0,
                                      backgroundImageBlurHash:
                                          valueOrDefault<String>(
                                        _model.uploadedLocalFile1.blurHash,
                                        'L85W.9SvAPwPoNbGWTjbAPsE,|OR',
                                      ),
                                      isPinned: false,
                                    ),
                                    ...mapToFirestore(
                                      {
                                        'categories_posted_to':
                                            FFAppState().selectedCategories,
                                      },
                                    ),
                                  });
                                  _model.createdQuoteDoc =
                                      QuotesRecord.getDocumentFromData({
                                    ...createQuotesRecordData(
                                      quoteText:
                                          _model.quoteTextTextController.text,
                                      numLikes: 0,
                                      context: _model.contextSwitchValue,
                                      contextBy: _model
                                          .contextAuthorTextController.text,
                                      contextBackground: _model
                                          .contextBackstoryTextController.text,
                                      postedBy: currentUserReference,
                                      snippetDisplayName:
                                          currentUserDisplayName,
                                      numComments: 0,
                                      randomIndex: random_data.randomString(
                                        12,
                                        12,
                                        true,
                                        true,
                                        true,
                                      ),
                                      backgroundImage: _model.tempFirestoreURL,
                                      snippetPhotoUrl: currentUserPhoto,
                                      createdTime: getCurrentTimestamp,
                                      isImageUploaded: _model.isImageUploaded,
                                      foulRating: 0,
                                      backgroundImageBlurHash:
                                          valueOrDefault<String>(
                                        _model.uploadedLocalFile1.blurHash,
                                        'L85W.9SvAPwPoNbGWTjbAPsE,|OR',
                                      ),
                                      isPinned: false,
                                    ),
                                    ...mapToFirestore(
                                      {
                                        'categories_posted_to':
                                            FFAppState().selectedCategories,
                                      },
                                    ),
                                  }, quotesRecordReference);
                                  shouldSetState = true;
                                  if (_model.createdQuoteDoc != null) {
                                    logFirebaseEvent(
                                        'Button_clear_uploaded_data');
                                    safeSetState(() {
                                      _model.isDataUploading1 = false;
                                      _model.uploadedLocalFile1 =
                                          FFUploadedFile(
                                              bytes: Uint8List.fromList([]));
                                    });

                                    // clear textfields
                                    logFirebaseEvent('Button_cleartextfields');
                                    safeSetState(() {
                                      _model.quoteTextTextController?.clear();
                                      _model.contextAuthorTextController
                                          ?.clear();
                                      _model.contextBackstoryTextController
                                          ?.clear();
                                    });
                                    logFirebaseEvent(
                                        'Button_update_page_state');
                                    _model.selectingUploadSource = false;
                                    _model.tempFirestoreURL = null;
                                    // reset app state variables
                                    logFirebaseEvent(
                                        'Button_resetappstatevariables');
                                    FFAppState().selectedCategories = [];
                                    FFAppState().numCategoriesSelected = 0;
                                    FFAppState().selectedGoogleImage = '';
                                    FFAppState().lastImageSearchText = '';
                                    safeSetState(() {});
                                    // update the user's last posted time
                                    logFirebaseEvent(
                                        'Button_updatetheuserslastpostedtime');

                                    await currentUserReference!
                                        .update(createUsersRecordData(
                                      lastPostedTime: getCurrentTimestamp,
                                    ));
                                    logFirebaseEvent('Button_revenue_cat');
                                    final isEntitled = await revenue_cat
                                            .isEntitled('TooWize Premium') ??
                                        false;
                                    if (!isEntitled) {
                                      await revenue_cat.loadOfferings();
                                    }

                                    if (!isEntitled) {
                                      logFirebaseEvent('Button_ad_mob');

                                      _model.interstitialAdSuccess =
                                          await admob.showInterstitialAd();

                                      shouldSetState = true;
                                      logFirebaseEvent('Button_ad_mob');

                                      admob.loadInterstitialAd(
                                        "ca-app-pub-4396913314822848/4707868013",
                                        "ca-app-pub-4396913314822848/5606016711",
                                        false,
                                      );

                                      logFirebaseEvent('Button_navigate_to');

                                      context.pushNamed(
                                        'quoteDetailPage',
                                        pathParameters: {
                                          'quoteRef': serializeParam(
                                            _model.createdQuoteDoc?.reference,
                                            ParamType.DocumentReference,
                                          ),
                                        }.withoutNulls,
                                        queryParameters: {
                                          'parentPage': serializeParam(
                                            'createPage',
                                            ParamType.String,
                                          ),
                                        }.withoutNulls,
                                      );
                                    }
                                    logFirebaseEvent('Button_show_snack_bar');
                                    ScaffoldMessenger.of(context)
                                        .clearSnackBars();
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'Quote Created!',
                                          style: FlutterFlowTheme.of(context)
                                              .labelMedium
                                              .override(
                                                font:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                        duration: const Duration(milliseconds: 4000),
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .success,
                                        action: SnackBarAction(
                                          label: 'View',
                                          textColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryText,
                                          onPressed: () async {
                                            context.pushNamed(
                                              'quoteDetailPage',
                                              pathParameters: {
                                                'quoteRef': serializeParam(
                                                  _model.createdQuoteDoc
                                                      ?.reference,
                                                  ParamType.DocumentReference,
                                                ),
                                              }.withoutNulls,
                                            );
                                          },
                                        ),
                                      ),
                                    );
                                  } else {
                                    logFirebaseEvent('Button_show_snack_bar');
                                    ScaffoldMessenger.of(context)
                                        .clearSnackBars();
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'Oops, something went wrong',
                                          style: FlutterFlowTheme.of(context)
                                              .labelMedium
                                              .override(
                                                font:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                        duration: const Duration(milliseconds: 4000),
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .accent1,
                                      ),
                                    );
                                  }
                                } else {
                                  logFirebaseEvent('Button_widget_animation');
                                  if (animationsMap[
                                          'stackOnActionTriggerAnimation'] !=
                                      null) {
                                    animationsMap[
                                            'stackOnActionTriggerAnimation']!
                                        .controller
                                        .forward(from: 0.0);
                                  }
                                  logFirebaseEvent('Button_show_snack_bar');
                                  ScaffoldMessenger.of(context)
                                      .clearSnackBars();
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'Select categories to post quote to.',
                                        style: FlutterFlowTheme.of(context)
                                            .labelSmall
                                            .override(
                                              font: FlutterFlowTheme.of(context)
                                                  .labelSmall,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              letterSpacing: 0.0,
                                            ),
                                        textAlign: TextAlign.center,
                                      ),
                                      duration: const Duration(milliseconds: 4000),
                                      backgroundColor:
                                          FlutterFlowTheme.of(context)
                                              .secondaryText,
                                    ),
                                  );
                                }

                                if (shouldSetState) safeSetState(() {});
                              },
                              text: 'Post',
                              options: FFButtonOptions(
                                width: 200.0,
                                height: 40.0,
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).tertiary,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      font: FlutterFlowTheme.of(context)
                                          .titleSmall,
                                      color: Colors.white,
                                      letterSpacing: 0.0,
                                    ),
                                elevation: 2.0,
                                borderSide: const BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ].divide(const SizedBox(height: 3.0)),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
