import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ma_gaman/models/count_bottom_navigation_bar_model.dart';
import 'package:ma_gaman/models/main_model.dart';
import 'package:ma_gaman/view/history.dart';
import 'package:ma_gaman/view/home.dart';
import 'package:ma_gaman/view/login_screen.dart';

import 'details/count_bottom_navigation_bar.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(child: MyApp()));
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GA-MAN Counter',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: LoginScreen(),
    );
  }
}

class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key, required this.title});


  final String title;


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final MainModel mainModel = ref.watch(mainProvider);
    final CountBottomNavigationBarModel countBottomNavigationBarModel = ref.watch(CountBottomNavigationBarProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: PageView(
        controller: countBottomNavigationBarModel.pageController,
        onPageChanged: (index) => countBottomNavigationBarModel.onPageChanged(index: index),
        children: [
          Home(),
          History()
        ],
          ),
      floatingActionButton: FloatingActionButton(
        onPressed: mainModel.incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.person),
      ),
      bottomNavigationBar: CountBottomNavigationBar(countBottomNavigationBarModel: countBottomNavigationBarModel,),
// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
