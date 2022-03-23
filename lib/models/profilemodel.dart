class ProfileModel {
  ProfileModel({
    required this.id,
    required this.name,
    required this.about,
    required this.bio,
    required this.email,
    required this.mobileNo,
    required this.location,
    required this.pastCustomers,
    required this.upcomingCustomers,
    required this.review,
    required this.Avatar,
    required this.experience,
    required this.CVandCert,
    required this.createdAt,
    required this.V,
  });
  late final String id;
  late final String name;
  late final String about;
  late final String bio;
  late final String email;
  late final String mobileNo;
  late final List<dynamic> location;
  late final List<dynamic> pastCustomers;
  late final List<dynamic> upcomingCustomers;
  late final List<dynamic> review;
  late final String Avatar;
  late final List<Experience> experience;
  late final List<dynamic> CVandCert;
  late final String createdAt;
  late final int V;

  ProfileModel.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    name = json['name'];
    about = json['About'];
    bio = json['bio'];
    email = json['email'];
    mobileNo = json['mobileNo'];
    location = (json['location']);
    pastCustomers = (json['pastCustomers']);
    upcomingCustomers = (json['upcomingCustomers']);
    review = (json['review']);
    Avatar = json['Avatar'];
    experience = List.from(json['experience'])
        .map((e) => Experience.fromJson(e))
        .toList();
    CVandCert = (json['CVandCert']);
    createdAt = json['createdAt'];
    V = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id;
    _data['name'] = name;
    _data['email'] = email;
    _data['about'] = about;
    _data['bio'] = bio;
    _data['mobileNo'] = mobileNo;
    _data['location'] = location;
    _data['pastCustomers'] = pastCustomers;
    _data['upcomingCustomers'] = upcomingCustomers;
    _data['review'] = review;
    _data['Avatar'] = Avatar;
    _data['experience'] = experience.map((e) => e.toJson()).toList();
    _data['CVandCert'] = CVandCert;
    _data['createdAt'] = createdAt;
    _data['__v'] = V;
    return _data;
  }
}

class Experience {
  Experience({
    required this.title,
    required this.description,
  });
  late final String title;
  late final String description;

  Experience.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['title'] = title;
    _data['description'] = description;
    return _data;
  }
}
