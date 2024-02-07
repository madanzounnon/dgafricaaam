import 'package:shop_app/models/country.dart';

class Utils {
  static int ascendingSort(Country c1, Country c2) =>
      c1.name.compareTo(c2.name);
}
