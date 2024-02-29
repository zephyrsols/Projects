class JobApply {
  int? id;
  int? userId;
  int? categoryId;
  int? jobPostId;
  String? name;
  int? qualificationId;
  int? mobile;
  String? email;
  String? cv;

  toMap() {
    var map = Map<String, dynamic>();
    map['id'] = id;
    map['name'] = name;
    map['cv'] = cv;
    map['email'] = email;
    map['mobile'] = mobile;
    map['job_post_id'] = jobPostId;
    map['user_id'] = userId;
    map['qualification_id'] = qualificationId;
    map['category_id'] = categoryId;
    return map;
  }

  toJson() {
    return {
      'id': id.toString(),
      'name': name.toString(),
      'cv': cv,
      'email': email,
      'mobile': mobile,
      'job_post_id': jobPostId.toString(),
      'user_id': userId,
      'qualification_id': qualificationId.toString(),
      'category_id': categoryId
    };
  }
}
