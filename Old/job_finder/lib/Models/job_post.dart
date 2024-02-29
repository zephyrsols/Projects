class JobPost {
  int? id;
  String? companyName;
  String? companyLogo;
  String? companyLocation;
  String? jobTitle;
  int? categoryId;
  int? userId;
  String? lastDate;
  String? jobDescription;
  int? jobTypeId;
  String? jobType;
  String? position;
  int? positionId;
  String? salaryRange;
  int? qualificationId;
  String? requiredExp;
  String? documentation;
  String? created_at;

  toMap(){
    var map = Map<String, dynamic>();
    map['id'] = this.id;
    map['companyName'] = this.companyName;
    map['companyLogo'] = this.companyLogo;
    map['category_id'] = this.categoryId;
    map['companyLocation'] = this.companyLocation;
    map['jobTitle'] = this.jobTitle;
    map['lastDate'] = this.lastDate;
    map['jobDescription'] = this.jobDescription;
    map['job_type_id'] = this.jobTypeId;
    map['jobType'] = this.jobType;
    map['position_id'] = this.positionId;
    map['position'] = this.position;
    map['qualification_id'] = this.qualificationId;
    map['salaryRange'] = this.salaryRange;
    map['requiredExp'] = this.requiredExp;
    map['documentation'] = this.documentation;
    map['created_at'] = this.created_at;
    map['user_id'] = userId;
    return map;
  }

  toJson(){
    return {
    id = id,
    companyName = companyName,
    companyLogo = companyLogo,
    companyLocation = companyLocation,
    jobTitle = jobTitle,
    lastDate = lastDate,
    jobDescription = jobDescription,
    jobTypeId = jobTypeId,
    jobType = jobType,
    positionId = positionId,
    position = position,
    qualificationId = qualificationId,
    salaryRange = salaryRange,
    requiredExp = requiredExp,
    documentation = documentation,
    created_at = created_at,
    };
  }
}