import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myapp/utils/assets_source.dart/images_source.dart';
import 'package:myapp/view/add_imcome_expense/provider/income_expense_provider.dart';
import 'package:myapp/view/add_imcome_expense/view/expense/widget/bottom_sheer.dart';
import 'package:myapp/widgets/svg_icons.dart';

class Expense extends StatefulWidget {
  const Expense({super.key});

  @override
  State<Expense> createState() => _ExpenseState();
}

class _ExpenseState extends State<Expense> {
  late bool _isModalShown;
  late TextEditingController categoryController;
  late TextEditingController amountController;
  late TextEditingController monthController;
  late TextEditingController noteController;

  @override
  void initState() {
    _isModalShown = false;
    categoryController = TextEditingController();
    amountController = TextEditingController();
    monthController = TextEditingController();
    noteController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (!_isModalShown) {
      _isModalShown = true;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        showModalBottomSheet(
          context: context,
          builder: (context) {
            return categoryBottomSheet(
              context,
              categoryController,
            );
          },
        );
      });
    }
    return Scaffold(
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
                "Add New Expense",
                style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
              ),
              const Spacer(),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SvgIcon(
                icon: SvgIconsSource.expenseSvg,
                height: 32,
                color: Color(0xFFFC2D2D),
              ),
              const SizedBox(width: 8), //
              Expanded(
                  child: Center(
                child: TextFormField(
                  controller: categoryController,
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return categoryBottomSheet(context, categoryController);
                      },
                    );
                  },
                  expands: false,
                  readOnly: true,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    hintText: "Select a category",
                    hintStyle: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFFFC2D2D),
                    ),
                  ),
                ),
              )),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SvgIcon(
                icon: SvgIconsSource.expenseSvg,
                height: 32,
                color: Color(0xFFFC2D2D),
              ),
              const SizedBox(width: 8), //
              Expanded(
                  child: Center(
                child: TextFormField(
                  controller: amountController,
                  expands: false,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    hintText: "Enter amount",
                    hintStyle: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFFFC2D2D),
                    ),
                  ),
                ),
              )),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SvgIcon(
                icon: SvgIconsSource.expenseSvg,
                height: 32,
                color: Color(0xFFFC2D2D),
              ),
              const SizedBox(width: 8), //
              Expanded(
                  child: Center(
                child: TextFormField(
                  controller: monthController,
                  onTap: () async {
                    final DateTime firstDayOfCurrentMonth =
                        DateTime(DateTime.now().year, DateTime.now().month, 1);
                    final DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: firstDayOfCurrentMonth,
                      firstDate: DateTime(DateTime.now().year - 1),
                      lastDate: DateTime(DateTime.now().year + 1),
                      initialDatePickerMode: DatePickerMode.year,
                      selectableDayPredicate: (DateTime date) {
                        // Return true to enable selection of the date
                        // In this case, we're allowing only the selection of the first day of each month
                        return date.day == 1;
                      },
                    );

                    // Update the controller text with the selected month
                    if (pickedDate != null) {
                      monthController.text =
                          "${pickedDate.year}-${pickedDate.month.toString().padLeft(2, '0')}";
                    }
                  },
                  expands: false,
                  readOnly: true,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    hintText: "Enter month",
                    hintStyle: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFFFC2D2D),
                    ),
                  ),
                ),
              )),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SvgIcon(
                icon: SvgIconsSource.expenseSvg,
                height: 32,
                color: Color(0xFFFC2D2D),
              ),
              const SizedBox(width: 8), //
              Expanded(
                  child: Center(
                child: TextFormField(
                  controller: noteController,
                  expands: false,
                  
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    hintText: "Enter Note  (Optional)",
                    hintStyle: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFFFC2D2D),
                    ),
                  ),
                ),
              )),
            ],
          ),
          const Spacer(),
          Consumer(builder: (context, WidgetRef ref, child) {
            return ElevatedButton(
                onPressed: () {
                  ref.read(incomeExpenseProvider).addIncomeExpense(
                      category: categoryController.text,
                      date: monthController.text,
                      description: noteController.text,
                      type: "expense",
                      amount: double.parse(amountController.text));
                },
                child: const Text("Add Expense"));
          })
        ],
      ),
    )));
  }
}
