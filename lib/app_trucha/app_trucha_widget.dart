import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_web_view.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'app_trucha_model.dart';
export 'app_trucha_model.dart';

class AppTruchaWidget extends StatefulWidget {
  const AppTruchaWidget({super.key});

  @override
  State<AppTruchaWidget> createState() => _AppTruchaWidgetState();
}

class _AppTruchaWidgetState extends State<AppTruchaWidget> {
  late AppTruchaModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AppTruchaModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primary,
        body: SafeArea(
          top: true,
          child: FlutterFlowWebView(
            content: 'https://weredtienda.mitiendanube.com/',
            bypass: false,
            height: MediaQuery.sizeOf(context).height * 1.0,
            verticalScroll: false,
            horizontalScroll: false,
          ),
        ),
      ),
    );
  }
}
