import 'package:aims/core/common/cubits/app_user/app_user_cubit.dart';
import 'package:aims/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:aims/features/auth/presentation/pages/login_page.dart';
import 'package:aims/features/inventory/presentation/pages/view_inventory.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    super.initState();
    context.read<AuthBloc>().add(AuthIsUserLoggedIn());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AIMS',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: BlocSelector<AppUserCubit, AppUserState, bool>(
        selector: (state) {
          return state is AppUserLoggedIn;
        }, 
        builder: (context, isLoggedIn) {
          if(isLoggedIn) {
            return const ViewInventoryPage();
          }

          return const LoginPage();
        }
      ),
    );
  }
}