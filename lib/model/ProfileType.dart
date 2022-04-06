/// id : 1
/// profile_name : "Patient"
/// image : "Patient.png"
/// created_at : null
/// updated_at : null

class ProfileType {
  ProfileType({
      int? id, 
      String? profileName, 
      String? image, 
      dynamic createdAt, 
      dynamic updatedAt,}){
    _id = id;
    _profileName = profileName;
    _image = image;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  ProfileType.fromJson(dynamic json) {
    _id = json['id'];
    _profileName = json['profile_name'];
    _image = json['image'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  int? _id;
  String? _profileName;
  String? _image;
  dynamic _createdAt;
  dynamic _updatedAt;
ProfileType copyWith({  int? id,
  String? profileName,
  String? image,
  dynamic createdAt,
  dynamic updatedAt,
}) => ProfileType(  id: id ?? _id,
  profileName: profileName ?? _profileName,
  image: image ?? _image,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
);
  int? get id => _id;
  String? get profileName => _profileName;
  String? get image => _image;
  dynamic get createdAt => _createdAt;
  dynamic get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['profile_name'] = _profileName;
    map['image'] = _image;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}