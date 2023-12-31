import 'package:bund_investments/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class FixedIncomePage extends StatefulWidget {
  const FixedIncomePage({super.key});

  @override
  State<FixedIncomePage> createState() => _FixedIncomePageState();
}

class _FixedIncomePageState extends State<FixedIncomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Fixed Income',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w600,
              color: AppColor.primaryColor,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: AppColor.backgroundColor,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Fixed Income Portfolio',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 22,
                  color: AppColor.primaryColor,
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                'A fixed income portfolio consists of bonds and other securities providing steady income and relatively lower risk.',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  color: AppColor.subTitleColor,
                ),
              ),
              const SizedBox(height: 30),
              const Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Annual Yield To Maturity (YTM) ',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                        color: AppColor.lightColor,
                      ),
                    ),
                    Icon(
                      size: 16,
                      Icons.info,
                      color: AppColor.lightColor,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 4),
              const Center(
                child: Text(
                  '6.81%',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 32,
                    color: AppColor.primaryColor,
                  ),
                ),
              ),
              const SizedBox(height: 5),
              const Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Average Rating',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                            color: AppColor.lightColor,
                          ),
                        ),
                        Text(
                          'AA',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 22,
                            color: AppColor.primaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'Bonds',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                            color: AppColor.lightColor,
                          ),
                        ),
                        Text(
                          '20 Companies',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 22,
                            color: AppColor.primaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              const Text(
                'Term Types',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                  color: AppColor.lightColor,
                ),
              ),
              const Wrap(
                spacing: 10,
                children: [
                  Chip(
                    label: Text('3 Year Term'),
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                      color: AppColor.lightColor,
                    ),
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: Color(0x0A1C2C56),
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(4),
                      ),
                    ),
                  ),
                  Chip(
                    label: Text('5 Year Term'),
                    backgroundColor: Colors.white,
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                      color: AppColor.lightColor,
                    ),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: Color(0x0A1C2C56),
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(4),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              const Text(
                'Investment Calculator',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: AppColor.primaryColor,
                ),
              ),
              const SizedBox(height: 15),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Investment Amount',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                        color: AppColor.lightColor,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        FloatingActionButton(
                          shape: const CircleBorder(),
                          mini: true,
                          onPressed: _minusAmount,
                          backgroundColor: AppColor.backgroundColor,
                          child: const Icon(
                            Icons.remove,
                            color: AppColor.primaryColor,
                          ),
                        ),
                        const Expanded(
                          child: Center(
                            child: Text(
                              '\$10,000',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 36,
                                color: AppColor.primaryColor,
                              ),
                            ),
                          ),
                        ),
                        FloatingActionButton(
                          shape: const CircleBorder(),
                          mini: true,
                          onPressed: _addAmount,
                          backgroundColor: AppColor.backgroundColor,
                          child: const Icon(
                            Icons.add,
                            color: AppColor.primaryColor,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _minusAmount() {}

  void _addAmount() {}
}
