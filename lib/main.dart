import 'package:blocs_one/logic/cubit/internet_cubit.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:blocs_one/logic/cubit/counter_cubit.dart';
import 'package:blocs_one/presentation/router/app_router.dart';

void main() {

  runApp(MyApp(
    appRouter: AppRouter(),
    connectivity: Connectivity(),
  ));
  final a = EquatableTestNoEqual(value: 1);
  final b = EquatableTestNoEqual(value: 2);
  print('a == b ' + (a == b).toString());
  print('a == a ' + (a == a).toString());
  print('b == b ' + (b == b).toString());
  final c = EquatableTest(value: 1);
  final d = EquatableTest(value: 2);
  print('c == d ' + (c == d).toString());
  print('c == c ' + (c == c).toString());
  print('d == d ' + (d == d).toString());
}

class EquatableTestNoEqual {
  final int value;

  EquatableTestNoEqual({required this.value});
}

class EquatableTest {
  final int value;

  EquatableTest({required this.value});

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    return o is EquatableTest && o.value == value;
  }
}
class EquatablePackage extends Equatable{
  final int value;

  EquatablePackage({required this.value});

  @override
  List<Object> get props => [value];
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter;
  final Connectivity connectivity;

  const MyApp({
    Key? key,
    required this.appRouter,
    required this.connectivity,
  }) : super(key: key);

  @override
  Widget build(BuildContext myAppContext) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<InternetCubit>(
          create: (internetCubitContext) => InternetCubit(connectivity: connectivity),
        ),
        BlocProvider<CounterCubit>(
          create: (counterCubitContext) => CounterCubit(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        onGenerateRoute: appRouter.onGenerateRoute,
      ),
    );
  }
}
