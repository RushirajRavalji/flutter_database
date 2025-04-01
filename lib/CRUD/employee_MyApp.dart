import 'package:flutter/material.dart';
import 'package:flutter_firebase/CRUD/employee_form_view.dart';

class EmployeeMyapp extends StatelessWidget {
  const EmployeeMyapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: EmployeeFormView());
  }
}
