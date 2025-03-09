import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'create_page_widget.dart' show CreatePageWidget;
import 'package:flutter/material.dart';

class CreatePageModel extends FlutterFlowModel<CreatePageWidget> {
  ///  Local state fields for this page.

  bool selectingUploadSource = false;

  String? tempFirestoreURL;

  bool isImageUploaded = false;

  ///  State fields for stateful widgets in this page.

  final formKey1 = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
  // State field(s) for quoteText widget.
  FocusNode? quoteTextFocusNode;
  TextEditingController? quoteTextTextController;
  String? Function(BuildContext, String?)? quoteTextTextControllerValidator;
  String? _quoteTextTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Some quote text is required';
    }

    if (val.length > 200) {
      return 'Maximum 200 characters allowed, currently ${val.length}.';
    }

    return null;
  }

  // State field(s) for contextAuthor widget.
  FocusNode? contextAuthorFocusNode;
  TextEditingController? contextAuthorTextController;
  String? Function(BuildContext, String?)? contextAuthorTextControllerValidator;
  String? _contextAuthorTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Said by is required when \"Add who said it\" is turned on.';
    }

    if (val.length > 25) {
      return 'Maximum 25 characters allowed, currently ${val.length}.';
    }

    return null;
  }

  // State field(s) for contextBackstory widget.
  FocusNode? contextBackstoryFocusNode;
  TextEditingController? contextBackstoryTextController;
  String? Function(BuildContext, String?)?
      contextBackstoryTextControllerValidator;
  // State field(s) for contextSwitch widget.
  bool? contextSwitchValue;
  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Stores action output result for [Backend Call - API (moderateText)] action in Button widget.
  ApiCallResponse? morderateTextReturn;
  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl2 = '';

  // Stores action output result for [Backend Call - API (moderateImage)] action in Button widget.
  ApiCallResponse? modImageReturn;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  QuotesRecord? createdQuoteDoc;
  // Stores action output result for [AdMob - Show Interstitial Ad] action in Button widget.
  bool? interstitialAdSuccess;

  @override
  void initState(BuildContext context) {
    quoteTextTextControllerValidator = _quoteTextTextControllerValidator;
    contextAuthorTextControllerValidator =
        _contextAuthorTextControllerValidator;
  }

  @override
  void dispose() {
    quoteTextFocusNode?.dispose();
    quoteTextTextController?.dispose();

    contextAuthorFocusNode?.dispose();
    contextAuthorTextController?.dispose();

    contextBackstoryFocusNode?.dispose();
    contextBackstoryTextController?.dispose();
  }
}
