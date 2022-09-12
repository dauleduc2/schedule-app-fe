import 'package:flutter/material.dart'
    show
        AppBar,
        BuildContext,
        Colors,
        MaterialApp,
        Scaffold,
        StatelessWidget,
        Text,
        ThemeData,
        Widget,
        ElevatedButton,
        Navigator,
        runApp;
import 'package:provider/provider.dart'
    show ChangeNotifierProvider, MultiProvider, Consumer;
import 'package:schedule_app_fe/core/providers/user.provider.dart'
    show UserProvider;
import 'package:schedule_app_fe/widgets/drawer/index.dart' show CDrawer;

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [ChangeNotifierProvider(create: (ctx) => UserProvider())],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: Consumer<UserProvider>(
            builder: (context, value, child) => Scaffold(
                appBar: AppBar(
                    title: const Text('Schedule App'), actions: const []),
                drawer: const CDrawer(),
                body: value.isLogin
                    ? ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/test');
                        },
                        child: Text('Logged'))
                    : const Text('Not login yet')),
          ),
          routes: {
            '/test': (context) => const Text('route /'),
            '/login': (context) => const Text('route /login')
          },
        ));
  }
}
