import '../database.dart';

class ProductsTable extends SupabaseTable<ProductsRow> {
  @override
  String get tableName => 'products';

  @override
  ProductsRow createRow(Map<String, dynamic> data) => ProductsRow(data);
}

class ProductsRow extends SupabaseDataRow {
  ProductsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ProductsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  int? get tProductId => getField<int>('t_product_id');
  set tProductId(int? value) => setField<int>('t_product_id', value);

  String? get productName => getField<String>('product_name');
  set productName(String? value) => setField<String>('product_name', value);

  String? get productDescription => getField<String>('product_description');
  set productDescription(String? value) =>
      setField<String>('product_description', value);

  String? get productImg => getField<String>('product_img');
  set productImg(String? value) => setField<String>('product_img', value);

  bool? get productPublished => getField<bool>('product_published');
  set productPublished(bool? value) =>
      setField<bool>('product_published', value);

  int? get variantId => getField<int>('variant_id');
  set variantId(int? value) => setField<int>('variant_id', value);

  double? get price => getField<double>('price');
  set price(double? value) => setField<double>('price', value);

  String? get value => getField<String>('value');
  set value(String? value) => setField<String>('value', value);

  List<int> get categories => getListField<int>('categories');
  set categories(List<int>? value) => setListField<int>('categories', value);

  List<String> get tags => getListField<String>('tags');
  set tags(List<String>? value) => setListField<String>('tags', value);
}
