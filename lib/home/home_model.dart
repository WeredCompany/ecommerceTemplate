import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/components/logo_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:math';
import 'home_widget.dart' show HomeWidget;
import 'package:badges/badges.dart' as badges;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class HomeModel extends FlutterFlowModel<HomeWidget> {
  ///  Local state fields for this page.

  List<ProductsRow> products = [];
  void addToProducts(ProductsRow item) => products.add(item);
  void removeFromProducts(ProductsRow item) => products.remove(item);
  void removeAtIndexFromProducts(int index) => products.removeAt(index);
  void insertAtIndexInProducts(int index, ProductsRow item) =>
      products.insert(index, item);
  void updateProductsAtIndex(int index, Function(ProductsRow) updateFn) =>
      products[index] = updateFn(products[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - Query Rows] action in Home widget.
  List<ProductsRow>? productos;
  // Model for logo component.
  late LogoModel logoModel1;
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];
  // Stores action output result for [Backend Call - Query Rows] action in ChoiceChips widget.
  List<CategoriesRow>? categoria;
  // Stores action output result for [Backend Call - Query Rows] action in ChoiceChips widget.
  List<ProductsRow>? productosOtp;
  // Model for logo component.
  late LogoModel logoModel2;

  @override
  void initState(BuildContext context) {
    logoModel1 = createModel(context, () => LogoModel());
    logoModel2 = createModel(context, () => LogoModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    logoModel1.dispose();
    logoModel2.dispose();
  }
}
