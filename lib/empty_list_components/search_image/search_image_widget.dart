import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'search_image_model.dart';
export 'search_image_model.dart';

class SearchImageWidget extends StatefulWidget {
  const SearchImageWidget({super.key});

  @override
  State<SearchImageWidget> createState() => _SearchImageWidgetState();
}

class _SearchImageWidgetState extends State<SearchImageWidget> {
  late SearchImageModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SearchImageModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).primaryBtnText,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 15.0, 15.0),
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
          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
          child: Text(
            'Search for an image to brighten up your quote',
            textAlign: TextAlign.center,
            style: FlutterFlowTheme.of(context).labelLarge.override(
                  font: FlutterFlowTheme.of(context).labelLarge,
                  letterSpacing: 0.0,
                ),
          ),
        ),
      ],
    );
  }
}
