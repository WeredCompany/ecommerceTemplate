import '/backend/supabase/supabase.dart';
import '/components/empty_orders_buscadas_widget.dart';
import '/components/empty_orders_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'buscar_orden_widget.dart' show BuscarOrdenWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class BuscarOrdenModel extends FlutterFlowModel<BuscarOrdenWidget> {
  ///  Local state fields for this page.

  bool busco = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Model for EmptyOrders component.
  late EmptyOrdersModel emptyOrdersModel;

  @override
  void initState(BuildContext context) {
    emptyOrdersModel = createModel(context, () => EmptyOrdersModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();

    emptyOrdersModel.dispose();
  }
}
