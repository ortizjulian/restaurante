import 'package:flutter/material.dart';
import 'package:flutter_application_1/vistas/opcionesCliente.dart';
import 'package:flutter_application_1/vistas/signUpPage.dart';
import 'package:flutter_application_1/widgets/wcWidgets.dart';

import 'menu.dart';

class WelcomePage extends StatelessWidget {
  WelcomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2E8DF),
      body: Center(
        child: Column(
          children: [
            Spacer(flex: 1),
            titleText("Restaurante Delicias"),
            Spacer(flex: 1),
            subTitleText("Bienvenid@, seleccione una opción"),
            Image(image: AssetImage("assets/homeimage.png"), width: 180,),
            campoTexto("Documento"),
            campoContrasena(),
            Spacer(),
            largeButton(
              () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return opcionesCliente();
                      },
                    )
                 );
              }, 
              Colors.transparent,
              "Iniciar sesión",
              180
            ),
            largeButton(
              (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return signUpPage();
                      },
                    )
                 );
              },
              Color(0xFFF2D06B),
              "Registrarme",
              180
              ),
            largeButton(
              (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return menu();
                      },
                    )
                 ); 
              },
              Colors.lightBlue,
              "Solo ver menu",
              180
            ),
            Spacer(flex: 1),
          ],
        ),
      ),
    );
  }
}