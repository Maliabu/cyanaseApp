import 'package:cyanaseapp/core/utilities/currencies.dart';
import 'package:cyanaseapp/core/models/types.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<ConversionResult> conversion({
  required String from,
  required double input,
  required String to,
}) async {
  final fromCurrency =
      (from.isEmpty || from == "null") ? "usd" : from.toLowerCase();
  final toCurrency = to.toLowerCase();

  final url = Uri.parse(
    'https://cdn.jsdelivr.net/npm/@fawazahmed0/currency-api@latest/v1/currencies/$fromCurrency.json',
  );

  try {
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final rate = data[fromCurrency]?[toCurrency];

      if (rate != null) {
        final converted = input * (rate as num);
        return ConversionResult(amount: converted);
      } else {
        return ConversionResult(
          amount: 0.0,
          error: "Currency code '$toCurrency' not found.",
        );
      }
    } else {
      return ConversionResult(
        amount: 0.0,
        error:
            'Failed to fetch conversion data (status: ${response.statusCode}).',
      );
    }
  } catch (e) {
    return ConversionResult(amount: 0.0, error: "Unexpected error: $e");
  }
}

GetCurrencyResult getCurrency(String countryCode) {
  for (final obj in codes) {
    if (obj['code'] == countryCode) {
      final currency = obj['currency'];
      if (currency != null && currency.isNotEmpty) {
        return GetCurrencyResult(currency: currency);
      } else {
        return GetCurrencyResult(
          currency: '',
          error: "Currency not defined for country code '$countryCode'.",
        );
      }
    }
  }

  return GetCurrencyResult(
    currency: '',
    error: "Country code '$countryCode' not found.",
  );
}
