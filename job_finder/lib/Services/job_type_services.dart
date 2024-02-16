import '../Repository/repository.dart';

class JobTypeService {
  Repository? _repository;

  JobTypeService() {
    _repository = Repository();
  }

  allJobType() async {
    return await _repository?.httpGet('job-types');
  }

  getJobsByType(jobTypeId) async {
    return await _repository?.httpGetById('jobs-by-type', jobTypeId);
  }
}