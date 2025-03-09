import '/flutter_flow/flutter_flow_util.dart';
import 'auth_page_widget.dart' show AuthPageWidget;
import 'package:flutter/material.dart';

class AuthPageModel extends FlutterFlowModel<AuthPageWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for emailAddressEnter widget.
  FocusNode? emailAddressEnterFocusNode;
  TextEditingController? emailAddressEnterTextController;
  String? Function(BuildContext, String?)?
      emailAddressEnterTextControllerValidator;
  // State field(s) for passwordEnter widget.
  FocusNode? passwordEnterFocusNode;
  TextEditingController? passwordEnterTextController;
  late bool passwordEnterVisibility;
  String? Function(BuildContext, String?)? passwordEnterTextControllerValidator;

  @override
  void initState(BuildContext context) {
    passwordEnterVisibility = false;
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    emailAddressEnterFocusNode?.dispose();
    emailAddressEnterTextController?.dispose();

    passwordEnterFocusNode?.dispose();
    passwordEnterTextController?.dispose();
  }
}
