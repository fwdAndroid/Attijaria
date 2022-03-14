import 'package:attijaria/Providers/allproviders.dart';
import 'package:attijaria/screens/introscreens/welcome.dart';
import 'package:attijaria/separaterpages/categoriesselector.dart';
import 'package:attijaria/separaterpages/imageselector.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AllpProviders()),

      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        home: Welcome(),
      ),
    );
  }
}
