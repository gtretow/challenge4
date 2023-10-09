import 'package:dio/dio.dart';

class CepService {
  final Dio _dio = Dio();

  Future<Map<String, dynamic>> fetchCep(String cep) async {
    try {
      final response = await _dio.get('https://viacep.com.br/ws/$cep/json/');
      return response.data;
    } catch (e) {
      throw Exception('Erro ao consultar o CEP: $e');
    }
  }
}
