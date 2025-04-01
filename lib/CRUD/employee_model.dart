class Employee {
  String? id;
  String? name;
  double? salary;
  int? age;

  Employee({this.id, this.name, this.salary, this.age});

  Employee.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    salary = (json['salary'] as num?)?.toDouble();
    age = json['age'];
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name, 'salary': salary, 'age': age};
  }
}
