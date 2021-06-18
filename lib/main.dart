import 'package:demo_project/prestentation/employee_bloc.dart';
import 'package:demo_project/prestentation/employee_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'data/employee_repository_impl.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: BlocProvider(
        create: (context) => EmployeeBloc(employeeRepositoryImpl: EmployeeRepositoryImpl()),
        child: EmployeeScreen(),
      ),
    );
  }
}