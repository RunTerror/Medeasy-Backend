class MyData {
  final int id;
  final String name;

  MyData({required this.id, required this.name});

  factory MyData.fromJson(Map<String, dynamic> json) {
    return MyData(
      id: json['id'],
      name: json['name'],
    );
  }
}
