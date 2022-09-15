import 'package:flutter/material.dart'
    show
        AppBar,
        BuildContext,
        Colors,
        MaterialApp,
        Scaffold,
        Text,
        ThemeData,
        Widget,
        Icons,
        runApp;
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart'
    show ChangeNotifierProvider, MultiProvider, Consumer;
import 'package:schedule_app_fe/core/providers/user.provider.dart'
    show UserProvider;
import 'package:schedule_app_fe/screens/login.dart';
import 'package:schedule_app_fe/screens/money.dart';
import 'package:schedule_app_fe/screens/profile.dart';
import 'package:schedule_app_fe/screens/schedule.dart';
import 'package:schedule_app_fe/screens/setting.dart';
import 'package:schedule_app_fe/widgets/bottomNavigation/index.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
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
      providers: [ChangeNotifierProvider(create: (ctx) => UserProvider())],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          backgroundColor: Colors.grey[200],
          primaryColorLight: Colors.blue,
          primaryColorDark: Colors.black54,
        ),
        home: Consumer<UserProvider>(
          builder: (context, value, child) => Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              title: const Text('Schedule App'),
            ),
            body:
                value.isLogin ? widgetList[_currentIndex] : const LoginScreen(),
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
