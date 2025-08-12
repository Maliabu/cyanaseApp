import 'package:cyanaseapp/features/invest/application/invest_form_provider.dart';
import 'package:cyanaseapp/features/invest/domain/invest_form_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RelworxButton extends ConsumerWidget {
  final InvestFormState formState;

  const RelworxButton({super.key, required this.formState});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final submissionState = ref.watch(investFormViewModelProvider);

    return ElevatedButton(
      onPressed:
          submissionState is AsyncLoading
              ? null
              : () async {
                await ref
                    .read(investFormViewModelProvider.notifier)
                    .relworx(formState);
              },
      child: submissionState.maybeWhen(
        loading: () => const CircularProgressIndicator(color: Colors.white),
        orElse: () => const Text('Submit Investment'),
      ),
    );
  }
}

class FlutterWave extends ConsumerWidget {
  final InvestFormState formState;

  const FlutterWave({super.key, required this.formState});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final submissionState = ref.watch(investFormViewModelProvider);

    return ElevatedButton(
      onPressed:
          submissionState is AsyncLoading
              ? null
              : () async {
                await ref
                    .read(investFormViewModelProvider.notifier)
                    .flutterwave(formState);
              },
      child: submissionState.maybeWhen(
        loading: () => const CircularProgressIndicator(color: Colors.white),
        orElse: () => const Text('Submit Investment'),
      ),
    );
  }
}
