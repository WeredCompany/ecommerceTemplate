import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'empty_orders_buscadas_model.dart';
export 'empty_orders_buscadas_model.dart';

class EmptyOrdersBuscadasWidget extends StatefulWidget {
  const EmptyOrdersBuscadasWidget({super.key});

  @override
  State<EmptyOrdersBuscadasWidget> createState() =>
      _EmptyOrdersBuscadasWidgetState();
}

class _EmptyOrdersBuscadasWidgetState extends State<EmptyOrdersBuscadasWidget> {
  late EmptyOrdersBuscadasModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmptyOrdersBuscadasModel());
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
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        FaIcon(
          FontAwesomeIcons.sadTear,
          color: FlutterFlowTheme.of(context).secondaryText,
          size: 72.0,
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
          child: Text(
            'Ups!\nNo hay una orden relacionada con ese número!',
            textAlign: TextAlign.center,
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Poppins',
                  letterSpacing: 0.0,
                ),
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
          child: Text(
            'Mas información aqui',
            textAlign: TextAlign.center,
            style: FlutterFlowTheme.of(context).labelMedium.override(
                  fontFamily: 'Poppins',
                  fontSize: 15.0,
                  letterSpacing: 0.0,
                ),
          ),
        ),
      ],
    );
  }
}
