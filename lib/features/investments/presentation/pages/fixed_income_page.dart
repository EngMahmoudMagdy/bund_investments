import 'package:bund_investments/core/utils/app_colors.dart';
import 'package:bund_investments/features/investments/data/models/bonds_response.dart';
import 'package:bund_investments/features/investments/presentation/bloc/fixed_income_bloc.dart';
import 'package:bund_investments/features/investments/presentation/widgets/bond_item.dart';
import 'package:bund_investments/features/investments/presentation/widgets/shimmer_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class FixedIncomePage extends StatefulWidget {
  const FixedIncomePage({super.key});

  @override
  State<FixedIncomePage> createState() => _FixedIncomePageState();
}

class _FixedIncomePageState extends State<FixedIncomePage> {
  int investmentAmount = 10000; // Initial investment amount
  int selectedTerm = 3; // Initial investment amount
  double yTM = 0.0681; // Initial investment amount
  String investmentAmountText = ''; // Initial investment amount
  String capitalAtMaturityText = ''; // Initial investment amount
  String totalInterestText = ''; // Initial investment amount
  String annualInterestText = ''; // Initial investment amount
  String averageMaturityDateText = '';

  bool _isLoading = false;

  List<Bond> items = [];

  late FixedIncomeBloc bloc; // Initial investment amount

  @override
  void initState() {
    bloc = BlocProvider.of(context)..add(RetrieveBonds());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _calculateInterests();
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
        body: BlocListener<FixedIncomeBloc, FixedIncomeState>(
          bloc: bloc,
          listener: (context, state) {
            _isLoading = false;
            if (state is LoadingState) {
              setState(() {
                _isLoading = true;
              });
            }
            if (state is ErrorState) {
              ScaffoldMessenger.of(context)
                ..clearSnackBars()
                ..showSnackBar(
                  SnackBar(
                    content: const Text('Internet connection issue.'),
                    action: SnackBarAction(
                      label: 'Retry',
                      onPressed: () {
                        bloc.add(RetrieveBonds());
                      },
                    ),
                  ),
                );
            }
            if (state is BondsLoaded) {
              setState(() {
                items.clear();
                items.addAll(state.bondList);
              });
            }
          },
          child: Stack(
            children: [
              Positioned.fill(
                child: Container(
                  color: AppColor.backgroundColor,
                ),
              ),
              CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 18),
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
                                side: BorderSide(
                                  color: Color(0x0A1C2C56),
                                ),
                                labelStyle: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12,
                                  color: AppColor.lightColor,
                                ),
                                backgroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(4),
                                  ),
                                ),
                              ),
                              Chip(
                                label: Text('5 Year Term'),
                                side: BorderSide(
                                  color: Color(0x0A1C2C56),
                                ),
                                backgroundColor: Colors.white,
                                labelStyle: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12,
                                  color: AppColor.lightColor,
                                ),
                                shape: RoundedRectangleBorder(
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
                                    Expanded(
                                      child: Center(
                                        child: Text(
                                          investmentAmountText,
                                          style: const TextStyle(
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
                                ),
                                const Center(
                                  child: Chip(
                                    label: Text('6.81% YTM'),
                                    side: BorderSide(
                                      color: Color(0x1A46AF35),
                                    ),
                                    labelStyle: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12,
                                      color: Color(0xFF46AF35),
                                    ),
                                    backgroundColor: Color(0x1A46AF35),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(4),
                                      ),
                                    ),
                                  ),
                                ),
                                Wrap(
                                  crossAxisAlignment: WrapCrossAlignment.center,
                                  spacing: 10,
                                  children: [
                                    ChoiceChip(
                                      label: const Text('3 Year Term'),
                                      side: const BorderSide(
                                        color: Color(0x0A1C2C56),
                                      ),
                                      labelStyle: const TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12,
                                        color: AppColor.lightColor,
                                      ),
                                      backgroundColor: Colors.white,
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(4),
                                        ),
                                      ),
                                      selected: selectedTerm == 3,
                                      onSelected: (value) {
                                        setState(() {
                                          selectedTerm = 3;
                                          _calculateInterests();
                                        });
                                      },
                                    ),
                                    ChoiceChip(
                                      label: const Text('5 Year Term'),
                                      side: const BorderSide(
                                        color: Color(0x0A1C2C56),
                                      ),
                                      backgroundColor: Colors.white,
                                      labelStyle: const TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12,
                                        color: AppColor.lightColor,
                                      ),
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(4),
                                        ),
                                      ),
                                      selected: selectedTerm == 5,
                                      onSelected: (value) {
                                        setState(() {
                                          selectedTerm = 5;
                                          _calculateInterests();
                                        });
                                      },
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            'Capital At Maturity',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 12,
                                              color: AppColor.lightColor,
                                            ),
                                          ),
                                          Text(
                                            capitalAtMaturityText,
                                            style: const TextStyle(
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          const Text(
                                            'Total Interest',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 12,
                                              color: AppColor.lightColor,
                                            ),
                                          ),
                                          Text(
                                            totalInterestText,
                                            style: const TextStyle(
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
                                Row(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            'Annual Interest',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 12,
                                              color: AppColor.lightColor,
                                            ),
                                          ),
                                          Text(
                                            annualInterestText,
                                            style: const TextStyle(
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          const Text(
                                            'Average Maturity Date ',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 12,
                                              color: AppColor.lightColor,
                                            ),
                                          ),
                                          Text(
                                            averageMaturityDateText,
                                            style: const TextStyle(
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
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 18),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 30),
                          Text(
                            'Bonds',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              color: AppColor.primaryColor,
                            ),
                          ),
                          SizedBox(height: 4),
                        ],
                      ),
                    ),
                  ),
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      childCount: items.length + (_isLoading ? 1 : 0),
                      (context, index) {
                        if (_isLoading) {
                          return const ShimmerItem();
                        }
                        return BondItem(item: items[index]);
                      },
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 18, vertical: 12),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColor.primaryColor,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(6),
                            ),
                          ),
                        ),
                        onPressed: _onCreateInvestmentAccount,
                        child: Container(
                          margin: const EdgeInsets.all(19),
                          child: const Text(
                            'Create Investment Account',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }

  void _minusAmount() {
    if (investmentAmount > 10000) {
      investmentAmount -= 10000; // Increment by $10000
      investmentAmount = investmentAmount.clamp(
          10000, 100000); // Clamp to the minimum of $10000
    } else if (investmentAmount <= 10000 && investmentAmount > 1000) {
      investmentAmount -= 1000; // Decrement by $1,000
      investmentAmount =
          investmentAmount.clamp(1000, 10000); // Clamp to the minimum of $1000
    } else if (investmentAmount <= 1000) {
      investmentAmount -= 50; // Decrement by $50
      investmentAmount =
          investmentAmount.clamp(250, 1000); // Clamp to the minimum of $250
    }
    _calculateInterests();
  }

  void _addAmount() {
    if (investmentAmount >= 10000) {
      investmentAmount += 10000; // Increment by $1,000
      investmentAmount = investmentAmount.clamp(
          10000, 100000); // Clamp to the minimum of 10000
    } else if (investmentAmount < 10000 && investmentAmount >= 1000) {
      investmentAmount += 1000; // Increment by $1,000
      investmentAmount =
          investmentAmount.clamp(1000, 10000); // Clamp to the minimum of $1000
    } else if (investmentAmount < 1000) {
      investmentAmount += 50; // Increment by $50
      investmentAmount =
          investmentAmount.clamp(250, 1000); // Clamp to the minimum of $250
    }
    _calculateInterests();
  }

  void _onCreateInvestmentAccount() {
    Navigator.of(context).pop();
  }

  void _calculateInterests() {
    // Use NumberFormat to format the amount as currency
    final currencyFormat = NumberFormat.currency(
      decimalDigits: 0,
      locale: 'en_US', // You can adjust the locale based on your needs
      symbol: '\$', // Add the currency symbol
    );

    final capitalAtMaturity =
        (yTM * selectedTerm * investmentAmount) + investmentAmount;
    final totalInterest = yTM * selectedTerm * investmentAmount;
    final annualInterest = yTM * investmentAmount;
    averageMaturityDateText = DateTime.now()
        .add(Duration(
          days: selectedTerm * 365,
        ))
        .year
        .toString();
    setState(() {
      investmentAmountText = currencyFormat.format(investmentAmount);
      capitalAtMaturityText = currencyFormat.format(capitalAtMaturity);
      totalInterestText = currencyFormat.format(totalInterest);
      annualInterestText = currencyFormat.format(annualInterest);
    });
  }
}
