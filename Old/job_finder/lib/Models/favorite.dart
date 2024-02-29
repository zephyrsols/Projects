// ignore: non_constant_identifier_names
const String TABLE_FAVORITE = 'tbl_favorite';
// ignore: non_constant_identifier_names
final String COLUMN_ID = 'id';
// ignore: non_constant_identifier_names
final String COLUMN_JOB_POST_ID = 'jobPostId';
// ignore: non_constant_identifier_names
final String COLUMN_IS_FAVORITE = 'isFavorite';
// ignore: non_constant_identifier_names
final String COLUMN_JOB_TITLE = 'jobTitle';
final String COLUMN_JOB_TYPE = 'jobType';
// ignore: non_constant_identifier_names
final String COLUMN_JOB_DESCRIPTION = 'description';
// ignore: non_constant_identifier_names
final String COLUMN_COMPANY_NAME = 'companyName';
final String COLUMN_COMPANY_LOCATION = 'companyLocation';
final String COLUMN_COMPANY_LOGO = 'companyLogo';
// ignore: non_constant_identifier_names
final String COLUMN_SALARY_RANGE = 'salaryRange';
// ignore: non_constant_identifier_names
final String COLUMN_POSITION = 'position';
// ignore: non_constant_identifier_names
final String COLUMN_CATEGORY = 'categoryName';
// ignore: non_constant_identifier_names
final String COLUMN_DATE = 'created_at';

final String COLUMN_CAT_ID = 'category';
final String COLUMN_DOCUMENTATION = 'documentation';
// // ignore: non_constant_identifier_names
// final String COLUMN_INGREDIENTS = 'details';
// // ignore: non_constant_identifier_names
// final String COLUMN_DIRECTIONS = 'author';
// // ignore: non_constant_identifier_names
// final String COLUMN_COOKTIME = 'date';
// // ignore: non_constant_identifier_names
// final String COLUMN_IMAGE = 'image';
// // ignore: non_constant_identifier_names
// final String COLUMN_STORY_VIEWS = 'views';
// // ignore: non_constant_identifier_names
// final String COLUMN_CATEGORY = 'categoryName';

class Favorite {
  int? id;
  int? jobPostId;
  int? isFavorite;
  String? companyName;
  String? categoryName;
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
  String? date;

  Favorite(
      {this.id,
      this.jobPostId,
      this.jobTypeId,
      this.isFavorite,
      this.jobTitle,
      this.jobDescription,
      this.companyName,
      this.date,
      this.position,
      this.companyLogo,
      this.salaryRange,
      this.categoryName,
      this.companyLocation,
      this.documentation,
      this.jobType,
      this.lastDate});

  factory Favorite.fromJson(Map<String, dynamic> json) {
    return Favorite(
        id: json[COLUMN_ID],
        jobPostId: json[COLUMN_JOB_POST_ID],
        isFavorite: json[COLUMN_IS_FAVORITE],
        jobTitle: json[COLUMN_JOB_TITLE],
        jobDescription: json[COLUMN_JOB_DESCRIPTION],
        companyName: json[COLUMN_COMPANY_NAME],
        salaryRange: json[COLUMN_SALARY_RANGE],
        companyLogo: json[COLUMN_COMPANY_LOGO],
        position: json[COLUMN_POSITION],
        date: json[COLUMN_DATE],
        categoryName: json[COLUMN_CATEGORY],
        jobType: json[COLUMN_JOB_TYPE],
        companyLocation: json[COLUMN_COMPANY_LOCATION],
        documentation: json[COLUMN_DOCUMENTATION],
        lastDate: json[COLUMN_DATE]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data[COLUMN_ID] = id;
    data[COLUMN_JOB_POST_ID] = jobPostId;
    data[COLUMN_IS_FAVORITE] = isFavorite;
    data[COLUMN_JOB_TITLE] = jobTitle;
    data[COLUMN_JOB_DESCRIPTION] = jobDescription;
    data[COLUMN_COMPANY_NAME] = companyName;
    // data[COLUMN_DATE] = jobTitle;
    data[COLUMN_COMPANY_LOGO] = companyLogo;
    data[COLUMN_SALARY_RANGE] = salaryRange;
    data[COLUMN_CATEGORY] = categoryName;
    data[COLUMN_COMPANY_LOCATION] = companyLocation;
    data[COLUMN_POSITION] = position;
    data[COLUMN_DOCUMENTATION] = documentation;
    data[COLUMN_JOB_TYPE] = jobType;
    return data;
  }

  @override
  String toString() {
    return 'Favorite{id: $id, storyId: $jobPostId, isFavorite: $isFavorite, title: $jobTitle, details: $jobDescription, views: $salaryRange, author: $companyName, date: $date, image: $companyLogo, categoryName:$categoryName, companyLocation:$companyLocation, position:$position, documentation:$documentation, jobType:$jobType}';
  }
}
