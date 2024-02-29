import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myapp/utils/constants/constants.dart';
import 'package:myapp/utils/extensions/build_context_extension.dart';
import 'package:myapp/view/authentication/providers/auth_provider.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(authPorvider);

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const Text("Profile"),
            const Spacer(),
            InkWell(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text("Logout"),
                        content: const Text("Are you sure you want to logout?"),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text("No"),
                          ),
                          TextButton(
                            onPressed: () {
                               provider.fauth.signOutUser().then((value) {
                 context.navigatorPushReplacementNamed(Routes.login);
                });
                              Navigator.pushNamedAndRemoveUntil(
                                  context, Routes.login, (route) => false);
                            },
                            child: const Text("Yes"),
                          ),
                        ],
                      );
                    });
               
              },
              child: const Row(
                children: [
                  Text(
                    "Logout",
                    style: TextStyle(color: Colors.red, fontSize: 16),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.logout,
                    size: 16,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: const Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
              child: CircleAvatar(
            radius: 80,
          )),
          SizedBox(
            height: 20,
          ),
          Text(
            "Ritesh Jung Lama",
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ],
      ),
    );
  }
}
