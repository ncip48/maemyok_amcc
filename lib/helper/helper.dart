import 'package:intl/intl.dart';

formatRupiah(int value) {
  final formatCurrency =
      new NumberFormat.simpleCurrency(locale: 'id_ID', decimalDigits: 0);
  return formatCurrency.format(value);
}
