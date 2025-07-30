import 'package:flutter/material.dart';

class Questions extends StatefulWidget {
  final String title;
  final String sub;

  const Questions({super.key, required this.title, required this.sub});

  @override
  State<Questions> createState() => _QuestionsState();
}

class _QuestionsState extends State<Questions> {
  bool isExpanded = false;

  void toggle() {
    setState(() {
      isExpanded = !isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 0,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: toggle,
              behavior: HitTestBehavior.translucent,
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      widget.title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        height: 1.3,
                      ),
                    ),
                  ),
                  Icon(
                    isExpanded
                        ? Icons.keyboard_arrow_up
                        : Icons.keyboard_arrow_down,
                    size: 24,
                    color: Colors.grey,
                  ),
                ],
              ),
            ),
            AnimatedCrossFade(
              firstChild: const SizedBox.shrink(),
              secondChild: Padding(
                padding: const EdgeInsets.only(top: 8, left: 4, right: 4),
                child: Text(
                  widget.sub,
                  style: const TextStyle(fontSize: 14, height: 1.4),
                ),
              ),
              crossFadeState:
                  isExpanded
                      ? CrossFadeState.showSecond
                      : CrossFadeState.showFirst,
              duration: const Duration(milliseconds: 300),
            ),
          ],
        ),
      ),
    );
  }
}

class FAQsPage extends StatelessWidget {
  const FAQsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('FAQs')),
      body: Container(
        color: Colors.grey[100],
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: const [
              Questions(
                title: 'FAQs',
                sub:
                    'Get answers to a list of typical questions that you might wish to ask Cyanase',
              ),
              Questions(
                title: 'What is Cyanase',
                sub:
                    'Cyanase is a technology company that partners with licensed financial firms including banks, investment companies and money lenders to offer investment services, business loans and saving groups to world’s internet users. The company was initially started to help students invest such that they have a start point after school.',
              ),
              Questions(
                title: 'How do I make a Deposit',
                sub:
                    'You can make a general deposit straight from your wallet or from your credit account without any goals. Alternatively you can start by creating a Goal, populating a risk profile and sequentially continue to deposit recurring amounts to achieve this goal.',
              ),
              Questions(
                title: 'What is the Risk Profile',
                sub:
                    'The risk profiler is located under the investments settings and is intended for professional investors, to grade and check how much they can accommodate an investment risk.',
              ),
              Questions(
                title: 'How do I withdraw my money',
                sub:
                    'Under the Withdrawals tab on your left activity menu, click the withdraw button. Withdraws are only successful after 3 days from the deposit month.',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
