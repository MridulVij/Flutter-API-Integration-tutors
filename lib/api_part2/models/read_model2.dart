class User {
  final String cell;
  final String email;
  final String gender;
  final name;

  User(
      {required this.cell,
      required this.email,
      required this.gender,
      required this.name});

  String get fullName {
    return '${name.title} ${name.first} ${name.last}';
  }
}

class UserName {
  final String title;
  final String first;
  final String last;
  UserName({required this.first, required this.title, required this.last});
}
