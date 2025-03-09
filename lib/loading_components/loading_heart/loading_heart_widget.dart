import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'loading_heart_model.dart';
export 'loading_heart_model.dart';

class LoadingHeartWidget extends StatefulWidget {
  const LoadingHeartWidget({super.key});

  @override
  State<LoadingHeartWidget> createState() => _LoadingHeartWidgetState();
}

class _LoadingHeartWidgetState extends State<LoadingHeartWidget> {
  late LoadingHeartModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LoadingHeartModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.favorite_border,
      color: FlutterFlowTheme.of(context).secondaryText,
      size: 32.0,
    );
  }
}
