class User {
  String login;
  String avatarUrl;
  String htmlUrl;

  User({
    required this.login,
    required this.avatarUrl,
    required this.htmlUrl,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        login: json["login"],
        avatarUrl: json["avatar_url"],
        htmlUrl: json["html_url"],
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['login'] = this.login;
    data['avatar_url'] = this.avatarUrl;
    data['html_url'] = this.htmlUrl;
    return data;
  }
}
