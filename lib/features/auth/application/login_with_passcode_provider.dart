import 'package:flutter_riverpod/flutter_riverpod.dart';

/// State provider for the passcode input
final passcodeProvider = StateProvider<String>((ref) => '');

/// Provider for loading state
final isLoadingProvider = StateProvider<bool>((ref) => false);

/// Provider for error message
final errorProvider = StateProvider<String?>((ref) => null);

/// Fake authentication function
Future<bool> authenticate(String passcode) async {
  await Future.delayed(Duration(seconds: 2)); // Simulate network delay
  return passcode == "1234"; // Replace with real logic
}
