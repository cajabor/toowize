import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/custom_cloud_functions/custom_cloud_function_response_manager.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:async';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:collection/collection.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'edit_profile_model.dart';
export 'edit_profile_model.dart';

class EditProfileWidget extends StatefulWidget {
  const EditProfileWidget({super.key});

  @override
  State<EditProfileWidget> createState() => _EditProfileWidgetState();
}

class _EditProfileWidgetState extends State<EditProfileWidget> {
  late EditProfileModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EditProfileModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'editProfile'});
    _model.yourNameTextController ??=
        TextEditingController(text: currentUserDisplayName);
    _model.yourNameFocusNode ??= FocusNode();

    _model.myBioTextController ??= TextEditingController(
        text: valueOrDefault(currentUserDocument?.bio, ''));
    _model.myBioFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
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
            logFirebaseEvent('EDIT_PROFILE_chevron_left_rounded_ICN_ON');
            logFirebaseEvent('IconButton_navigate_back');
            context.pop();
          },
        ),
        title: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 0.0, 0.0),
          child: Text(
            'Edit your profile',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  font: FlutterFlowTheme.of(context).headlineMedium,
                  color: FlutterFlowTheme.of(context).primaryText,
                  fontSize: 22.0,
                  letterSpacing: 0.0,
                ),
          ),
        ),
        actions: const [],
        centerTitle: false,
        elevation: 0.0,
      ),
      body: SafeArea(
        top: true,
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 95.0,
                        height: 95.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).alternate,
                          shape: BoxShape.circle,
                        ),
                        child: SizedBox(
                          width: double.infinity,
                          height: double.infinity,
                          child: Stack(
                            alignment: const AlignmentDirectional(0.0, 0.0),
                            children: [
                              AuthUserStreamWidget(
                                builder: (context) => Container(
                                  width: 90.0,
                                  height: 90.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: Image.network(
                                        valueOrDefault<String>(
                                          currentUserPhoto,
                                          'https://clipground.com/images/profile-placeholder-clipart-1.png',
                                        ),
                                      ).image,
                                    ),
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              ),
                              if ((_model.uploadedLocalFile1.bytes
                                          ?.isNotEmpty ??
                                      false))
                                Container(
                                  width: 90.0,
                                  height: 90.0,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: Image.memory(
                                    _model.uploadedLocalFile1.bytes ??
                                        Uint8List.fromList([]),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              if ((_model.uploadedLocalFile1.bytes
                                          ?.isNotEmpty ??
                                      false))
                                Align(
                                  alignment: const AlignmentDirectional(1.0, -1.0),
                                  child: FlutterFlowIconButton(
                                    borderRadius: 20.0,
                                    borderWidth: 1.0,
                                    buttonSize: 35.0,
                                    fillColor: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    icon: Icon(
                                      Icons.close_rounded,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      size: 15.0,
                                    ),
                                    onPressed: () async {
                                      logFirebaseEvent(
                                          'EDIT_PROFILE_close_rounded_ICN_ON_TAP');
                                      logFirebaseEvent(
                                          'IconButton_clear_uploaded_data');
                                      safeSetState(() {
                                        _model.isDataUploading1 = false;
                                        _model.uploadedLocalFile1 =
                                            FFUploadedFile(
                                                bytes: Uint8List.fromList([]));
                                      });
                                    },
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      logFirebaseEvent(
                          'EDIT_PROFILE_UPLOAD_PROFILE_PIC_BTN_ON_T');
                      logFirebaseEvent('Button_store_media_for_upload');
                      final selectedMedia =
                          await selectMediaWithSourceBottomSheet(
                        context: context,
                        maxWidth: 2500.00,
                        maxHeight: 2500.00,
                        allowPhoto: true,
                      );
                      if (selectedMedia != null &&
                          selectedMedia.every((m) =>
                              validateFileFormat(m.storagePath, context))) {
                        safeSetState(() => _model.isDataUploading1 = true);
                        var selectedUploadedFiles = <FFUploadedFile>[];

                        try {
                          showUploadMessage(
                            context,
                            'Uploading file...',
                            showLoading: true,
                          );
                          selectedUploadedFiles = selectedMedia
                              .map((m) => FFUploadedFile(
                                    name: m.storagePath.split('/').last,
                                    bytes: m.bytes,
                                    height: m.dimensions?.height,
                                    width: m.dimensions?.width,
                                    blurHash: m.blurHash,
                                  ))
                              .toList();
                        } finally {
                          ScaffoldMessenger.of(context).hideCurrentSnackBar();
                          _model.isDataUploading1 = false;
                        }
                        if (selectedUploadedFiles.length ==
                            selectedMedia.length) {
                          safeSetState(() {
                            _model.uploadedLocalFile1 =
                                selectedUploadedFiles.first;
                          });
                          showUploadMessage(context, 'Success!');
                        } else {
                          safeSetState(() {});
                          showUploadMessage(context, 'Failed to upload data');
                          return;
                        }
                      }
                    },
                    text: 'Upload profile pic',
                    options: FFButtonOptions(
                      height: 40.0,
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                      iconPadding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).primaryBackground,
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                font: FlutterFlowTheme.of(context).titleSmall,
                                color: FlutterFlowTheme.of(context).primaryText,
                                letterSpacing: 0.0,
                              ),
                      elevation: 2.0,
                      borderSide: const BorderSide(
                        color: Colors.transparent,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
                Form(
                  key: _model.formKey,
                  autovalidateMode: AutovalidateMode.always,
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 16.0),
                    child: AuthUserStreamWidget(
                      builder: (context) => TextFormField(
                        controller: _model.yourNameTextController,
                        focusNode: _model.yourNameFocusNode,
                        textCapitalization: TextCapitalization.words,
                        obscureText: false,
                        decoration: InputDecoration(
                          labelText: 'Username',
                          labelStyle: FlutterFlowTheme.of(context)
                              .labelMedium
                              .override(
                                font: FlutterFlowTheme.of(context).labelMedium,
                                letterSpacing: 0.0,
                              ),
                          hintStyle: FlutterFlowTheme.of(context)
                              .labelMedium
                              .override(
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
                              color: FlutterFlowTheme.of(context).primary,
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
                          fillColor:
                              FlutterFlowTheme.of(context).primaryBackground,
                          contentPadding: const EdgeInsetsDirectional.fromSTEB(
                              20.0, 24.0, 0.0, 24.0),
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              font: FlutterFlowTheme.of(context).bodyMedium,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              letterSpacing: 0.0,
                            ),
                        maxLength: 17,
                        maxLengthEnforcement: MaxLengthEnforcement.enforced,
                        validator: _model.yourNameTextControllerValidator
                            .asValidator(context),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 12.0),
                  child: AuthUserStreamWidget(
                    builder: (context) => TextFormField(
                      controller: _model.myBioTextController,
                      focusNode: _model.myBioFocusNode,
                      textCapitalization: TextCapitalization.sentences,
                      obscureText: false,
                      decoration: InputDecoration(
                        labelText: 'Bio',
                        labelStyle: FlutterFlowTheme.of(context)
                            .labelMedium
                            .override(
                              font: FlutterFlowTheme.of(context).labelMedium,
                              letterSpacing: 0.0,
                            ),
                        hintText: 'Your bio',
                        hintStyle: FlutterFlowTheme.of(context)
                            .labelMedium
                            .override(
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
                            color: FlutterFlowTheme.of(context).primary,
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
                        fillColor:
                            FlutterFlowTheme.of(context).primaryBackground,
                        contentPadding: const EdgeInsetsDirectional.fromSTEB(
                            20.0, 24.0, 20.0, 24.0),
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            font: FlutterFlowTheme.of(context).bodyMedium,
                            letterSpacing: 0.0,
                          ),
                      textAlign: TextAlign.start,
                      maxLines: 4,
                      maxLength: 100,
                      maxLengthEnforcement: MaxLengthEnforcement.enforced,
                      validator: _model.myBioTextControllerValidator
                          .asValidator(context),
                    ),
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(0.0, 0.05),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        logFirebaseEvent(
                            'EDIT_PROFILE_SAVE_CHANGES_BTN_ON_TAP');
                        var shouldSetState = false;
                        final firestoreBatch =
                            FirebaseFirestore.instance.batch();
                        try {
                          logFirebaseEvent('Button_validate_form');
                          if (_model.formKey.currentState == null ||
                              !_model.formKey.currentState!.validate()) {
                            return;
                          }
                          if ((String username) {
                            return (username.toLowerCase() == "toowize") ||
                                (username.toLowerCase() == "toowizeapp");
                          }(_model.yourNameTextController.text)) {
                            logFirebaseEvent('Button_show_snack_bar');
                            ScaffoldMessenger.of(context).clearSnackBars();
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Username is already taken.',
                                  style: TextStyle(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                  ),
                                ),
                                duration: const Duration(milliseconds: 4000),
                                backgroundColor:
                                    FlutterFlowTheme.of(context).error,
                              ),
                            );
                            if (shouldSetState) safeSetState(() {});
                            return;
                          }
                          logFirebaseEvent('Button_firestore_query');
                          _model.displayNameExist = await queryUsersRecordOnce(
                            queryBuilder: (usersRecord) => usersRecord.where(
                              'display_name',
                              isEqualTo: _model.yourNameTextController.text,
                            ),
                            singleRecord: true,
                          ).then((s) => s.firstOrNull);
                          shouldSetState = true;
                          if ((_model.displayNameExist != null) &&
                              (_model.displayNameExist?.reference !=
                                  currentUserReference)) {
                            logFirebaseEvent('Button_show_snack_bar');
                            ScaffoldMessenger.of(context).clearSnackBars();
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Username is already taken.',
                                  style: TextStyle(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                  ),
                                ),
                                duration: const Duration(milliseconds: 4000),
                                backgroundColor:
                                    FlutterFlowTheme.of(context).error,
                              ),
                            );
                          } else {
                            logFirebaseEvent('Button_backend_call');
                            _model.moderateTextReturn =
                                await ModerateTextCall.call(
                              screenedText: _model.myBioTextController.text,
                              key: getRemoteConfigString(
                                  'azureModerationApiKey'),
                            );

                            shouldSetState = true;
                            if (valueOrDefault<bool>(
                                  ModerateTextCall.pii(
                                        (_model.moderateTextReturn?.jsonBody ??
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
                                        (_model.moderateTextReturn?.jsonBody ??
                                            ''),
                                      ),
                                      0.0,
                                    ),
                                    valueOrDefault<double>(
                                      ModerateTextCall.score2(
                                        (_model.moderateTextReturn?.jsonBody ??
                                            ''),
                                      ),
                                      0.0,
                                    ),
                                    valueOrDefault<double>(
                                      ModerateTextCall.score3(
                                        (_model.moderateTextReturn?.jsonBody ??
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
                                          'It looks like your comment may be too sexual, offensive or reveal personal information. '),
                                      actions: [
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(alertDialogContext),
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
                            if ((_model.uploadedLocalFile1.bytes?.isNotEmpty ??
                                    false)) {
                              logFirebaseEvent(
                                  'Button_upload_media_to_firebase');
                              {
                                safeSetState(
                                    () => _model.isDataUploading2 = true);
                                var selectedUploadedFiles = <FFUploadedFile>[];
                                var selectedMedia = <SelectedFile>[];
                                var downloadUrls = <String>[];
                                try {
                                  selectedUploadedFiles = _model
                                          .uploadedLocalFile1.bytes!.isNotEmpty
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
                              if (valueOrDefault<bool>(
                                    ModerateImageCall.isAdultImage(
                                      (_model.modImageReturn?.jsonBody ?? ''),
                                    ),
                                    false,
                                  ) ||
                                  valueOrDefault<bool>(
                                    ModerateImageCall.racyScore(
                                          (_model.modImageReturn?.jsonBody ??
                                              ''),
                                        )! >=
                                        0.7,
                                    false,
                                  )) {
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
                                                onPressed: () => Navigator.pop(
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
                              }
                              logFirebaseEvent('Button_backend_call');

                              firestoreBatch.update(
                                  currentUserReference!,
                                  createUsersRecordData(
                                    photoUrl: _model.uploadedFileUrl2,
                                  ));
                            }
                            logFirebaseEvent('Button_cloud_function');
                            unawaited(
                              () async {
                                try {
                                  final result = await FirebaseFunctions
                                      .instance
                                      .httpsCallable(
                                          'updateQuoteDisplayNamePic')
                                      .call({
                                    "newDisplayName":
                                        _model.yourNameTextController.text,
                                    "newPhotoURL": valueOrDefault<String>(
                                      _model.uploadedFileUrl2,
                                      'no_change',
                                    ),
                                    "currentDisplayName":
                                        currentUserDisplayName,
                                  });
                                  _model.updateNamePicReturn =
                                      UpdateQuoteDisplayNamePicCloudFunctionCallResponse(
                                    data: result.data,
                                    succeeded: true,
                                    resultAsString: result.data.toString(),
                                    jsonBody: result.data,
                                  );
                                } on FirebaseFunctionsException catch (error) {
                                  _model.updateNamePicReturn =
                                      UpdateQuoteDisplayNamePicCloudFunctionCallResponse(
                                    errorCode: error.code,
                                    succeeded: false,
                                  );
                                }
                              }(),
                            );
                            shouldSetState = true;
                            logFirebaseEvent('Button_backend_call');

                            firestoreBatch.update(
                                currentUserReference!,
                                createUsersRecordData(
                                  displayName:
                                      _model.yourNameTextController.text,
                                  bio: _model.myBioTextController.text,
                                ));
                            logFirebaseEvent('Button_navigate_back');
                            context.safePop();
                          }
                        } finally {
                          await firestoreBatch.commit();
                        }

                        if (shouldSetState) safeSetState(() {});
                      },
                      text: 'Save Changes',
                      options: FFButtonOptions(
                        width: 270.0,
                        height: 50.0,
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        iconPadding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).tertiary,
                        textStyle: FlutterFlowTheme.of(context)
                            .titleMedium
                            .override(
                              font: FlutterFlowTheme.of(context).titleMedium,
                              color: Colors.white,
                              letterSpacing: 0.0,
                            ),
                        elevation: 2.0,
                        borderSide: const BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
