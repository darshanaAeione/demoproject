import 'package:demo_project/data/employee.dart';
import 'package:demo_project/domain/employee_repository.dart';

class EmployeeRepositoryImpl implements EmployeeRepository {
  @override
  List<Employee> getEmployees()  {
    return [
      Employee(id: "1", title: "delectus aut autem", completed: false),
      Employee(
          id: "2",
          title: "quis ut nam facilis et officia qui",
          completed: false),
      Employee(id: "3", title: "fugiat veniam minus", completed: false),
      Employee(id: "4", title: "et porro tempora", completed: true)
    ];
  }
}
