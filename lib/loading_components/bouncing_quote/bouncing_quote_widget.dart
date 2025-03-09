import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'bouncing_quote_model.dart';
export 'bouncing_quote_model.dart';

class BouncingQuoteWidget extends StatefulWidget {
  const BouncingQuoteWidget({super.key});

  @override
  State<BouncingQuoteWidget> createState() => _BouncingQuoteWidgetState();
}

class _BouncingQuoteWidgetState extends State<BouncingQuoteWidget> {
  late BouncingQuoteModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BouncingQuoteModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const AlignmentDirectional(0.0, 0.0),
      child: Lottie.asset(
        'assets/jsons/bouncingQuote.json',
        width: 80.0,
        height: 100.0,
        fit: BoxFit.cover,
        animate: true,
      ),
    );
  }
}
