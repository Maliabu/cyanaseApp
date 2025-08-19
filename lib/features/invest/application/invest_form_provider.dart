import 'package:cyanaseapp/features/invest/domain/invest_form_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'invest_form_notifier.dart';

final investFormProvider =
    NotifierProvider<InvestFormNotifier, InvestFormState>(
      () => InvestFormNotifier(),
    );
