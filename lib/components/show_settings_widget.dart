import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'show_settings_model.dart';
export 'show_settings_model.dart';

class ShowSettingsWidget extends StatefulWidget {
  const ShowSettingsWidget({super.key});

  @override
  State<ShowSettingsWidget> createState() => _ShowSettingsWidgetState();
}

class _ShowSettingsWidgetState extends State<ShowSettingsWidget> {
  late ShowSettingsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ShowSettingsModel());

    _model.switchValue = true;
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 270.0,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 5.0,
            color: Color(0x3B1D2429),
            offset: Offset(
              0.0,
              -3.0,
            ),
          )
        ],
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(16.0),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(25.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Align(
              alignment: AlignmentDirectional(-1.0, 0.0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 30.0),
                child: Text(
                  'Configuración',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Sigmar',
                        fontSize: 20.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w300,
                      ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Align(
                    alignment: AlignmentDirectional(-1.0, 0.0),
                    child: Text(
                      'Push Notifications',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Sigmar',
                            fontSize: 20.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w300,
                          ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(-0.65, 0.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 0.0),
                      child: Switch.adaptive(
                        value: _model.switchValue!,
                        onChanged: (newValue) async {
                          setState(() => _model.switchValue = newValue!);
                        },
                        activeColor: FlutterFlowTheme.of(context).primary,
                        activeTrackColor: FlutterFlowTheme.of(context).primary,
                        inactiveTrackColor:
                            FlutterFlowTheme.of(context).secondaryText,
                        inactiveThumbColor:
                            FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Align(
                  alignment: AlignmentDirectional(-1.0, 0.0),
                  child: Text(
                    'Términos de la App',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Sigmar',
                          fontSize: 20.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w300,
                        ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
