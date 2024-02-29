import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myapp/firebase_options.dart';
import 'package:myapp/utils/Themes/themes.dart';
import 'package:myapp/utils/constants/constants.dart';
import 'package:myapp/view/add_imcome_expense/add_income_exp.dart';
import 'package:myapp/view/add_imcome_expense/view/expense/expense.dart';
import 'package:myapp/view/add_imcome_expense/view/income/income.dart';
import 'package:myapp/view/bottom_nav_page/bottom_nav_page.dart';
import 'package:myapp/view/authentication/login_page/login_page.dart';
import 'package:myapp/view/my_spendings_page/my_spendings.dart';
import 'package:myapp/view/authentication/signup_page/sign_up.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.themeData(context),
      routes: {
        Routes.bottomNavPage: (context) => const BottomNavPage(),
        Routes.myspendings: (context) => const MySpendings(),
        Routes.login: (context) => const LoginPage(),
        Routes.signUp: (context) => const SignUp(),
        Routes.addIncomeExpense: (context) => const AddIncomeExpence(),
        Routes.addIncome: (context) => const IncomePage(),
        Routes.addExpense: (context) => const Expense(),
      },
      initialRoute: FirebaseAuth.instance.currentUser == null
          ? Routes.login
          : Routes.bottomNavPage,
    );
  }
}
