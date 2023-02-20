import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_recipe/bloc/food_bloc/get_foods_bloc.dart';
import 'package:food_recipe/data/repositories/food_repository.dart';
import 'package:food_recipe/services/api_service/api_service.dart';
import 'package:food_recipe/ui/select_page/select_page.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => FoodRepository(
            apiService: ApiService(),
          ),
        )
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => GetFoodsBloc(
              foodRepository: context.read<FoodRepository>(),
            ),
          ),
        ],
        child: const MyApp(),
      ),
    );
  }
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
        primarySwatch: Colors.blue,
      ),
      home: SelectPage(),
    );
  }
}
