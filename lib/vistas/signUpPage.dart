import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/vistas/opcionesCliente.dart';

import '../widgets/wcWidgets.dart';

class signUpPage extends StatelessWidget {
  signUpPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar("Registrarme", context),
      backgroundColor: const Color(0xFFF2E8DF),
      body: Center(
        child: Column(
          children: [
            Spacer(
              flex: 1,
            ),
            imagenRedonda("assets/registro.png",200),
            Spacer(
              flex: 1,
            ),
            subTitleText(
                "Crea una cuenta para acceder a diferentes funcionalidades"),
            campoTexto("Documento"),
            campoContrasena(),
            campoTexto("Dirección"),
            campoTexto("Nombre Completo"),
            Spacer(
              flex: 1,
            ),
            largeButton(() {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return opcionesCliente();
                },
              ));
            }, Colors.transparent, "Sign Up", 180),
            Spacer(
              flex: 1,
            ),
          ],
        ),
      ),
    );
  }
}
