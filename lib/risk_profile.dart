import 'package:cyanaseapp/risk_profile_steps.dart';
import 'package:cyanaseapp/types.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RiskProfilePage extends StatefulWidget {
  const RiskProfilePage({super.key});

  @override
  State<RiskProfilePage> createState() => _RiskProfileState();
}

class _RiskProfileState extends State<RiskProfilePage> {
  @override
  void initState() {
    resetSelections();
    super.initState();
  }

  int _step = 1;
  int score = 0;
  int totalScore = 0;

  final _formKey = GlobalKey<FormState>();
  String qn1 = '';
  String qn2 = '';
  String qn3 = '';
  String qn4 = '';
  String qn5 = '';
  String qn6 = '';
  String qn7 = '';
  String qn8 = '';
  String qn9 = '';
  String qn10 = '';
  String qn11 = '';
  String investmentOption = '';

  final conservativeA = ['40%', '45%', '10%', '5%'];
  final conservativeB = ['30%', '50%', '15%', '5%'];

  final moderateA = ['25%', '50%', '17.5%', '7.5%'];
  final moderateB = ['15%', '55%', '20%', '10%'];

  final assertiveA = ['15%', '40%', '30%', '15%'];
  final assertiveB = ['10%', '35%', '35%', '20%'];

  final aggressiveA = ['10%', '20%', '40%', '30%'];
  final aggressiveB = ['5%', '15%', '35%', '45%'];

  double get getPercent {
    double getPercentage = 0;
    getPercentage = (_step - 1) / 11 * 100;
    return double.parse(getPercentage.toStringAsFixed(2));
  }

  void resetSelections() {
    selections.updateAll((key, value) => false);
  }

  void nextStep() {
    setState(() {
      totalScore += score;
      score = 0;
      resetSelections();
      _step++;
    });
  }

  void prevStep() {
    setState(() {
      _step--;
    });
  }

  int getScore(List<int> answers) {
    return answers.fold(0, (a, b) => a + b);
  }

  List<String> getResult(int score) {
    // int score = getScore(answers);
    if (score >= 18 && score <= 23) return ['Low/Conservative', 'A'];
    if (score >= 24 && score <= 28) return ['Low/Conservative', 'B'];
    if (score >= 29 && score <= 34) return ['Moderate', 'A'];
    if (score >= 35 && score <= 40) return ['Moderate', 'B'];
    if (score >= 41 && score <= 45) return ['Assertive (Growth)', 'A'];
    if (score >= 46 && score <= 50) return ['Assertive (Growth)', 'B'];
    if (score >= 51 && score <= 55) return ['Aggressive', 'A'];
    if (score >= 56 && score <= 60) return ['Aggressive', 'B'];
    return ['Incomplete', ''];
  }

  void submit() async {
    if (!_formKey.currentState!.validate()) return;

    final url = Uri.parse('YOUR_API_URL_GOAL'); // Replace with actual API
    final token = 'TOKEN'; // Replace with actual token

    final request = http.MultipartRequest('POST', url);
    request.headers['Authorization'] = 'Token $token';
    request.fields['qn1'] = qn1;
    request.fields['qn2'] = qn2;
    request.fields['qn3'] = qn3;
    request.fields['qn4'] = qn4;
    request.fields['qn5'] = qn5;
    request.fields['qn6'] = qn6;
    request.fields['qn8'] = qn8;
    request.fields['qn9'] = qn9;
    request.fields['qn10'] = qn10;
    request.fields['qn11'] = qn11;
    request.fields['qn7'] = qn7;
    request.fields['investment_option'] = investmentOption;

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

  Widget buildRiskTable(String type, String id, List<String> allocations) {
    final headers = ['Cash', 'Credit', 'Venture', 'Absolute Return'];
    return Column(
      children: [
        Text(type, style: TextStyle(fontWeight: FontWeight.bold)),
        Table(
          border: TableBorder.all(),
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          children: [
            TableRow(
              children: [
                for (var header in [...headers])
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(header, textAlign: TextAlign.center),
                  ),
              ],
            ),
            TableRow(
              children: [
                for (var value in allocations)
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(value, textAlign: TextAlign.center),
                  ),
              ],
            ),
          ],
        ),
        SizedBox(height: 20),
      ],
    );
  }

  Map<String, bool> selections = {
    "2": false, // Saving
    "3": false, // Retirement
    "5": false, // Capital Preservation
    "7": false, // Profit Generation
  };
  int calculateScoreFromSelections() {
    int sum = 0;
    selections.forEach((key, isChecked) {
      if (isChecked) {
        sum += int.tryParse(key) ?? 0;
      }
    });
    return sum;
  }

  void handleCheckboxChange(String name, String value, bool checked) {
    setState(() {
      selections[value] = checked;
      score = calculateScoreFromSelections();
    });
  }

  Widget getAllocationWidget(int score) {
    final result = getResult(score);
    final profile = result[0];
    final id = result[1];

    if (profile == 'Low/Conservative' && id == 'A') {
      return buildRiskTable('Conservative', 'A', conservativeA);
    } else if (profile == 'Low/Conservative' && id == 'B') {
      return buildRiskTable('Conservative', 'B', conservativeB);
    } else if (profile == 'Moderate' && id == 'A') {
      return buildRiskTable('Moderate', 'A', moderateA);
    } else if (profile == 'Moderate' && id == 'B') {
      return buildRiskTable('Moderate', 'B', moderateB);
    } else if (profile == 'Assertive (Growth)' && id == 'A') {
      return buildRiskTable('Assertive', 'A', assertiveA);
    } else if (profile == 'Assertive (Growth)' && id == 'B') {
      return buildRiskTable('Assertive', 'B', assertiveB);
    } else if (profile == 'Aggressive' && id == 'A') {
      return buildRiskTable('Aggressive', 'A', aggressiveA);
    } else if (profile == 'Aggressive' && id == 'B') {
      return buildRiskTable('Aggressive', 'B', aggressiveB);
    } else {
      return Text('Incomplete Risk Profile');
    }
  }

  Widget buildStep() {
    switch (_step) {
      case 1:
        return Center(
          child: Container(
            width: double.infinity,
            height: 500,
            // margin: const EdgeInsets.symmetric(horizontal: 16),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(20),
              // boxShadow: [
              //   BoxShadow(
              //     color: Colors.black.withValues(alpha: 2),
              //     blurRadius: 10,
              //     // offset: const Offset(0, 6),
              //   ),
              // ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Top Row: Logo or Chip
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'risk profile'.toUpperCase(),
                          style: TextStyle(fontSize: 12),
                        ),
                        SizedBox(height: 16),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.6,
                          child: Text(
                            'Take your Risk Profile Today!',
                            style: TextStyle(
                              fontSize: 23,
                              height: 1,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(height: 16),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.6,
                          child: Text(
                            'This is a questionnaire to be filled by the intending Investor(you).This will help us, help you keep trackOf your investments and help you every step of the way.',
                            style: TextStyle(
                              fontSize: 14,
                              // fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(height: 16),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.6,
                          child: Text(
                            'This document is a mandatory part of each investor’ s Esteemed investing lifespan. It is mandatory for the good of every investor, to fully complete Your Profile as desired.',
                            style: TextStyle(
                              fontSize: 14,
                              // fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(children: [Icon(Icons.trending_up_rounded)]),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      child: Text(
                        'risk profile status'.toUpperCase(),
                        style: TextStyle(
                          fontSize: 12,
                          // fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      child: Text(
                        'Incomplete Risk Profile',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      case 2:
        return InvestmentQuestionStep(
          questionText: 'What are your objectives for investing?',
          questionNumber: '1',
          options: [
            InvestmentOption(label: "Saving", value: "2"),
            InvestmentOption(label: "Retirement", value: "3"),
            InvestmentOption(label: "Capital Preservation", value: "5"),
            InvestmentOption(label: "Profit Generation", value: "7"),
          ],
          currentSelections: selections,
          onChanged: handleCheckboxChange,
          step: _step,
          progressPercentage: getPercent,
        );
      case 3:
        return InvestmentQuestionStep(
          questionText: "What is your Investment Time Horizon?",
          questionNumber: "question2",
          step: _step,
          options: [
            InvestmentOption(label: "< 1 year", value: "1"),
            InvestmentOption(label: "1 - 2 years", value: "2"),
            InvestmentOption(label: "2 - 5 years", value: "3"),
            InvestmentOption(label: "> 5 years", value: "5"),
          ],
          onChanged: handleCheckboxChange,
          currentSelections: selections,
          progressPercentage: getPercent,
        );

      case 4:
        return InvestmentQuestionStep(
          questionText: "Where have you Invested in the Past?",
          questionNumber: "question3",
          step: _step,
          options: [
            InvestmentOption(label: "Treasuries", value: "1"),
            InvestmentOption(label: "Credit", value: "2"),
            InvestmentOption(label: "Alternatives", value: "3"),
            InvestmentOption(label: "Listed Equities", value: "5"),
          ],
          onChanged: handleCheckboxChange,
          currentSelections: selections,
          progressPercentage: getPercent,
        );
      case 5:
        return InvestmentQuestionStep(
          questionText:
              "What would you hold as Maximum Loss to your Portfolio?",
          questionNumber: "question4",
          step: _step,
          options: [
            InvestmentOption(label: "< 10%", value: "2"),
            InvestmentOption(label: "10 - 15%", value: "3"),
            InvestmentOption(label: "15 - 20%", value: "5"),
            InvestmentOption(label: "Up to 25%", value: "7"),
          ],
          onChanged: handleCheckboxChange,
          currentSelections: selections,
          progressPercentage: getPercent,
        );
      case 6:
        return InvestmentQuestionStep(
          questionText: "How much Capital are you considering to Invest?",
          questionNumber: "question5",
          step: _step,
          options: [
            InvestmentOption(label: "\$1k - \$2k", value: "2"),
            InvestmentOption(label: "\$2k - \$5k", value: "3"),
            InvestmentOption(label: "\$5k - \$10k", value: "5"),
            InvestmentOption(label: "> \$10k", value: "7"),
          ],
          onChanged: handleCheckboxChange,
          currentSelections: selections,
          progressPercentage: getPercent,
        );
      case 7:
        return InvestmentQuestionStep(
          questionText: "What are your Source of Funds?",
          questionNumber: "question6",
          step: _step,
          options: [
            InvestmentOption(label: "Employment", value: "2"),
            InvestmentOption(label: "Inheritance/Gift", value: "3"),
            InvestmentOption(label: "Savings/Superannuation", value: "5"),
            InvestmentOption(label: "Other", value: "0"),
          ],
          onChanged: handleCheckboxChange,
          currentSelections: selections,
          progressPercentage: getPercent,
        );
      case 8:
        return InvestmentQuestionStep(
          questionText: "Which of the following best describes your Goal?",
          questionNumber: "question7",
          step: _step,
          options: [
            InvestmentOption(
              label: "Preferably guaranteed returns, Before Tax Savings",
              value: "2",
            ),
            InvestmentOption(
              label: "Stable, reliable returns, Minimal Tax Savings",
              value: "3",
            ),
            InvestmentOption(
              label: "Moderate Variability in returns, Reasonable Tax Savings",
              value: "5",
            ),
            InvestmentOption(
              label:
                  "Unstable but potentially high returns, Maximize Tax Savings",
              value: "7",
            ),
          ],
          onChanged: handleCheckboxChange,
          currentSelections: selections,
          progressPercentage: getPercent,
        );

      case 9:
        return InvestmentQuestionStep(
          table: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "The table below shows the highest one-year gain and one-year loss on five different hypothetical investments of \$10,000.",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  height: 1,
                ),
              ),
              const SizedBox(height: 20),
              DataTable(
                columns: const [
                  DataColumn(label: Text("Portfolio")),
                  DataColumn(label: Text("Highest Gain")),
                  DataColumn(label: Text("Highest Loss")),
                ],
                rows: const [
                  DataRow(
                    cells: [
                      DataCell(Text("A")),
                      DataCell(Text("\$1,000")),
                      DataCell(Text("\$200")),
                    ],
                  ),
                  DataRow(
                    cells: [
                      DataCell(Text("B")),
                      DataCell(Text("\$1,500")),
                      DataCell(Text("\$450")),
                    ],
                  ),
                  DataRow(
                    cells: [
                      DataCell(Text("C")),
                      DataCell(Text("\$2,500")),
                      DataCell(Text("\$1,200")),
                    ],
                  ),
                  DataRow(
                    cells: [
                      DataCell(Text("D")),
                      DataCell(Text("\$4,000")),
                      DataCell(Text("\$2,200")),
                    ],
                  ),
                ],
                headingRowColor: WidgetStateProperty.all(Colors.grey.shade200),
                dataRowColor: WidgetStateProperty.all(Colors.white),
                border: TableBorder.all(color: Colors.grey.shade300),
                columnSpacing: 30,
                headingTextStyle: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
            ],
          ),
          questionText:
              "Given the potential Profit / Loss, where would you invest your money?",
          questionNumber: "question8",
          step: _step,
          options: [
            InvestmentOption(label: "A", value: "2"),
            InvestmentOption(label: "B", value: "3"),
            InvestmentOption(label: "C", value: "5"),
            InvestmentOption(label: "D", value: "7"),
          ],
          onChanged: handleCheckboxChange,
          currentSelections: selections,
          progressPercentage: getPercent,
        );
      case 10:
        return InvestmentQuestionStep(
          questionText:
              "Do you feel you are appropriately covered against personal and/or business risks, such as accidents, illness, trauma or death?",
          questionNumber: "question9",
          step: _step,
          options: [
            InvestmentOption(label: "Yes", value: "2"),
            InvestmentOption(label: "No", value: "1"),
          ],
          onChanged: handleCheckboxChange,
          currentSelections: selections,
          progressPercentage: getPercent,
        );
      case 11:
        return InvestmentQuestionStep(
          questionText:
              "Would you consider borrowing money to make a future investment?",
          questionNumber: "question10",
          step: _step,
          options: [
            InvestmentOption(label: "Yes", value: "3"),
            InvestmentOption(label: "No", value: "1"),
          ],
          onChanged: handleCheckboxChange,
          currentSelections: selections,
          progressPercentage: getPercent,
        );
      case 12:
        return InvestmentQuestionStep(
          questionText:
              "Considering the negative impact of inflation on your Savings, growth investing if often used to counteract its effect, while exposing you to short - term volatility. ? Which of the following options best resonates with you?",
          questionNumber: "question11",
          step: _step,
          options: [
            InvestmentOption(
              label: "I am comfortable with the arrangement to beat inflation",
              value: "5",
            ),
            InvestmentOption(
              label:
                  "I know the risks associated with inflation, but I would prefer middle ground",
              value: "3",
            ),
            InvestmentOption(
              label:
                  "It could reduce my savings but I have no tolerance for loss",
              value: "2",
            ),
          ],
          onChanged: handleCheckboxChange,
          currentSelections: selections,
          progressPercentage: getPercent,
        );
      case 13:
        return Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(Icons.add_chart_rounded, size: 40),
              const SizedBox(height: 16),
              const Text(
                "Risk Profile",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              const Text(
                "You have completed your Risk Profile Questionnare.",
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  const Text(
                    "Your Score: ",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.amber,
                    ),
                    child: Text(
                      "$totalScore",
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Based on your score, your Risk Analysis is: ",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              getAllocationWidget(totalScore),
              const SizedBox(height: 12),
              Text(
                score < 18 ? "" : 'Your assets will be allocated as follows: ',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        );
      default:
        return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    final isFinalStep = _step == 13;
    final isInitialStep = _step == 1;

    return Scaffold(
      appBar: AppBar(title: Text('Take Risk Profile')),
      body: Form(
        key: _formKey,
        child: Container(
          color: Colors.grey[100],
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              Expanded(child: buildStep()),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (_step > 1)
                    TextButton(onPressed: prevStep, child: Text('Previous')),
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
                          ? 'Submit'
                          : isInitialStep
                          ? 'Get Started'
                          : (_step == 12)
                          ? 'Review Score'
                          : 'Next',
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
