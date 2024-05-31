import '../database.dart';

class OrdersTable extends SupabaseTable<OrdersRow> {
  @override
  String get tableName => 'orders';

  @override
  OrdersRow createRow(Map<String, dynamic> data) => OrdersRow(data);
}

class OrdersRow extends SupabaseDataRow {
  OrdersRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => OrdersTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String? get contactEmail => getField<String>('contact_email');
  set contactEmail(String? value) => setField<String>('contact_email', value);

  String? get contactName => getField<String>('contact_name');
  set contactName(String? value) => setField<String>('contact_name', value);

  String? get currency => getField<String>('currency');
  set currency(String? value) => setField<String>('currency', value);

  String? get paymentStatus => getField<String>('payment_status');
  set paymentStatus(String? value) => setField<String>('payment_status', value);

  List<int> get productIds => getListField<int>('product_ids');
  set productIds(List<int>? value) => setListField<int>('product_ids', value);

  List<String> get productImgs => getListField<String>('product_imgs');
  set productImgs(List<String>? value) =>
      setListField<String>('product_imgs', value);

  String? get checkoutUrl => getField<String>('checkout_url');
  set checkoutUrl(String? value) => setField<String>('checkout_url', value);

  int? get tOrderId => getField<int>('t_order_id');
  set tOrderId(int? value) => setField<int>('t_order_id', value);

  String? get orderTotal => getField<String>('order_total');
  set orderTotal(String? value) => setField<String>('order_total', value);
}
