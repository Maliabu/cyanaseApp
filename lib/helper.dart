import 'package:cyanaseapp/currencies.dart';

String getCurrency(String countryCode) {
  // Look up the currency for the given country code from the codes list
  for (final obj in codes) {
    if (obj['code'] == countryCode) {
      return obj['currency'] ?? '';
    }
  }
  return ''; // Return empty string if not found
}
