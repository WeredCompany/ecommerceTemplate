import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:math';
import 'product_detail_widget.dart' show ProductDetailWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProductDetailModel extends FlutterFlowModel<ProductDetailWidget> {
  ///  Local state fields for this page.

  ProductsRow? producto;

  List<ProductsRow> variants = [];
  void addToVariants(ProductsRow item) => variants.add(item);
  void removeFromVariants(ProductsRow item) => variants.remove(item);
  void removeAtIndexFromVariants(int index) => variants.removeAt(index);
  void insertAtIndexInVariants(int index, ProductsRow item) =>
      variants.insert(index, item);
  void updateVariantsAtIndex(int index, Function(ProductsRow) updateFn) =>
      variants[index] = updateFn(variants[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - Query Rows] action in ProductDetail widget.
  List<ProductsRow>? variantsOtp;
  // State field(s) for coffeeSizeOptions widget.
  FormFieldController<List<String>>? coffeeSizeOptionsValueController;
  String? get coffeeSizeOptionsValue =>
      coffeeSizeOptionsValueController?.value?.firstOrNull;
  set coffeeSizeOptionsValue(String? val) =>
      coffeeSizeOptionsValueController?.value = val != null ? [val] : [];

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
