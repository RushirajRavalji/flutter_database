class Employee {
  String? id;
  String? name;
  double? salary;
  int? age;

  Employee({this.id, this.name, this.salary, this.age});

  Employee.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    salary = json['Salary'];
    age = json['age'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['Salary'] = salary;
    data['age'] = age;
    return data;
  }
}
