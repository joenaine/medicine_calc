class Posts {
  final String name;
  final String rec;
  Posts({this.name, this.rec});

  factory Posts.formJson(Map<String, dynamic> json) {
    return new Posts(
      name: json['name'],
      rec: json['rec'],
    );
  }
}
