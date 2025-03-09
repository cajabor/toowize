import '/backend/api_requests/api_calls.dart';
import '/create_quote_components/quote_preview/quote_preview_widget.dart';
import '/empty_list_components/search_image/search_image_widget.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'image_search_popup_model.dart';
export 'image_search_popup_model.dart';

class ImageSearchPopupWidget extends StatefulWidget {
  const ImageSearchPopupWidget({
    super.key,
    required this.clearStoredData,
    required this.quoteText,
    required this.context,
    required this.contextAuthor,
    required this.contextBackground,
    required this.uploadedFileParam,
    this.searchInitialText,
  });

  final Future Function()? clearStoredData;
  final String? quoteText;
  final bool? context;
  final String? contextAuthor;
  final String? contextBackground;
  final FFUploadedFile? uploadedFileParam;
  final String? searchInitialText;

  @override
  State<ImageSearchPopupWidget> createState() => _ImageSearchPopupWidgetState();
}

class _ImageSearchPopupWidgetState extends State<ImageSearchPopupWidget> {
  late ImageSearchPopupModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ImageSearchPopupModel());

    _model.textController ??=
        TextEditingController(text: widget.searchInitialText);
    _model.textFieldFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(15.0),
          topRight: Radius.circular(15.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
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
              padding: const EdgeInsetsDirectional.fromSTEB(10.0, 16.0, 10.0, 0.0),
              child: Container(
                width: double.infinity,
                height: 50.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).primaryBackground,
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
                  padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 12.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Icon(
                        Icons.search_rounded,
                        color: FlutterFlowTheme.of(context).secondaryText,
                        size: 24.0,
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: SizedBox(
                            width: double.infinity,
                            child: TextFormField(
                              controller: _model.textController,
                              focusNode: _model.textFieldFocusNode,
                              onFieldSubmitted: (_) async {
                                logFirebaseEvent(
                                    'IMAGE_SEARCH_POPUP_TextField_g2t7m016_ON');
                                if (_model.textController.text != '') {
                                  logFirebaseEvent('TextField_backend_call');
                                  _model.googleImages =
                                      await GoogleImageSearchCall.call(
                                    query: _model.textController.text,
                                    key: getRemoteConfigString(
                                        'imageSearchApiKey'),
                                  );

                                  if (!(_model.googleImages?.succeeded ??
                                      true)) {
                                    logFirebaseEvent(
                                        'TextField_show_snack_bar');
                                    ScaffoldMessenger.of(context)
                                        .clearSnackBars();
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'Error ${(_model.googleImages?.statusCode ?? 200).toString()}: Something went wrong, please try again later :[',
                                          style: TextStyle(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                          ),
                                        ),
                                        duration: const Duration(milliseconds: 4000),
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .accent1,
                                      ),
                                    );
                                  }
                                  logFirebaseEvent(
                                      'TextField_update_app_state');
                                  FFAppState().lastImageSearchText =
                                      _model.textController.text;
                                }

                                safeSetState(() {});
                              },
                              autofocus: false,
                              textInputAction: TextInputAction.search,
                              obscureText: false,
                              decoration: InputDecoration(
                                labelStyle: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      font: FlutterFlowTheme.of(context)
                                          .labelMedium,
                                      letterSpacing: 0.0,
                                    ),
                                hintText: 'Search anything...',
                                hintStyle: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      font: FlutterFlowTheme.of(context)
                                          .labelMedium,
                                      letterSpacing: 0.0,
                                    ),
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                focusedErrorBorder: InputBorder.none,
                                filled: true,
                                fillColor: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    font:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                    letterSpacing: 0.0,
                                  ),
                              cursorColor: FlutterFlowTheme.of(context).primary,
                              validator: _model.textControllerValidator
                                  .asValidator(context),
                            ),
                          ),
                        ),
                      ),
                      if (valueOrDefault<bool>(
                        _model.textController.text != '',
                        true,
                      ))
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            logFirebaseEvent(
                                'IMAGE_SEARCH_POPUP_Icon_2kxiuusw_ON_TAP');
                            logFirebaseEvent(
                                'Icon_clear_text_fields_pin_codes');
                            safeSetState(() {
                              _model.textController?.clear();
                            });
                            logFirebaseEvent('Icon_update_app_state');
                            FFAppState().lastImageSearchText = '';
                          },
                          child: Icon(
                            Icons.close_rounded,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            size: 24.0,
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Align(
                alignment: const AlignmentDirectional(0.0, 0.0),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
                  child: Stack(
                    children: [
                      Container(
                        width: double.infinity,
                        height: double.infinity,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(8.0),
                                  bottomRight: Radius.circular(8.0),
                                  topLeft: Radius.circular(8.0),
                                  topRight: Radius.circular(8.0),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: Image.asset(
                                    'assets/images/picture.png',
                                    width: 100.0,
                                    height: 100.0,
                                    fit: BoxFit.fitHeight,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 20.0, 0.0, 0.0),
                              child: Text(
                                'Search for an image to spark up your quote',
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context)
                                    .labelLarge
                                    .override(
                                      font: FlutterFlowTheme.of(context)
                                          .labelLarge,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      if (valueOrDefault<bool>(
                        GoogleImageSearchCall.itemsReturned(
                              (_model.googleImages?.jsonBody ?? ''),
                            ) !=
                            null,
                        false,
                      ))
                        Container(
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                5.0, 15.0, 5.0, 5.0),
                            child: Builder(
                              builder: (context) {
                                final images = GoogleImageSearchCall.imageLinks(
                                      (_model.googleImages?.jsonBody ?? ''),
                                    )?.toList() ??
                                    [];
                                if (images.isEmpty) {
                                  return Center(
                                    child: SizedBox(
                                      width: double.infinity,
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                              0.4,
                                      child: const SearchImageWidget(),
                                    ),
                                  );
                                }

                                return MasonryGridView.builder(
                                  gridDelegate:
                                      const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                  ),
                                  crossAxisSpacing: 10.0,
                                  mainAxisSpacing: 10.0,
                                  itemCount: images.length,
                                  itemBuilder: (context, imagesIndex) {
                                    final imagesItem = images[imagesIndex];
                                    return Stack(
                                      children: [
                                        Container(
                                          constraints: const BoxConstraints(
                                            maxHeight: 600.0,
                                          ),
                                          decoration: const BoxDecoration(),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              logFirebaseEvent(
                                                  'IMAGE_SEARCH_POPUP_Image_fg2ekdyl_ON_TAP');
                                              logFirebaseEvent(
                                                  'Image_expand_image');
                                              await Navigator.push(
                                                context,
                                                PageTransition(
                                                  type: PageTransitionType.fade,
                                                  child:
                                                      FlutterFlowExpandedImageView(
                                                    image: Image.network(
                                                      valueOrDefault<String>(
                                                        imagesItem,
                                                        'https://tse4.mm.bing.net/th?id=OIP.F00dCf4bXxX0J-qEEf4qIQHaD6&pid=Api&P=0&h=220',
                                                      ),
                                                      fit: BoxFit.contain,
                                                      errorBuilder: (context,
                                                              error,
                                                              stackTrace) =>
                                                          Image.asset(
                                                        'assets/images/error_image.png',
                                                        fit: BoxFit.contain,
                                                      ),
                                                    ),
                                                    allowRotation: false,
                                                    tag: valueOrDefault<String>(
                                                      imagesItem,
                                                      'https://tse4.mm.bing.net/th?id=OIP.F00dCf4bXxX0J-qEEf4qIQHaD6&pid=Api&P=0&h=220' '$imagesIndex',
                                                    ),
                                                    useHeroAnimation: true,
                                                  ),
                                                ),
                                              );
                                            },
                                            child: Hero(
                                              tag: valueOrDefault<String>(
                                                imagesItem,
                                                'https://tse4.mm.bing.net/th?id=OIP.F00dCf4bXxX0J-qEEf4qIQHaD6&pid=Api&P=0&h=220' '$imagesIndex',
                                              ),
                                              transitionOnUserGestures: true,
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                child: Image.network(
                                                  valueOrDefault<String>(
                                                    imagesItem,
                                                    'https://tse4.mm.bing.net/th?id=OIP.F00dCf4bXxX0J-qEEf4qIQHaD6&pid=Api&P=0&h=220',
                                                  ),
                                                  fit: BoxFit.fill,
                                                  errorBuilder: (context, error,
                                                          stackTrace) =>
                                                      Image.asset(
                                                    'assets/images/error_image.png',
                                                    fit: BoxFit.fill,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  logFirebaseEvent(
                                                      'IMAGE_SEARCH_POPUP_Icon_3i3i1hf2_ON_TAP');
                                                  logFirebaseEvent(
                                                      'Icon_bottom_sheet');
                                                  await showModalBottomSheet(
                                                    isScrollControlled: true,
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    useSafeArea: true,
                                                    context: context,
                                                    builder: (context) {
                                                      return WebViewAware(
                                                        child: Padding(
                                                          padding: MediaQuery
                                                              .viewInsetsOf(
                                                                  context),
                                                          child: SizedBox(
                                                            height: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .height *
                                                                0.8,
                                                            child:
                                                                QuotePreviewWidget(
                                                              quoteText: widget
                                                                  .quoteText!,
                                                              contextBy: widget
                                                                  .contextAuthor!,
                                                              contextBackground:
                                                                  widget
                                                                      .contextBackground!,
                                                              uploadedFileParam:
                                                                  widget
                                                                      .uploadedFileParam!,
                                                              googleImageURLParam:
                                                                  imagesItem,
                                                              context: widget
                                                                  .context!,
                                                              isPicUploaded:
                                                                  false,
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  ).then((value) =>
                                                      safeSetState(() {}));
                                                },
                                                child: Icon(
                                                  Icons.preview_rounded,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .tertiary,
                                                  size: 28.0,
                                                ),
                                              ),
                                              Align(
                                                alignment: const AlignmentDirectional(
                                                    1.0, -1.0),
                                                child: Stack(
                                                  children: [
                                                    if (valueOrDefault<bool>(
                                                      imagesItem !=
                                                          FFAppState()
                                                              .selectedGoogleImage,
                                                      true,
                                                    ))
                                                      InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          logFirebaseEvent(
                                                              'IMAGE_SEARCH_POPUP_Icon_0ceo2mmy_ON_TAP');
                                                          logFirebaseEvent(
                                                              'Icon_update_app_state');
                                                          FFAppState()
                                                                  .selectedGoogleImage =
                                                              imagesItem;
                                                          safeSetState(() {});
                                                          logFirebaseEvent(
                                                              'Icon_execute_callback');
                                                          await widget
                                                              .clearStoredData
                                                              ?.call();
                                                        },
                                                        child: Icon(
                                                          Icons
                                                              .radio_button_off_sharp,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          size: 28.0,
                                                        ),
                                                      ),
                                                    if (valueOrDefault<bool>(
                                                      imagesItem ==
                                                          FFAppState()
                                                              .selectedGoogleImage,
                                                      false,
                                                    ))
                                                      InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          logFirebaseEvent(
                                                              'IMAGE_SEARCH_POPUP_Icon_20rygssm_ON_TAP');
                                                          logFirebaseEvent(
                                                              'Icon_update_app_state');
                                                          FFAppState()
                                                              .selectedGoogleImage = '';
                                                          safeSetState(() {});
                                                        },
                                                        child: Icon(
                                                          Icons
                                                              .check_circle_outline_rounded,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          size: 28.0,
                                                        ),
                                                      ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
