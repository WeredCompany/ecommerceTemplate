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
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'product_detail_model.dart';
export 'product_detail_model.dart';

class ProductDetailWidget extends StatefulWidget {
  const ProductDetailWidget({
    super.key,
    this.productRef,
  });

  final ProductsRow? productRef;

  @override
  State<ProductDetailWidget> createState() => _ProductDetailWidgetState();
}

class _ProductDetailWidgetState extends State<ProductDetailWidget>
    with TickerProviderStateMixin {
  late ProductDetailModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProductDetailModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.producto = widget.productRef;
      setState(() {});
      _model.variantsOtp = await ProductsTable().queryRows(
        queryFn: (q) => q.eq(
          't_product_id',
          widget.productRef?.tProductId,
        ),
      );
      _model.variants = _model.variantsOtp!.toList().cast<ProductsRow>();
      setState(() {});
    });

    animationsMap.addAll({
      'containerOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: Offset(0.0, 100.0),
            end: Offset(0.0, 0.0),
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
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        body: Container(
          width: double.infinity,
          height: double.infinity,
          child: Stack(
            alignment: AlignmentDirectional(0.0, -1.0),
            children: [
              Align(
                alignment: AlignmentDirectional(0.0, -1.0),
                child: Image.network(
                  valueOrDefault<String>(
                    _model.producto?.productImg,
                    'Loading',
                  ),
                  width: double.infinity,
                  height: 500.0,
                  fit: BoxFit.cover,
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.0, -0.87),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 40.0,
                        height: 40.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 4.0,
                              color: Color(0x520E151B),
                              offset: Offset(
                                0.0,
                                2.0,
                              ),
                            )
                          ],
                          borderRadius: BorderRadius.circular(50.0),
                          shape: BoxShape.rectangle,
                        ),
                        child: FlutterFlowIconButton(
                          borderColor: Colors.transparent,
                          borderRadius: 8.0,
                          borderWidth: 1.0,
                          buttonSize: 40.0,
                          icon: Icon(
                            Icons.arrow_back_rounded,
                            color: FlutterFlowTheme.of(context).primary,
                            size: 20.0,
                          ),
                          onPressed: () async {
                            context.pop();
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              if (responsiveVisibility(
                context: context,
                tablet: false,
                tabletLandscape: false,
                desktop: false,
              ))
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 140.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        height: 400.0,
                        decoration: BoxDecoration(
                          color: Color(0x59000000),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 15.0, 0.0, 0.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      valueOrDefault<String>(
                                        _model.producto?.productName,
                                        'Loading',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: Colors.white,
                                            fontSize: 28.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                    Text(
                                      valueOrDefault<String>(
                                        _model.producto?.tProductId?.toString(),
                                        'Loading',
                                      ).maybeHandleOverflow(
                                        maxChars: 45,
                                        replacement: '…',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: Colors.white,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.normal,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 100.0, 0.0, 0.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(0.0, 1.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 300.0, 0.0, 0.0),
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Color(0xFFF8F7FA),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 4.0,
                                  color: Color(0x320E151B),
                                  offset: Offset(
                                    0.0,
                                    -2.0,
                                  ),
                                )
                              ],
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(0.0),
                                bottomRight: Radius.circular(0.0),
                                topLeft: Radius.circular(40.0),
                                topRight: Radius.circular(40.0),
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 12.0, 0.0, 0.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 30.0, 0.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          'Variante',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Poppins',
                                                fontSize: 20.0,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 0.0, 0.0, 0.0),
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.all(10.0),
                                            child: FutureBuilder<
                                                List<ProductsRow>>(
                                              future: ProductsTable().queryRows(
                                                queryFn: (q) => q.eq(
                                                  't_product_id',
                                                  widget.productRef?.tProductId,
                                                ),
                                              ),
                                              builder: (context, snapshot) {
                                                // Customize what your widget looks like when it's loading.
                                                if (!snapshot.hasData) {
                                                  return Center(
                                                    child: SizedBox(
                                                      width: 50.0,
                                                      height: 50.0,
                                                      child:
                                                          CircularProgressIndicator(
                                                        valueColor:
                                                            AlwaysStoppedAnimation<
                                                                Color>(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                }
                                                List<ProductsRow>
                                                    coffeeSizeOptionsProductsRowList =
                                                    snapshot.data!;
                                                return FlutterFlowChoiceChips(
                                                  options:
                                                      coffeeSizeOptionsProductsRowList
                                                          .map((e) => e.value)
                                                          .withoutNulls
                                                          .toList()
                                                          .map((label) =>
                                                              ChipData(label))
                                                          .toList(),
                                                  onChanged: (val) async {
                                                    setState(() => _model
                                                            .coffeeSizeOptionsValue =
                                                        val?.firstOrNull);
                                                    _model.producto = _model
                                                        .variants
                                                        .where((e) =>
                                                            e.value ==
                                                            _model
                                                                .coffeeSizeOptionsValue)
                                                        .toList()
                                                        .first;
                                                    setState(() {});
                                                  },
                                                  selectedChipStyle: ChipStyle(
                                                    backgroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primary,
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: Colors.white,
                                                          fontSize: 18.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w300,
                                                        ),
                                                    iconColor: Colors.white,
                                                    iconSize: 18.0,
                                                    labelPadding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(15.0, 5.0,
                                                                15.0, 5.0),
                                                    elevation: 5.0,
                                                  ),
                                                  unselectedChipStyle:
                                                      ChipStyle(
                                                    backgroundColor:
                                                        Colors.white,
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .bodySmall
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color:
                                                              Color(0xCC000000),
                                                          fontSize: 18.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                    iconColor:
                                                        Color(0xCC000000),
                                                    iconSize: 18.0,
                                                    labelPadding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(15.0, 5.0,
                                                                15.0, 5.0),
                                                    elevation: 4.0,
                                                  ),
                                                  chipSpacing: 30.0,
                                                  rowSpacing: 12.0,
                                                  multiselect: false,
                                                  initialized: _model
                                                          .coffeeSizeOptionsValue !=
                                                      null,
                                                  alignment:
                                                      WrapAlignment.start,
                                                  controller: _model
                                                          .coffeeSizeOptionsValueController ??=
                                                      FormFieldController<
                                                          List<String>>(
                                                    [widget.productRef!.value!],
                                                  ),
                                                  wrapped: true,
                                                );
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 30.0, 0.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          'Descripción',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Poppins',
                                                fontSize: 20.0,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 0.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Expanded(
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 5.0, 40.0, 0.0),
                                            child: Text(
                                              valueOrDefault<String>(
                                                _model.producto
                                                    ?.productDescription,
                                                'Loading',
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        fontSize: 14.0,
                                                        letterSpacing: 1.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 50.0, 16.0, 40.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        FFAppState().cartsum =
                                            FFAppState().cartsum +
                                                _model.producto!.price!;
                                        FFAppState().addToCarItems(ItemStruct(
                                          id: _model.producto?.variantId,
                                          price: _model.producto?.price,
                                          cantidad: 1,
                                        ));
                                        setState(() {});
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              'Added to cart!',
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                            duration:
                                                Duration(milliseconds: 4000),
                                            backgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                          ),
                                        );
                                      },
                                      child: Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                1.0,
                                        height: 80.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          borderRadius:
                                              BorderRadius.circular(60.0),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  35.0, 0.0, 35.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Text(
                                                'Add to Cart',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: Colors.white,
                                                          fontSize: 20.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                              ),
                                              SizedBox(
                                                height: 30.0,
                                                child: VerticalDivider(
                                                  thickness: 1.0,
                                                  color: Colors.white,
                                                ),
                                              ),
                                              Text(
                                                valueOrDefault<String>(
                                                  formatNumber(
                                                    _model.producto?.price,
                                                    formatType:
                                                        FormatType.custom,
                                                    format: '\$',
                                                    locale: '',
                                                  ),
                                                  'Loading',
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: Colors.white,
                                                          fontSize: 20.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ).animateOnPageLoad(
                              animationsMap['containerOnPageLoadAnimation']!),
                        ),
                      ),
                    ],
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
