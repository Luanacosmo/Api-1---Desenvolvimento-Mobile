import 'package:flutter/material.dart';
import 'package:invertexto/service/invertexto_service.dart';

class BuscaHolidays extends StatefulWidget {
  const BuscaHolidays({super.key});
  @override
  State<BuscaHolidays> createState() => _BuscaHolidays();
}

class _BuscaHolidays extends State<BuscaHolidays> {
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
                labelText: "Digite o ano (ex: 2026)",
                labelStyle: TextStyle(color: Colors.white),
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              maxLength: 4,
              style: TextStyle(color: Colors.white, fontSize: 18),
              onSubmitted: (value) {
                setState(() {
                  campo = value;
                });
              },
            ),

            if (campo != null)
              Expanded(
                child: FutureBuilder<List<dynamic>>(
                  future: apiService.buscaHolidays(campo),
                  builder: (context, snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.waiting:
                      case ConnectionState.none:
                        return Center(
                          child: CircularProgressIndicator(
                            valueColor:
                                AlwaysStoppedAnimation<Color>(Colors.white),
                            strokeWidth: 5.0,
                          ),
                        );
                      default:
                        if (snapshot.hasError)
                          return Center(
                            child: Text(
                              'Erro ao buscar os feriados.',
                              style: TextStyle(color: Colors.white),
                            ),
                          );
                        else
                          return exibeResultado(context, snapshot);
                    }
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget exibeResultado(BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
    if (snapshot.data == null || snapshot.data!.isEmpty) {
      return Center(
        child: Text(
          'Nenhum feriado encontrado.',
          style: TextStyle(color: Colors.white),
        ),
      );
    }

    final feriados = snapshot.data!;
    return ListView.builder(
      itemCount: feriados.length,
      itemBuilder: (context, index) {
        final feriado = feriados[index];
        final tipo = feriado["type"] == "facultativo" ? "Ponto facultativo" : "Feriado";
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            "${feriado["date"] ?? "Data não disponível"} - "
            "${feriado["name"] ?? "Nome não disponível"}\n"
            "$tipo (${feriado["level"] ?? "nível não disponível"})",
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        );
      },
    );
  }

}