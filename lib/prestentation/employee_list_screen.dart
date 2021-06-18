import 'package:demo_project/data/employee.dart';
import 'package:demo_project/data/use_cases.dart';
import 'package:demo_project/prestentation/employee_bloc.dart';
import 'package:demo_project/prestentation/list_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmployeeScreen extends StatefulWidget {
  @override
  _EmployeeScreenState createState() => _EmployeeScreenState();
}
class _EmployeeScreenState extends State<EmployeeScreen> {


  @override
  void initState() {
    super.initState();

    _loadEmployees();

  }
  _loadEmployees() async {
    final employeeBloc  = BlocProvider.of<EmployeeBloc>(context);
    employeeBloc.add(EmployeeEvents.fetchEmployees);

  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
      ),
      body: Container(
        child: _body(),
      ),
    );
  }
  _body() {
    return Column(
      children: [
        BlocBuilder<EmployeeBloc, EmployeeState>(
            builder: (BuildContext context, EmployeeState state) {
              if (state is EmployeeListError) {
                final error = state.error;
                return GestureDetector(
                  onTap: () {

                  },
                  child: Text(
                    '${error.message}'
                  ),
                );
              }
              if (state is EmployeeLoaded) {
                List<Employee> employees = state.employees;

                return _list(employees);
              }
              return Container();
            }),
      ],
    );
  }

  Widget _list(List<Employee> employees) {
    return Expanded(
      child: ListView.builder(
        itemCount: employees.length,
        itemBuilder: (_, index) {
          Employee employee = employees[index];
          return EmployeeListTitle(employee: employee);
        },
      ),
    );
  }
}
