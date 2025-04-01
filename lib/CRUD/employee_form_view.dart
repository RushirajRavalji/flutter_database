import 'package:flutter/material.dart';
import 'package:flutter_firebase/CRUD/employee_controller.dart';
import 'package:flutter_firebase/CRUD/employee_model.dart';

class EmployeeFormView extends StatefulWidget {
  const EmployeeFormView({super.key});

  @override
  State<EmployeeFormView> createState() => _EmployeeFormViewState();
}

class _EmployeeFormViewState extends State<EmployeeFormView> {
  final _formKey = GlobalKey<FormState>();
  final EmployeeController _employeeController = EmployeeController();

  String? _name;
  double? _salary;
  int? _age;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add Employee Data")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Field required";
                  }
                  return null;
                },
                onSaved: (newValue) => _name = newValue,
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Salary'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Field required";
                  } else if (double.tryParse(value) == null) {
                    return "Enter valid input";
                  }
                  return null;
                },
                onSaved: (value) => _salary = double.tryParse(value!),
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Age'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Field required";
                  } else if (int.tryParse(value) == null) {
                    return "Enter valid input";
                  }
                  return null;
                },
                onSaved: (value) => _age = int.tryParse(value!),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    final newEmployee = Employee(
                      name: _name!,
                      salary: _salary!,
                      age: _age!,
                    );
                    _employeeController.addEmployee(newEmployee);
                    print("Employee is added");
                  }
                },
                child: const Text("Submit"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
