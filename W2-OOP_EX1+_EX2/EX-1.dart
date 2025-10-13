enum Skill { FLUTTER, DART, OTHER }

class Address {
  final String street;
  final String city;
  final String zipCode;

  const Address(this.street, this.city, this.zipCode);
}

class Employee {
  final String _name;
  final double _baseSalary;
  final List<Skill> _skills;
  final Address _address;
  final int _yearsOfExperience;

  Employee(
    this._name,
    this._baseSalary,
    this._skills,
    this._address,
    this._yearsOfExperience,
  );

  // Named construtor for mobileDeveloper
  Employee.mobileDeveloper(
    String name,
    double baseSalary,
    Address address,
    int yearsOfExperience,
  ) : _name = name,
      _baseSalary = baseSalary,
      _skills = [Skill.FLUTTER, Skill.DART],
      _address = address,
      _yearsOfExperience = yearsOfExperience;

  //Getter of the private attributes in class Employee
  String get name => _name;
  double get baseSalary => _baseSalary;
  List<Skill> get skills => List.unmodifiable(_skills);
  Address get address => _address;
  int get yearOfExperience => _yearsOfExperience;

  double computeSalary() {
    double salary = _baseSalary + (_yearsOfExperience * 2000);
    for (var skill in _skills) {
      switch (skill) {
        case Skill.FLUTTER:
          salary += 5000;
          break;
        case Skill.DART:
          salary += 3000;
          break;
        case Skill.OTHER:
          salary += 1000;
          break;
      }
    }
    return salary;
  }

  void printDetails() {
    print('Employee: $_name, Base Salary: \$${_baseSalary}');
    print('Skills: ${_skills.map((emp) => emp.name).join(", ")}');
    print('Year of Experience: $_yearsOfExperience');
    print('Address: ${_address.street}, ${_address.city}, ${_address.zipCode}');
    print('Salary: ${computeSalary()}');
  }
}

void main() {
  var emp1 = Employee(
    'Sokea',
    40000,
    [Skill.FLUTTER, Skill.DART],
    Address("33", "Phnom Penh", "3567"),
    4,
  );
  emp1.printDetails();

  var emp2 = Employee(
    'Ronan',
    45000,
    [Skill.FLUTTER],
    Address("22", "Phnom Penh", "1235"),
    4,
  );
  emp2.printDetails();
}
