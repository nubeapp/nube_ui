class User {
  String email;
  String username;
  String name;
  String? firstSurname;
  String? secondSurname;
  String countryName;
  String phone;
  String password;

  User({
    required this.email,
    required this.username,
    required this.name,
    this.firstSurname,
    this.secondSurname,
    required this.countryName,
    required this.phone,
    required this.password,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      email: json['email'] as String,
      username: json['username'] as String,
      name: json['name'] as String,
      firstSurname: json['firstSurname'] as String?,
      secondSurname: json['firstSurname'] as String?,
      countryName: json['countryName'] as String,
      phone: json['phone'] as String,
      password: json['password'] as String,
    );
  }

  Map<String, dynamic> toJson() => {
        'email': email,
        'username': username,
        'name': name,
        'firstSurname': firstSurname,
        'secondSurname': secondSurname,
        'countryName': countryName,
        'phone': phone,
        'password': password,
      };

  void setEmail(String email) {
    this.email = email;
  }

  void setUsername(String username) {
    this.username = username;
  }

  void setName(String name) {
    this.name = name;
  }

  void setFirstSurname(String? firstSurname) {
    this.firstSurname = firstSurname;
  }

  void setSecondSurname(String? secondSurname) {
    this.secondSurname = secondSurname;
  }

  void setCountryName(String countryName) {
    this.countryName = countryName;
  }

  void setPhone(String phone) {
    this.phone = phone;
  }

  void setPassword(String password) {
    this.password = password;
  }

  String getEmail() {
    return email;
  }

  String getUsername() {
    return username;
  }

  String getName() {
    return name;
  }

  String? getFirstSurname() {
    return firstSurname;
  }

  String? getSecondSurname() {
    return secondSurname;
  }

  String getCountryName() {
    return countryName;
  }

  String getPhone() {
    return phone;
  }

  String getPassword() {
    return password;
  }

  void saveUserData(String? email, String? username, String? name, String? fSurname, String? sSurname, String? countryName, String? phone, String? password) {
    setEmail(email ?? getEmail());
    setUsername(username ?? getUsername());
    setName(name ?? getName());
    setFirstSurname(fSurname ?? getFirstSurname());
    setSecondSurname(sSurname ?? getSecondSurname());
    setCountryName(countryName ?? getCountryName());
    setPhone(phone ?? getPhone());
    setPassword(password ?? getPassword());
  }
}
