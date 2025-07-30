import 'package:cyanaseapp/core/services/conversion.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// Dummy Subscription widget stub (replace with your actual payment widget)
class Subscription extends StatelessWidget {
  final String phone, name, country, email, currency;
  final double amount;
  final VoidCallback submit;

  const Subscription({
    super.key,
    required this.phone,
    required this.name,
    required this.country,
    required this.email,
    required this.amount,
    required this.currency,
    required this.submit,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Payment widget here for $currency $amount"),
        ElevatedButton(onPressed: submit, child: Text("Pay Now")),
      ],
    );
  }
}

class Subscribe extends StatefulWidget {
  final String substatus;
  final String phone;
  final String email;
  final String country;
  final String name;

  const Subscribe({
    super.key,
    required this.substatus,
    required this.phone,
    required this.email,
    required this.country,
    required this.name,
  });

  @override
  State<Subscribe> createState() => _SubscribeState();
}

class _SubscribeState extends State<Subscribe> {
  int step = 1;
  Map<String, dynamic> formData = {
    "reference_id": 0,
    "reference": "",
    "tx_ref": "CYANASE-TEST-001",
    "amount": 20500,
  };
  double? convertedAmount;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadConvertedAmount();
  }

  Future<void> loadConvertedAmount() async {
    final currency = getCurrency(widget.country);
    if (currency.error != null) {
      // theres an error message string
      if (kDebugMode) {
        print('error: ${currency.error}');
      }
    } else {
      // no error string was returned
      final result = await conversion(
        from: "ugx",
        input: (formData['amount'] as num).toDouble(),
        to: currency.currency.toLowerCase(),
      );

      setState(() {
        convertedAmount = result.amount;
        isLoading = false;
      });
    }
  }

  void _next() {
    setState(() {
      step += 1;
    });
  }

  void _prev() {
    setState(() {
      step -= 1;
    });
  }

  void onSubmit() {
    // Your submit logic here
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Submit clicked!')));
  }

  Widget previousButton() {
    if (step != 1) {
      return OutlinedButton(onPressed: _prev, child: const Text("Previous"));
    }
    return const SizedBox.shrink();
  }

  Widget submitButton() {
    if (step == 2) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: ElevatedButton(onPressed: onSubmit, child: const Text("Submit")),
      );
    }
    return const SizedBox.shrink();
  }

  Widget nextButton() {
    if (step == 1) {
      if (widget.substatus.toLowerCase() == "subscribed") {
        return const SizedBox.shrink();
      }
      return Padding(
        padding: const EdgeInsets.all(12.0),
        child: ElevatedButton(onPressed: _next, child: const Text("Subscribe")),
      );
    }
    return const SizedBox.shrink();
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          const SizedBox(height: 12),
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.grey[100],
            child: Icon(Icons.card_membership, size: 30, color: Colors.black),
          ),
          const SizedBox(height: 12),
          Text(
            "Subscription",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          const SizedBox(height: 12),

          // Step 1
          if (step == 1)
            Column(
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                  child: Text(
                    "This is a yearly fee of UGX 20500. Your account subscription "
                    "becomes overdue after 30 days from account creation after which "
                    "you are required to pay your subscription.",
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 16),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black26),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Account Status: "),
                      Text(
                        widget.substatus,
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
              ],
            ),

          // Step 2
          if (step == 2 && convertedAmount != null)
            Column(
              children: [
                Text(
                  "Proceed to pay ${widget.country.toUpperCase()} ${convertedAmount!.toStringAsFixed(2)} for subscription",
                  style: const TextStyle(fontSize: 18),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                Subscription(
                  phone: widget.phone,
                  name: widget.name,
                  country: widget.country,
                  email: widget.email,
                  amount: convertedAmount!,
                  currency: widget.country.toUpperCase(),
                  submit: onSubmit,
                ),
              ],
            ),

          // Buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [previousButton(), nextButton(), submitButton()],
          ),
        ],
      ),
    );
  }
}
