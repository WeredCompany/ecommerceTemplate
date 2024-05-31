import 'package:supabase_flutter/supabase_flutter.dart' hide Provider;

export 'database/database.dart';

const _kSupabaseUrl = 'https://wcrlvuejgwbgfwixyrfn.supabase.co';
const _kSupabaseAnonKey =
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Indjcmx2dWVqZ3diZ2Z3aXh5cmZuIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTQyMzM1MjEsImV4cCI6MjAyOTgwOTUyMX0.YVVYj66iywlaZs4XDlQv9KjHeyt4CBsgS60hz31KVyM';

class SupaFlow {
  SupaFlow._();

  static SupaFlow? _instance;
  static SupaFlow get instance => _instance ??= SupaFlow._();

  final _supabase = Supabase.instance.client;
  static SupabaseClient get client => instance._supabase;

  static Future initialize() => Supabase.initialize(
        url: _kSupabaseUrl,
        anonKey: _kSupabaseAnonKey,
        debug: false,
      );
}
