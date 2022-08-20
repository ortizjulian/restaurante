import 'package:flutter/material.dart';
import 'package:flutter_application_1/vistas/domicilio.dart';
import 'package:flutter_application_1/vistas/reservarMesa.dart';
import '../widgets/wcWidgets.dart';
import 'menu.dart';
import 'signUpPage.dart';

class opcionesCliente extends StatelessWidget {
  opcionesCliente({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2E8DF),
      appBar: appBar("Clientes", context),
      body: Center(
        child: Container(
          child: Column(
            children: [
              Spacer(),
              imagenRedonda("assets/cliente.png", 260),
              Spacer(),
              subTitleText("Bienvenid@ de nuevo cliente, seleccione lo que desea hacer"),
              Spacer(),
              largeButton(
              () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return reservarMesa();
                      },
                    )
                 );
              }, 
              Colors.transparent,
              "Reservar",
              180
            ),
              largeButton(
              (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return domicilio();
                      },
                    )
                 );
              },
              Color(0xFFF2D06B),
              "Domicilio",
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
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}