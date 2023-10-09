import 'package:myapp/Models/via_cep_model.dart';
import 'package:myapp/Repository/back4app/back4pp_custom_repository.dart';

class ViaCepBak4AppRepository {
  final _customDio = Back4AppCustomDio();

  ViaCepBak4AppRepository();

  Future<ViaCepAggregateModel> getTasks() async {
    var url = "/ViaCepChallengeGtretow";
    var result = await _customDio.dio.get(url);
    return ViaCepAggregateModel.fromJson(result.data);
  }

  Future<void> create(ViaCEPModel viaCepModel) async {
    try {
      await _customDio.dio
          .post("/ViaCepChallengeGtretow", data: viaCepModel.toJsonEndpoint());
    } catch (e) {
      rethrow;
    }
  }

  Future<void> update(ViaCEPModel viaCepModel) async {
    try {
      await _customDio.dio.put(
          "/ViaCepChallengeGtretow/${viaCepModel.objectId}",
          data: viaCepModel.toJsonEndpoint());
    } catch (e) {
      rethrow;
    }
  }

  Future<void> remove(String objectId) async {
    try {
      await _customDio.dio.delete(
        "/ViaCepChallengeGtretow/$objectId",
      );
    } catch (e) {
      rethrow;
    }
  }
}
