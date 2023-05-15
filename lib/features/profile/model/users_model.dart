class UserProfileModel {
  final String uid;
  final String imageUrl;
  final String name;
  final bool hasAvatar;

  UserProfileModel({
    required this.uid,
    required this.imageUrl,
    required this.name,
    required this.hasAvatar,
  });

  UserProfileModel.empty()
      : uid = "",
        imageUrl = "",
        name = "",
        hasAvatar = false;

  UserProfileModel.fromJson(Map<String, dynamic> json)
      : uid = json["uid"],
        imageUrl = json["imageUrl"],
        name = json["name"],
        hasAvatar = json["hasAvatar"] ?? false;

  Map<String, String> toJson() {
    return {
      "uid": uid,
      "imageUrl": imageUrl,
      "name": name,
    };
  }

  UserProfileModel copyWith({
    String? uid,
    String? imageUrl,
    String? name,
    bool? hasAvatar,
  }) {
    return UserProfileModel(
      uid: uid ?? this.uid,
      imageUrl: imageUrl ?? this.imageUrl,
      name: name ?? this.name,
      hasAvatar: hasAvatar ?? this.hasAvatar,
    );
  }
}
