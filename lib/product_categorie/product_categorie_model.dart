import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_autocomplete_options_list.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'product_categorie_widget.dart' show ProductCategorieWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProductCategorieModel extends FlutterFlowModel<ProductCategorieWidget> {
  ///  Local state fields for this page.

  bool busco = false;

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
  // Stores action output result for [Backend Call - Query Rows] action in productCategorie widget.
  List<ProductsRow>? productos;
  // State field(s) for TextField widget.
  final textFieldKey = GlobalKey();
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? textFieldSelectedOption;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode?.dispose();
  }
}
