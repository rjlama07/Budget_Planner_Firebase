import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:myapp/providers/all_income_exp_provider.dart';
import 'package:myapp/utils/constants/constants.dart';
import 'package:myapp/utils/extensions/build_context_extension.dart';
import 'package:myapp/utils/helper/helper_functions.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(userDataProvider);
    final availableBalance = state.totalIncome - state.totalExpense;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 21),
          child: LiquidPullToRefresh(
            onRefresh: () async {
              await ref.read(userDataProvider).fetchUserData(state.user!.uid);
            },
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const Row(
                    children: [
                      Icon(Icons.dashboard),
                      Spacer(),
                      Text(
                        "Dashboard",
                        style:
                            TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
                      ),
                      Spacer(),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    height: 175,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      color: const Color(0xFF2F2762),
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                            bottom: 0,
                            right: 0,
                            child: Image.asset(
                              "assets/card_background.png",
                              fit: BoxFit.fill,
                            )),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 21, vertical: 30),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              const Text(
                                "Available Balance",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                "\$${putCommaInNumber((availableBalance).toString())}",
                                style:  TextStyle(
                                  color:availableBalance>0? Colors.white:Colors.red,
                                  fontSize: 29,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const Spacer(),
                              InkWell(
                                onTap: () => context
                                    .navigatorPushNamed(Routes.myspendings),
                                child: const Text(
                                  "See details",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 21, vertical: 30),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      color: const Color(0xFF2F2762),
                    ),
                    child: Row(
                      children: [
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Budget for October",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Cash Available",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        Text(
                          "\$${putCommaInNumber("2478")}",
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 21,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 21, vertical: 30),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFF4a556812).withOpacity(0.07),
                          spreadRadius: 1,
                          blurRadius: 7,
                          offset:
                              const Offset(0, 3), // changes position of shadow
                        ),
                      ],
                      borderRadius: BorderRadius.circular(24),
                      color: Colors.white,
                    ),
                    child: Row(
                      children: [
                        const Expanded(
                          flex: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Create a Saving goal",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Lorem ipsum dolor sit amet, consectetur adipisci.",
                                style: TextStyle(
                                  color: Colors.black, // Change color to black
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Spacer(),
                        Container(
                          width: 50,
                          height: 50,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(
                              colors: [Color(0xFF8DA0F2), Color(0xFF4E61B6)],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                          ),
                          child: const CircleAvatar(
                            backgroundColor: Colors.transparent,
                            child:
                                Icon(Icons.person, size: 20, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 30),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                          color: const Color(0xFFDAF0F6),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 50,
                              height: 50,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                gradient: LinearGradient(
                                  colors: [Color(0xFF8DA0F2), Color(0xFF4E61B6)],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                ),
                              ),
                              child: const CircleAvatar(
                                backgroundColor: Colors.transparent,
                                child: Icon(Icons.person,
                                    size: 20, color: Colors.white),
                              ),
                            ),
                            const SizedBox(height: 50),
                            Text(
                              "\$${putCommaInNumber(state.totalIncome.toString())}",
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 21,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const Text(
                              "Income",
                              style: TextStyle(
                                color: Colors.black, // Change color to black
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      )),
                      const SizedBox(width: 20),
                      Expanded(
                          child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 30),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                          color: const Color(0xFFFCD2DF),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 50,
                              height: 50,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                gradient: LinearGradient(
                                  colors: [Color(0xFF8DA0F2), Color(0xFF4E61B6)],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                ),
                              ),
                              child: const CircleAvatar(
                                backgroundColor: Colors.transparent,
                                child: Icon(Icons.person,
                                    size: 20, color: Colors.white),
                              ),
                            ),
                            const SizedBox(height: 50),
                            Text(
                              "\$${putCommaInNumber(state.totalExpense.toString())}",
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 21,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const Text(
                              "Expense",
                              style: TextStyle(
                                color: Colors.black, // Change color to black
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      )),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
