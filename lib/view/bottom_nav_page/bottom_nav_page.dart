import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myapp/utils/constants/constants.dart';
import 'package:myapp/utils/extensions/build_context_extension.dart';
import 'package:myapp/view/bottom_nav_page/pages/home_page.dart';
import 'package:myapp/view/bottom_nav_page/pages/provider/nav_provider.dart';
import 'package:myapp/view/profile_page/profile_page.dart';

class BottomNavPage extends ConsumerWidget {
  const BottomNavPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Widget> pages = [
      const HomePage(),
      Container(),
      Container(),
      const ProfilePage()
    ];
    final state = ref.watch(navProvider);

    return Scaffold(
        floatingActionButton: CircleAvatar(
          backgroundColor: Colors.blue, // Customize the background color
          radius: 30, // Set the radius to determine the size of the circle
          child: IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              context.navigatorPushNamed(Routes.addIncomeExpense);
            },
            color: Colors.white, // Customize the icon color
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: pages[state.currentIndex],
        bottomNavigationBar: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          notchMargin: 10,
          child: SizedBox(
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: [
                    MaterialButton(
                        minWidth: 40,
                        onPressed: () {
                          state.changeIndex(0);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.home,
                            color: state.getColor(0),
                          ),
                        )),
                    MaterialButton(
                        minWidth: 40,
                        onPressed: () {
                          state.changeIndex(1);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.wallet,
                            color: state.getColor(1),
                          ),
                        )),
                  ],
                ),
                Row(
                  children: [
                    MaterialButton(
                        minWidth: 40,
                        onPressed: () {
                          state.changeIndex(2);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.wallet_sharp,
                            color: state.getColor(2),
                          ),
                        )),
                    MaterialButton(
                        minWidth: 40,
                        onPressed: () {
                          state.changeIndex(3);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.person,
                            color: state.getColor(3),
                          ),
                        )),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
