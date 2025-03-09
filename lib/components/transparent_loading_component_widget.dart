import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'transparent_loading_component_model.dart';
export 'transparent_loading_component_model.dart';

class TransparentLoadingComponentWidget extends StatefulWidget {
  const TransparentLoadingComponentWidget({super.key});

  @override
  State<TransparentLoadingComponentWidget> createState() =>
      _TransparentLoadingComponentWidgetState();
}

class _TransparentLoadingComponentWidgetState
    extends State<TransparentLoadingComponentWidget> {
  late TransparentLoadingComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TransparentLoadingComponentModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      '   ',
      style: FlutterFlowTheme.of(context).bodyMedium.override(
            font: FlutterFlowTheme.of(context).bodyMedium,
            fontSize: 11.0,
            letterSpacing: 0.0,
          ),
    );
  }
}
