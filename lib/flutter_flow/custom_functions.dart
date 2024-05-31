import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/auth/firebase_auth/auth_util.dart';

double returncartprice(double value) {
  return value * -1;
}

dynamic listToJson(List<ItemStruct> products) {
  // return a Json from the list
  List<Map<String, dynamic>> productList = [];
  for (var product in products) {
    productList.add({'variant_id': product.id, 'quantity': product.cantidad});
  }
  return productList;
}

double sumarLista(List<double> precios) {
  // sum the list and return the value
  double sum = 0.0;
  for (double precio in precios) {
    sum += precio;
  }
  return sum;
}
