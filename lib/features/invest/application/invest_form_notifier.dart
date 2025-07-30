import 'package:cyanaseapp/core/models/fund_manager.dart';
import 'package:cyanaseapp/core/models/investment_class.dart';
import 'package:cyanaseapp/core/models/investment_class_option.dart';
import 'package:cyanaseapp/core/services/api_service.dart';
import 'package:cyanaseapp/features/invest/domain/invest_form_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class InvestFormNotifier extends Notifier<InvestFormState> {
  @override
  InvestFormState build() => InvestFormState.initial();

  void nextStep() => state = state.copyWith(step: state.step + 1);
  void previousStep() => state = state.copyWith(step: state.step - 1);

  void selectFundManager(FundManager fundManager) {
    state = state.copyWith(
      selectedFundManager: fundManager,
      step: state.step + 1,
    );
  }

  void selectInvestmentClass(InvestmentClass investmentClass) {
    state = state.copyWith(
      selectedInvestmentClass: investmentClass,
      step: state.step + 1,
    );
  }

  void selectInvestmentClassoption(
    InvestmentClassOption investmentClassOption,
  ) {
    state = state.copyWith(
      selectedInvestmentClassOption: investmentClassOption,
      step: state.step + 1,
    );
  }

  void setPaymentMeans(String means) =>
      state = state.copyWith(paymentMeans: means);

  void setDepositAmount(String amount) =>
      state = state.copyWith(depositAmount: amount);

  Future<void> submitForm(ApiService api) async {
    final state = this.state;

    final payload = {
      "fund_manager_id": state.selectedFundManager?.userId,
      "class_option": state.selectedInvestmentClassOption?.name,
      "amount": state.depositAmount,
      "payment_method": state.paymentMeans,
      // more fields...
    };

    try {
      final response = await api.post("investments/submit", payload);
      // handle success: maybe update state or navigate
    } catch (e) {
      // handle error: update state or notify UI
      rethrow;
    }
  }
}
