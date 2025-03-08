import 'package:aims/core/common/cubits/app_user/app_user_cubit.dart';
import 'features/auth/presentation/bloc/auth_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:aims/init_dependencies.dart';
import 'package:flutter/material.dart';
import 'package:aims/app.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencies();

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (_) => serviceLocator<AuthBloc>()
      ),
      BlocProvider(
        create: (_) => serviceLocator<AppUserCubit>(),
      ),
    ],
    child: const MyApp(),
  ));
}
