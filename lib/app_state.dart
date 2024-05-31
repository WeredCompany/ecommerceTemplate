import 'package:flutter/material.dart';
import '/backend/schema/structs/index.dart';
import 'backend/api_requests/api_manager.dart';
import 'backend/supabase/supabase.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:csv/csv.dart';
import 'package:synchronized/synchronized.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    secureStorage = FlutterSecureStorage();
    await _safeInitAsync(() async {
      _cartsum = await secureStorage.getDouble('ff_cartsum') ?? _cartsum;
    });
    await _safeInitAsync(() async {
      _isLiked = await secureStorage.getBool('ff_isLiked') ?? _isLiked;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late FlutterSecureStorage secureStorage;

  double _cartsum = 0.0;
  double get cartsum => _cartsum;
  set cartsum(double _value) {
    _cartsum = _value;
    secureStorage.setDouble('ff_cartsum', _value);
  }

  void deleteCartsum() {
    secureStorage.delete(key: 'ff_cartsum');
  }

  int _size = 0;
  int get size => _size;
  set size(int _value) {
    _size = _value;
  }

  bool _isLiked = false;
  bool get isLiked => _isLiked;
  set isLiked(bool _value) {
    _isLiked = _value;
    secureStorage.setBool('ff_isLiked', _value);
  }

  void deleteIsLiked() {
    secureStorage.delete(key: 'ff_isLiked');
  }

  List<int> _favorite = [];
  List<int> get favorite => _favorite;
  set favorite(List<int> _value) {
    _favorite = _value;
  }

  void addToFavorite(int _value) {
    _favorite.add(_value);
  }

  void removeFromFavorite(int _value) {
    _favorite.remove(_value);
  }

  void removeAtIndexFromFavorite(int _index) {
    _favorite.removeAt(_index);
  }

  void updateFavoriteAtIndex(
    int _index,
    int Function(int) updateFn,
  ) {
    _favorite[_index] = updateFn(_favorite[_index]);
  }

  void insertAtIndexInFavorite(int _index, int _value) {
    _favorite.insert(_index, _value);
  }

  List<int> _cartItems = [];
  List<int> get cartItems => _cartItems;
  set cartItems(List<int> _value) {
    _cartItems = _value;
  }

  void addToCartItems(int _value) {
    _cartItems.add(_value);
  }

  void removeFromCartItems(int _value) {
    _cartItems.remove(_value);
  }

  void removeAtIndexFromCartItems(int _index) {
    _cartItems.removeAt(_index);
  }

  void updateCartItemsAtIndex(
    int _index,
    int Function(int) updateFn,
  ) {
    _cartItems[_index] = updateFn(_cartItems[_index]);
  }

  void insertAtIndexInCartItems(int _index, int _value) {
    _cartItems.insert(_index, _value);
  }

  List<ItemStruct> _carItems = [];
  List<ItemStruct> get carItems => _carItems;
  set carItems(List<ItemStruct> _value) {
    _carItems = _value;
  }

  void addToCarItems(ItemStruct _value) {
    _carItems.add(_value);
  }

  void removeFromCarItems(ItemStruct _value) {
    _carItems.remove(_value);
  }

  void removeAtIndexFromCarItems(int _index) {
    _carItems.removeAt(_index);
  }

  void updateCarItemsAtIndex(
    int _index,
    ItemStruct Function(ItemStruct) updateFn,
  ) {
    _carItems[_index] = updateFn(_carItems[_index]);
  }

  void insertAtIndexInCarItems(int _index, ItemStruct _value) {
    _carItems.insert(_index, _value);
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}

extension FlutterSecureStorageExtensions on FlutterSecureStorage {
  static final _lock = Lock();

  Future<void> writeSync({required String key, String? value}) async =>
      await _lock.synchronized(() async {
        await write(key: key, value: value);
      });

  void remove(String key) => delete(key: key);

  Future<String?> getString(String key) async => await read(key: key);
  Future<void> setString(String key, String value) async =>
      await writeSync(key: key, value: value);

  Future<bool?> getBool(String key) async => (await read(key: key)) == 'true';
  Future<void> setBool(String key, bool value) async =>
      await writeSync(key: key, value: value.toString());

  Future<int?> getInt(String key) async =>
      int.tryParse(await read(key: key) ?? '');
  Future<void> setInt(String key, int value) async =>
      await writeSync(key: key, value: value.toString());

  Future<double?> getDouble(String key) async =>
      double.tryParse(await read(key: key) ?? '');
  Future<void> setDouble(String key, double value) async =>
      await writeSync(key: key, value: value.toString());

  Future<List<String>?> getStringList(String key) async =>
      await read(key: key).then((result) {
        if (result == null || result.isEmpty) {
          return null;
        }
        return CsvToListConverter()
            .convert(result)
            .first
            .map((e) => e.toString())
            .toList();
      });
  Future<void> setStringList(String key, List<String> value) async =>
      await writeSync(key: key, value: ListToCsvConverter().convert([value]));
}
