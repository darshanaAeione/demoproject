import 'package:demo_project/data/employee.dart';
import 'package:flutter/material.dart';


class EmployeeListTitle extends StatelessWidget {

  final Employee employee ;
  EmployeeListTitle({required this.employee});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(employee.id),
      trailing: employee.completed == true ? Icon(Icons.lock_clock_outlined):Icon(Icons.check_circle),
      subtitle: Text(employee.title),
    );


  }
}