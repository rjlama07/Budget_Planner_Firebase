import 'package:flutter/material.dart';
import 'package:myapp/utils/assets_source.dart/images_source.dart';
import 'package:myapp/utils/constants/constants.dart';
import 'package:myapp/utils/extensions/build_context_extension.dart';
import 'package:myapp/view/add_imcome_expense/widgets/info_container.dart';

class AddIncomeExpence extends StatelessWidget {
  const AddIncomeExpence({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7FAFC),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 21),
          child: Column(
            children: [
              Row(
                children: [
                  InkWell(
                      onTap: () => Navigator.pop(context),
                      child: const Icon(Icons.arrow_back_ios)),
                  const Spacer(),
                  const Text(
                    "Add New Transaction",
                    style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              encIncContainer(
                onTap: () => context.navigatorPushNamed(Routes.addIncome),
                title: "Income",
                svgIcon: SvgIconsSource.incomeSvg,
                color: const Color(0xFF47B6D4),
              ),
              const SizedBox(
                height: 20,
              ),
              encIncContainer(
                onTap: () => context.navigatorPushNamed(Routes.addExpense),
                title: "Expense",
                svgIcon: SvgIconsSource.expenseSvg,
                color: const Color(0xFFEE1E5F),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
