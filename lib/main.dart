import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:schedule_app_fe/core/injection/index.dart';
import 'package:schedule_app_fe/core/providers/api.provider.dart';
import 'package:schedule_app_fe/core/providers/user.provider.dart';
import 'package:schedule_app_fe/screens/money.dart';
import 'package:schedule_app_fe/screens/profile.dart';
import 'package:schedule_app_fe/screens/schedule.dart';
import 'package:schedule_app_fe/screens/setting.dart';
import 'package:schedule_app_fe/widgets/autoLogin/autoLogin.dart';
import 'package:schedule_app_fe/widgets/bottomNavigation/index.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  return runZonedGuarded(() async {
    runApp(const MyApp());
  }, (error, stack) {
    print(stack);
    print(error);
  });
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final ApiProvider _apiProvider = getIt<ApiProvider>();
  final UserProvider _userProvider = getIt<UserProvider>();

  int _currentIndex = 0;

  List<Widget> widgetList = <Widget>[
    const ScheduleScreen(),
    const MoneyScreen(),
    const ProfileScreen(),
    const SettingScreen(),
  ];

  void _onChangeTab(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => _userProvider),
        ChangeNotifierProvider(create: (ctx) => _apiProvider)
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
            primarySwatch: Colors.blue,
            backgroundColor: Colors.grey[200],
            primaryColorLight: Colors.blue,
            primaryColorDark: Colors.black54,
            textTheme: const TextTheme(
              labelSmall: TextStyle(fontSize: 8),
            )),
        home: Consumer<UserProvider>(
          builder: (context, value, child) => Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              title: const Text('Schedule App'),
            ),
            body: FractionallySizedBox(
              widthFactor: 1,
              heightFactor: 1,
              child: AutoLogin(children: widgetList[_currentIndex]),
            ),
            bottomNavigationBar: value.isLogin
                ? CBottomNavigationBar(
                    currentIndex: _currentIndex, onChangeTab: _onChangeTab)
                : null,
          ),
        ),
      ),
    );
  }
}
