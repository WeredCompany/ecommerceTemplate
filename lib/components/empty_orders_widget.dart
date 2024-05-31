import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'empty_orders_model.dart';
export 'empty_orders_model.dart';

class EmptyOrdersWidget extends StatefulWidget {
  const EmptyOrdersWidget({super.key});

  @override
  State<EmptyOrdersWidget> createState() => _EmptyOrdersWidgetState();
}

class _EmptyOrdersWidgetState extends State<EmptyOrdersWidget> {
  late EmptyOrdersModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmptyOrdersModel());
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
        Icon(
          Icons.shopping_cart,
          color: FlutterFlowTheme.of(context).secondaryText,
          size: 72.0,
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
          child: Text(
            'Utilizá el Numero de orden que aparece en tu compra!',
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
            'No lo encontrás? Mas información aqui',
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
