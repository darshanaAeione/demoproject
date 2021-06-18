import 'dart:io';
import 'package:demo_project/data/employee.dart';
import 'package:demo_project/data/employee_repository_impl.dart';
import 'package:demo_project/data/use_cases.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class EmployeeBloc extends Bloc<EmployeeEvents, EmployeeState> {

 final EmployeeRepositoryImpl employeeRepositoryImpl;


 EmployeeBloc({ required this.employeeRepositoryImpl}) : super(EmployeeInitState());


  @override
  Stream<EmployeeState> mapEventToState(EmployeeEvents event) async* {
    List<Employee> employees;
    switch (event) {
      case EmployeeEvents.fetchEmployees:
        try {

            employees =  employeeRepositoryImpl.getEmployees();

          yield EmployeeLoaded(employees: employees);
        }  catch (e) {
          yield EmployeeListError(
            error: 'No Data',
          );
        }break;
    }
  }
}