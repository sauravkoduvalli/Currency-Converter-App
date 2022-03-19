
class DataSubmitter {
  final String name, email;

  DataSubmitter({
    required this.name,
    required this.email,
  });

  factory DataSubmitter.fromJson(Map<String, dynamic> json) {
    return DataSubmitter(
      name: json['name'],
      email: json['email'],
    );
  }
}
