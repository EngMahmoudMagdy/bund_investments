import 'package:bund_investments/core/utils/app_colors.dart';
import 'package:bund_investments/features/investments/presentation/pages/fixed_income_page.dart';
import 'package:flutter/material.dart';

class InvestmentPage extends StatefulWidget {
  const InvestmentPage({super.key});

  @override
  State<InvestmentPage> createState() => _InvestmentPageState();
}

class _InvestmentPageState extends State<InvestmentPage> {
  final items = <String>[];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          shape: const CircleBorder(),
          onPressed: _onAddNewInvestment,
          child: const Icon(
            Icons.add,
            color: AppColor.primaryColor,
          )),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (items.isNotEmpty)
            ListView.builder(
              itemBuilder: (context, index) {
                return SizedBox();
              },
            ),
          if (items.isEmpty)
            const Center(
              child: Text(
                'No Investments found!',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 24,
                  color: AppColor.primaryColor,
                ),
              ),
            ),
        ],
      ),
    );
  }

  void _onAddNewInvestment() {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const FixedIncomePage(),
    ));
  }
}
