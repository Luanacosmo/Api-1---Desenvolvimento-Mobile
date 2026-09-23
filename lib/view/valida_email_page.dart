import 'package:flutter/material.dart';
import 'package:invertexto/service/invertexto_service.dart';

class ValidaEmail extends StatefulWidget {
  const ValidaEmail({super.key});
  @override
  State<ValidaEmail> createState() => _ValidaEmail();
}

class _ValidaEmail extends State<ValidaEmail> {
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
                labelText: "Digite o e-mail",
                labelStyle: TextStyle(color: Colors.white),
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.emailAddress,
              style: TextStyle(color: Colors.white, fontSize: 18),
              onSubmitted: (value) {
                setState(() {
                  campo = value;
                });
              },
            ),

            if (campo != null)
              FutureBuilder(
                future: apiService.validaEmail(campo),
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
                            'Erro ao validar o e-mail.',
                            style: TextStyle(color: Colors.white),
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
    String resultado = '';
    resultado += "E-mail: ${data["email"] ?? "Não disponível"}\n";
    resultado += "Formato válido: ${data["valid_format"] == true ? "Sim" : "Não"}\n";
    resultado += "Domínio possui MX: ${data["valid_mx"] == true ? "Sim" : "Não"}\n";
    resultado += "É descartável (temporário): ${data["disposable"] == true ? "Sim" : "Não"}";

    return Padding(
      padding: EdgeInsets.only(top: 10.0),
      child: Text(
        resultado,
        style: TextStyle(color: Colors.white, fontSize: 18),
        softWrap: true,
      ),
    );
  }
}