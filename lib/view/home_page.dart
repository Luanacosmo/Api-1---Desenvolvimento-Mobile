import 'package:flutter/material.dart';
import 'package:invertexto/view/cnpj_page.dart';
import 'busca_cep_page.dart';
import 'por_extenso_page.dart';
import 'cnpj_page.dart';
import 'valida_email_page.dart';
import 'busca_holidays_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/imgs/logo.jpeg',
              fit: BoxFit.contain,
              height: 40,
            ),
          ],
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.black,
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: [
            GestureDetector(
              child: Row(
                children: [
                  Icon(Icons.edit, color: Colors.white, size: 50.0),
                  SizedBox(width: 30),
                  Text(
                    "Por Extenso",
                    style: TextStyle(color: Colors.white, fontSize: 20.0),
                  ),
                ],
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PorExtenso()),
                );
              },
            ),

            GestureDetector(
              child: Row(
                children: [
                  Icon(Icons.edit, color: Colors.white, size: 50.0),
                  SizedBox(width: 30),
                  Text(
                    "Busca CEP",
                    style: TextStyle(color: Colors.white, fontSize: 20.0),
                  ),
                ],
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BuscaCep()),
                );
              },
            ),

            GestureDetector(
              child: Row(
                children: [
                  Icon(Icons.edit, color: Colors.white, size: 50.0),
                  SizedBox(width: 30),
                  Text(
                    "Busca CNPJ",
                    style: TextStyle(color: Colors.white, fontSize: 20.0),
                  ),
                ],
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BuscaCnpj()),
                );
              },
            ),

            GestureDetector(
              child: Row(
                children: [
                  Icon(Icons.edit, color: Colors.white, size: 50.0),
                  SizedBox(width: 30),
                  Text(
                    "Validar E-mail",
                    style: TextStyle(color: Colors.white, fontSize: 20.0),
                  ),
                ],
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ValidaEmail()),
                );
              },
            ),

            GestureDetector(
              child: Row(
                children: [
                  Icon(Icons.edit, color: Colors.white, size: 50.0),
                  SizedBox(width: 30),
                  Text(
                    "Feriados",
                    style: TextStyle(color: Colors.white, fontSize: 20.0),
                  ),
                ],
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BuscaHolidays()),
                );
              },
            ),

          ],
        ),
      ),
    );
  }
}
