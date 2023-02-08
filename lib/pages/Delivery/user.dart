class User {
  String? firstName;
  String? lastname;

  User({this.firstName, this.lastname});

  static List<User> getUsers() {
    return <User>[
      User(firstName: "Ben", lastname: "Johnson"),
      User(firstName: "Raj", lastname: "Kurian"),
      User(firstName: "Philip", lastname: "Varghese"),
    ];
  }
}
