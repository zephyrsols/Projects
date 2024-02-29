import '../Repository/repository.dart';

class CategoryService {
  Repository? _repository;

  CategoryService() {
    _repository = Repository();
  }

  allCategory() async {
    return await _repository?.httpGet('categories');
  }
}
