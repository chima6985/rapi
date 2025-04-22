class CreateUser {
    final String name;
    final String job;
    final String id;
    final DateTime createdAt;

    CreateUser({
        required this.name,
        required this.job,
        required this.id,
        required this.createdAt,
    });

    factory CreateUser.fromJson(Map<String, dynamic> json) => CreateUser(
        name: json["name"],
        job: json["job"],
        id: json["id"],
        createdAt: DateTime.parse(json["createdAt"]),
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "job": job,
        "id": id,
        "createdAt": createdAt.toIso8601String(),
    };
}