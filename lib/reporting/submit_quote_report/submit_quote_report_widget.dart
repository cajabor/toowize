import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'submit_quote_report_model.dart';
export 'submit_quote_report_model.dart';

class SubmitQuoteReportWidget extends StatefulWidget {
  const SubmitQuoteReportWidget({
    super.key,
    required this.reportInfoText,
    required this.reason,
    required this.foulRating,
    required this.quoteDoc,
  });

  final String? reportInfoText;
  final String? reason;
  final int? foulRating;
  final QuotesRecord? quoteDoc;

  @override
  State<SubmitQuoteReportWidget> createState() =>
      _SubmitQuoteReportWidgetState();
}

class _SubmitQuoteReportWidgetState extends State<SubmitQuoteReportWidget> {
  late SubmitQuoteReportModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SubmitQuoteReportModel());

    _model.contextTextController ??= TextEditingController();
    _model.contextFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      elevation: 5.0,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(16.0),
        ),
      ),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(0.0),
            bottomRight: Radius.circular(0.0),
            topLeft: Radius.circular(16.0),
            topRight: Radius.circular(16.0),
          ),
        ),
        child: SingleChildScrollView(
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
              Align(
                alignment: const AlignmentDirectional(-1.0, 0.0),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      logFirebaseEvent(
                          'SUBMIT_QUOTE_REPORT_Icon_ln4u0v2s_ON_TAP');
                      logFirebaseEvent('Icon_bottom_sheet');
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.chevron_left_rounded,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 24.0,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
                child: Text(
                  'Report Quote',
                  style: FlutterFlowTheme.of(context).headlineSmall.override(
                        font: GoogleFonts.outfit(),
                        color: FlutterFlowTheme.of(context).primaryText,
                        fontSize: 24.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w500,
                      ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.report_gmailerrorred_sharp,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 24.0,
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                        child: Text(
                          widget.reason!,
                          textAlign: TextAlign.center,
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                font: FlutterFlowTheme.of(context).bodyMedium,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w600,
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(20.0, 10.0, 20.0, 0.0),
                child: Text(
                  widget.reportInfoText!,
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        font: FlutterFlowTheme.of(context).bodyMedium,
                        color: FlutterFlowTheme.of(context).secondaryText,
                        letterSpacing: 0.0,
                      ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(20.0, 50.0, 20.0, 12.0),
                child: TextFormField(
                  controller: _model.contextTextController,
                  focusNode: _model.contextFocusNode,
                  textCapitalization: TextCapitalization.sentences,
                  textInputAction: TextInputAction.done,
                  obscureText: false,
                  decoration: InputDecoration(
                    labelText:
                        'Share some context on what you\'re reporting on.',
                    labelStyle:
                        FlutterFlowTheme.of(context).labelMedium.override(
                              font: FlutterFlowTheme.of(context).labelMedium,
                              letterSpacing: 0.0,
                            ),
                    hintStyle:
                        FlutterFlowTheme.of(context).labelMedium.override(
                              font: FlutterFlowTheme.of(context).labelMedium,
                              letterSpacing: 0.0,
                            ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).lineColor,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).lineColor,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).error,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).error,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    filled: true,
                    fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                    contentPadding:
                        const EdgeInsetsDirectional.fromSTEB(20.0, 24.0, 0.0, 24.0),
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        font: FlutterFlowTheme.of(context).bodyMedium,
                        letterSpacing: 0.0,
                      ),
                  textAlign: TextAlign.start,
                  maxLines: 3,
                  maxLength: 150,
                  maxLengthEnforcement: MaxLengthEnforcement.enforced,
                  validator: _model.contextTextControllerValidator
                      .asValidator(context),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 40.0),
                child: FFButtonWidget(
                  onPressed: () async {
                    logFirebaseEvent(
                        'SUBMIT_QUOTE_REPORT_SUBMIT_REPORT_BTN_ON');
                    final firestoreBatch = FirebaseFirestore.instance.batch();
                    try {
                      if ((int currentFoulRating, int foulRatingIncrement) {
                        return (currentFoulRating + foulRatingIncrement) >= 100;
                      }(
                          valueOrDefault<int>(
                            widget.quoteDoc?.foulRating,
                            0,
                          ),
                          valueOrDefault<int>(
                            widget.foulRating,
                            5,
                          ))) {
                        if (widget.quoteDoc!.isImageUploaded) {
                          logFirebaseEvent('Button_delete_data');
                          await FirebaseStorage.instance
                              .refFromURL(widget.quoteDoc!.backgroundImage)
                              .delete();
                        }
                        logFirebaseEvent('Button_backend_call');
                        firestoreBatch.delete(widget.quoteDoc!.reference);
                      } else {
                        logFirebaseEvent('Button_backend_call');

                        firestoreBatch.update(widget.quoteDoc!.reference, {
                          ...mapToFirestore(
                            {
                              'foulRating':
                                  FieldValue.increment(widget.foulRating!),
                            },
                          ),
                        });
                        logFirebaseEvent('Button_backend_call');

                        firestoreBatch
                            .set(QuoteReportsRecord.collection.doc(), {
                          ...createQuoteReportsRecordData(
                            reportReason: widget.reason,
                            reportContext: _model.contextTextController.text,
                            reportPostedBy: currentUserReference,
                            quoteSummary:
                                '\"${widget.quoteDoc?.quoteText}\"-${widget.quoteDoc?.contextBy},${widget.quoteDoc?.contextBackground}',
                            quoteRef: widget.quoteDoc?.reference,
                            quoteFoulNumber: widget.quoteDoc?.foulRating,
                          ),
                          ...mapToFirestore(
                            {
                              'categories_posted_to':
                                  widget.quoteDoc?.categoriesPostedTo,
                            },
                          ),
                        });
                      }

                      logFirebaseEvent('Button_alert_dialog');
                      await showDialog(
                        context: context,
                        builder: (alertDialogContext) {
                          return WebViewAware(
                            child: AlertDialog(
                              title: const Text('Quote Reported.'),
                              content: const Text(
                                  'This quote has been reported. Let\'s continue to look out for our community.'),
                              actions: [
                                TextButton(
                                  onPressed: () =>
                                      Navigator.pop(alertDialogContext),
                                  child: const Text('Ok'),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                      logFirebaseEvent('Button_navigate_back');
                      context.safePop();
                      logFirebaseEvent('Button_navigate_back');
                      context.safePop();
                      logFirebaseEvent('Button_navigate_back');
                      context.safePop();
                    } finally {
                      await firestoreBatch.commit();
                    }
                  },
                  text: 'Submit report',
                  options: FFButtonOptions(
                    height: 40.0,
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                    iconPadding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).tertiary,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          font: FlutterFlowTheme.of(context).titleSmall,
                          color: Colors.white,
                          letterSpacing: 0.0,
                        ),
                    elevation: 3.0,
                    borderSide: const BorderSide(
                      color: Colors.transparent,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
