import '../Repository/repository.dart';

class QualificationService {
  Repository? _repository;

  QualificationService() {
    _repository = Repository();
  }

  allQualification() async {
    return await _repository?.httpGet('all-qualifications');
  }
}