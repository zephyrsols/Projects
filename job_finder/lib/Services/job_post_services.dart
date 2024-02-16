import '../Repository/repository.dart';

class JobPostService {
  Repository? _repository;

  JobPostService() {
    _repository = Repository();
  }

  allJobPost() async {
    return await _repository?.httpGet('jobs');
  }
  jobPostByType(jobTypeId) async {
    return await _repository?.httpGetById('jobs-by-type', jobTypeId);
  }

  jobPostByQualification(qualificationId) async {
    return await _repository?.httpGetById('jobs-by-qualification', qualificationId);
  }
}