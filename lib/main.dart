import 'package:country_api/screens/country_list.dart';
import 'package:country_api/view_models/country_view_model.dart';
import 'package:dio/dio.dart';
import 'package:provider/provider.dart';
import 'package:country_api/services/api_service.dart';
import 'package:flutter/material.dart';

void main() {
  final apiService = ApiService(Dio());
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) =>
              CountryViewModel(apiService: apiService)..fetchCountries(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const CountryListView(),
    );
  }
}
