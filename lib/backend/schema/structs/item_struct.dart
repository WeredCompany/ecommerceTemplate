// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ItemStruct extends BaseStruct {
  ItemStruct({
    int? id,
    double? price,
    int? cantidad,
  })  : _id = id,
        _price = price,
        _cantidad = cantidad;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;
  void incrementId(int amount) => _id = id + amount;
  bool hasId() => _id != null;

  // "price" field.
  double? _price;
  double get price => _price ?? 0.0;
  set price(double? val) => _price = val;
  void incrementPrice(double amount) => _price = price + amount;
  bool hasPrice() => _price != null;

  // "cantidad" field.
  int? _cantidad;
  int get cantidad => _cantidad ?? 0;
  set cantidad(int? val) => _cantidad = val;
  void incrementCantidad(int amount) => _cantidad = cantidad + amount;
  bool hasCantidad() => _cantidad != null;

  static ItemStruct fromMap(Map<String, dynamic> data) => ItemStruct(
        id: castToType<int>(data['id']),
        price: castToType<double>(data['price']),
        cantidad: castToType<int>(data['cantidad']),
      );

  static ItemStruct? maybeFromMap(dynamic data) =>
      data is Map ? ItemStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'price': _price,
        'cantidad': _cantidad,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'price': serializeParam(
          _price,
          ParamType.double,
        ),
        'cantidad': serializeParam(
          _cantidad,
          ParamType.int,
        ),
      }.withoutNulls;

  static ItemStruct fromSerializableMap(Map<String, dynamic> data) =>
      ItemStruct(
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        price: deserializeParam(
          data['price'],
          ParamType.double,
          false,
        ),
        cantidad: deserializeParam(
          data['cantidad'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'ItemStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ItemStruct &&
        id == other.id &&
        price == other.price &&
        cantidad == other.cantidad;
  }

  @override
  int get hashCode => const ListEquality().hash([id, price, cantidad]);
}

ItemStruct createItemStruct({
  int? id,
  double? price,
  int? cantidad,
}) =>
    ItemStruct(
      id: id,
      price: price,
      cantidad: cantidad,
    );
