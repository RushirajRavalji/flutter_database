import 'package:cloud_firestore/cloud_firestore.dart';
import 'employee_model.dart';

class EmployeeController {
  final CollectionReference _employeeCollection = FirebaseFirestore.instance
      .collection('Employees');

  Future<void> addEmployee(Employee employee) async {
    try {
      final docRef = _employeeCollection.doc();
      final String generatedId = docRef.id;

      final newEmployee = Employee(
        id: generatedId,
        name: employee.name,
        salary: employee.salary,
        age: employee.age,
      );
      await docRef.set(newEmployee.toJson());
    } catch (e) {
      print("Error adding employee: $e");
    }
  }
}
