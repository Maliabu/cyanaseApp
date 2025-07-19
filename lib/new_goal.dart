import 'package:cyanaseapp/goal_ad.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class NewGoalPage extends StatefulWidget {
  final String country;
  final bool verification;
  final String complete;

  const NewGoalPage({
    super.key,
    required this.country,
    required this.verification,
    required this.complete,
  });

  @override
  _NewGoalPage createState() => _NewGoalPage();
}

class _NewGoalPage extends State<NewGoalPage> {
  int _step = 1;

  final _formKey = GlobalKey<FormState>();
  String goalName = '';
  int goalPeriod = 1;
  double goalAmount = 0;
  String depositType = 'manual';
  String depositRate = 'monthly';
  String reminderDay = 'Monday';

  String get accountType => widget.country != "USD" ? "basic" : "dollar";

  double get depositAmount {
    final months = goalPeriod * 12;
    double base = goalAmount / months;
    return depositRate == "weekly" ? base / 4 : base;
  }

  void nextStep() {
    setState(() {
      _step++;
    });
  }

  void prevStep() {
    setState(() {
      _step--;
    });
  }

  void submit() async {
    if (!_formKey.currentState!.validate()) return;

    final url = Uri.parse('YOUR_API_URL_GOAL'); // Replace with actual API
    final token = 'TOKEN'; // Replace with actual token

    final request = http.MultipartRequest('POST', url);
    request.headers['Authorization'] = 'Token $token';
    request.fields['goal_name'] = goalName;
    request.fields['goal_period'] = goalPeriod.toString();
    request.fields['goal_amount'] = goalAmount.toString();
    request.fields['deposit_type'] = depositType;
    request.fields['deposit_rate'] = depositRate;
    request.fields['deposit_reminder_day'] = reminderDay;
    request.fields['account_type'] = accountType;

    try {
      final streamedResponse = await request.send();
      final response = await http.Response.fromStream(streamedResponse);
      if (response.statusCode == 200) {
        // Handle success
        print('Goal created successfully');
      } else {
        // Handle failure
        print('Failed: ${response.body}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  Widget summaryRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(fontSize: 14, color: Colors.black87),
          ),
          Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget buildStep() {
    Widget child;

    switch (_step) {
      case 1:
        child = Center(child: GoalAd());
        break;
      case 2:
        child = Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Add a Goal", style: TextStyle(fontSize: 22)),
            const SizedBox(height: 16),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Goal Name'),
              validator:
                  (value) => value!.isEmpty ? 'Goal name required' : null,
              onChanged: (val) => goalName = val,
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Goal Period (Years)',
              ),
              keyboardType: TextInputType.number,
              onChanged: (val) => goalPeriod = int.tryParse(val) ?? 1,
            ),
          ],
        );
        break;
      case 3:
        child = Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Goal Amount", style: TextStyle(fontSize: 22)),
            const SizedBox(height: 16),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Amount'),
              keyboardType: TextInputType.number,
              onChanged: (val) => goalAmount = double.tryParse(val) ?? 0,
            ),
            const SizedBox(height: 16),
            Text(
              "Estimated Monthly Deposit: ${depositAmount.toStringAsFixed(2)}",
            ),
          ],
        );
        break;
      case 4:
        child = Column(
          children: [
            ListTile(
              title: const Text('Weekly'),
              leading: Radio<String>(
                value: 'weekly',
                groupValue: depositRate,
                onChanged: (value) => setState(() => depositRate = value!),
              ),
            ),
            ListTile(
              title: const Text('Monthly'),
              leading: Radio<String>(
                value: 'monthly',
                groupValue: depositRate,
                onChanged: (value) => setState(() => depositRate = value!),
              ),
            ),
          ],
        );
        break;
      case 5:
        child = Column(
          children: [
            const Text("Choose Reminder Day", style: TextStyle(fontSize: 18)),
            ...[
              'Monday',
              'Tuesday',
              'Wednesday',
              'Thursday',
              'Friday',
              'Saturday',
              'Sunday',
            ].map(
              (day) => RadioListTile(
                title: Text(day),
                value: day,
                groupValue: reminderDay,
                onChanged: (value) => setState(() => reminderDay = value!),
              ),
            ),
          ],
        );
        break;
      case 6:
        child = Column(
          children: [
            ListTile(
              title: const Text('Auto Deposit'),
              leading: Radio<String>(
                value: 'auto',
                groupValue: depositType,
                onChanged: (value) => setState(() => depositType = value!),
              ),
            ),
            ListTile(
              title: const Text('Manual Deposit'),
              leading: Radio<String>(
                value: 'manual',
                groupValue: depositType,
                onChanged: (value) => setState(() => depositType = value!),
              ),
            ),
          ],
        );
        break;
      case 7:
        child = Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Summary", style: TextStyle(fontSize: 22)),
            const SizedBox(height: 16),
            summaryRow("Goal Name", goalName),
            summaryRow("Total Amount", goalAmount.toStringAsFixed(0)),
            summaryRow("Period (Years)", goalPeriod.toString()),
            summaryRow("Deposit Rate", depositRate),
            summaryRow("Reminder Day", reminderDay),
            summaryRow("Monthly Deposit", depositAmount.toStringAsFixed(2)),
          ],
        );
        break;

      default:
        child = Container();
    }

    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.only(top: 16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: child,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isFinalStep = _step == 7;
    final isInitialStep = _step == 1;

    return Scaffold(
      appBar: AppBar(title: Text('Create New Goal')),
      body: Container(
        color: Colors.grey[100],
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Expanded(child: buildStep()),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if (_step > 1)
                      TextButton(
                        onPressed: prevStep,
                        child: const Text('Previous'),
                      ),
                    ElevatedButton(
                      onPressed: isFinalStep ? submit : nextStep,
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 20,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text(
                        isFinalStep
                            ? 'Create Goal'
                            : isInitialStep
                            ? 'Get Started'
                            : 'Next',
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
