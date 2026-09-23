import 'package:flutter/material.dart';
import 'package:invertexto/service/invertexto_service.dart';

class BuscaCnpj extends StatefulWidget {
  const BuscaCnpj({super.key});
  @override
  State<BuscaCnpj> createState() => _BuscaCnpj();
}

class _BuscaCnpj extends State<BuscaCnpj> {
  String? campo;
  final apiService = InvertextoService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: "Digite o CNPJ",
                labelStyle: TextStyle(color: Colors.white),
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              maxLength: 14,
              style: TextStyle(color: Colors.white, fontSize: 18),
              onSubmitted: (value) {
                setState(() {
                  campo = value.replaceAll(RegExp(r'[^0-9]'), '');
                });
              },
            ),

            if (campo != null)
              FutureBuilder(
                future: apiService.buscaCnpj(campo!),
                builder: (context, snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.waiting:
                    case ConnectionState.none:
                      return CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                        strokeWidth: 5.0,
                      );
                    default:
                      if (snapshot.hasError)
                        return Center(
                          child: Text(
                            'Erro ao buscar os dados. Verifique o CNPJ informado.',
                            style: TextStyle(color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                        );
                      else
                        return exibeResultado(context, snapshot);
                  }
                },
              ),
          ],
        ),
      ),
    );
  }

  Widget exibeResultado(BuildContext context, AsyncSnapshot snapshot) {
    if (snapshot.data == null) {
      return Container();
    }

    final data = snapshot.data;
    String enderecoCompleto = '';
    enderecoCompleto += "Razão Social: ${data["razao_social"] ?? "Não disponível"}\n";
    enderecoCompleto += "Nome Fantasia: ${data["nome_fantasia"] ?? "Não disponível"}\n";
    enderecoCompleto += "Situação: ${data["situacao"] ?? "Não disponível"}\n";
    enderecoCompleto += "Logradouro: ${data["logradouro"] ?? "Não disponível"}\n";
    enderecoCompleto += "Bairro: ${data["bairro"] ?? "Não disponível"}\n";
    enderecoCompleto += "Município: ${data["municipio"] ?? "Não disponível"}\n";
    enderecoCompleto += "UF: ${data["uf"] ?? "Não disponível"}";

    return Padding(
      padding: EdgeInsets.only(top: 10.0),
      child: Text(
        enderecoCompleto,
        style: TextStyle(color: Colors.white, fontSize: 18),
        softWrap: true,
      ),
    );
  }
}