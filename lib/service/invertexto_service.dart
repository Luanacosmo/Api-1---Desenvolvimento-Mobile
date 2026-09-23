import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';

class InvertextoService {
  final String _token =
      "28435|7yv9ROJa3NZeUKxCR8AkrBmswDroP0jE";
  Future<Map<String, dynamic>> convertePorExtenso(String? valor) async {
    try {
      final uri = Uri.parse(
        "https://api.invertexto.com/v1/number-to-words"
        "?token=$_token&number=$valor"
        "&language=pt",
      );
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception('Erro ${response.statusCode}: ${response.body}');
      }
    } on SocketException {
      throw Exception('Erro de conexão com a internet');
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> BuscaCep(String? valor) async {
    try {
      final uri = Uri.parse(
        "https://api.invertexto.com/v1/cep/$valor"
        "?token=$_token",
      );
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception('Erro ${response.statusCode}: ${response.body}');
      }
    } on SocketException {
      throw Exception('Erro de conexão com a internet');
    } catch (e) {
      rethrow;
    }
  }
  
  Future<Map<String, dynamic>> buscaCnpj(String? valor) async {
    try {
      final uri = Uri.parse(
        "https://api.invertexto.com/v1/cnpj/$valor"
        "?token=$_token",
      );
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception('Erro ${response.statusCode}: ${response.body}');
      }
    } on SocketException {
      throw Exception('Erro de conexão com a internet');
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> validaEmail(String? valor) async {
    try {
      final uri = Uri.parse(
        "https://api.invertexto.com/v1/email-validator/$valor"
        "?token=$_token",
      );
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception('Erro ${response.statusCode}: ${response.body}');
      }
    } on SocketException {
      throw Exception('Erro de conexão com a internet');
    } catch (e) {
      rethrow;
    }
  }

    Future<List<dynamic>> buscaHolidays(String? valor) async {
    try {
      final uri = Uri.parse(
        "https://api.invertexto.com/v1/holidays/$valor"
        "?token=$_token",
      );
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception('Erro ${response.statusCode}: ${response.body}');
      }
    } on SocketException {
      throw Exception('Erro de conexão com a internet');
    } catch (e) {
      rethrow;
    }
  }
}



