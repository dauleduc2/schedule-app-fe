import 'package:flutter/material.dart';
import 'package:provider/provider.dart' show Consumer;
import 'package:schedule_app_fe/core/constants/UI.dart';
import 'package:schedule_app_fe/core/providers/user.provider.dart';

class CDrawer extends StatelessWidget {
  const CDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(
      builder: (context, value, child) => Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
              ),
              child: const Text('Schedule App',
                  style: TextStyle(color: Colors.white, fontSize: 24)),
            ),
            ...(value.isLogin
                    ? drawer_user_selections
                    : drawer_guess_selections)
                .map((selection) {
              return ListTile(
                title: Text(selection['text']),
                leading: Icon(selection['icon']),
                onTap: () {},
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}
