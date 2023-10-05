import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:marketplacedb/screen/front_page.dart';
import 'package:marketplacedb/screen/signin_pages/navigation.dart';

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final storage = GetStorage();
    return MaterialApp(
      title: 'MarketPlace',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: storage.read('token') == null
          ? '/frontpage'
          : '/navigation', // Set initial route
      onGenerateRoute: (settings) {
        // Define routes using onGenerateRoute
        switch (settings.name) {
          case '/frontpage':
            return MaterialPageRoute(builder: (context) => const Frontpage());
          case '/navigation':
            return MaterialPageRoute(builder: (context) => const Navigation());
          default:
            return MaterialPageRoute(builder: (context) => const Frontpage());
        }
      },
    );
  }
}
