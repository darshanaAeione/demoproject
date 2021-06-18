import 'package:demo_project/data/employee.dart';
import 'package:equatable/equatable.dart';

enum EmployeeEvents {
  fetchEmployees,
}

abstract class EmployeeState extends Equatable {
  @override
  List<Object> get props => [];
}
class EmployeeInitState extends EmployeeState {}
class EmployeeLoading extends EmployeeState {}
class EmployeeLoaded extends EmployeeState {
  final List<Employee>employees;
  EmployeeLoaded({ required this.employees});
}
class EmployeeListError extends EmployeeState {
  final error;
  EmployeeListError({this.error});
}