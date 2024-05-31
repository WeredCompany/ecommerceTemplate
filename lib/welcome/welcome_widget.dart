import '/components/show_settings_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'welcome_model.dart';
export 'welcome_model.dart';

class WelcomeWidget extends StatefulWidget {
  const WelcomeWidget({super.key});

  @override
  State<WelcomeWidget> createState() => _WelcomeWidgetState();
}

class _WelcomeWidgetState extends State<WelcomeWidget>
    with TickerProviderStateMixin {
  late WelcomeModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WelcomeModel());

    animationsMap.addAll({
      'textOnPageLoadAnimation': AnimationInfo(
        loop: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ShakeEffect(
            curve: Curves.linear,
            delay: 0.0.ms,
            duration: 3000.0.ms,
            hz: 2,
            offset: Offset(0.0, 0.0),
            rotation: 0.035,
          ),
        ],
      ),
    });
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
        backgroundColor: Color(0xFFFF6C30),
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              Container(
                width: double.infinity,
                height: MediaQuery.sizeOf(context).height * 1.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: Image.asset(
                      'assets/images/New_Project_(1).jpg',
                    ).image,
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(-0.68, -0.79),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(
                    'assets/images/Logo_hd_(3).png',
                    width: 150.0,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.09, -0.47),
                child: Text(
                  'Redescubriendo \nel placer\nde jugar',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Sigmar',
                        fontSize: 35.0,
                        letterSpacing: 0.0,
                      ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(-0.08, 0.23),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(
                    'assets/images/New_Project_(24).png',
                    width: 228.0,
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(-0.08, 0.13),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    context.goNamed('AppTrucha');
                  },
                  child: Text(
                    'Comenzar',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Sigmar',
                          color: FlutterFlowTheme.of(context).primaryBackground,
                          fontSize: 35.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.normal,
                        ),
                  ),
                ).animateOnPageLoad(animationsMap['textOnPageLoadAnimation']!),
              ),
              Align(
                alignment: AlignmentDirectional(0.87, 0.94),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    await showModalBottomSheet(
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      context: context,
                      builder: (context) {
                        return WebViewAware(
                          child: GestureDetector(
                            onTap: () => _model.unfocusNode.canRequestFocus
                                ? FocusScope.of(context)
                                    .requestFocus(_model.unfocusNode)
                                : FocusScope.of(context).unfocus(),
                            child: Padding(
                              padding: MediaQuery.viewInsetsOf(context),
                              child: ShowSettingsWidget(),
                            ),
                          ),
                        );
                      },
                    ).then((value) => safeSetState(() {}));
                  },
                  child: Icon(
                    Icons.settings_outlined,
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    size: 35.0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
