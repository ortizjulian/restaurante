import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../widgets/wcWidgets.dart';

class menu extends StatelessWidget {
  menu({Key? key}) : super(key: key);
  double screenHeight = 0.0;
  double screenWidth = 0.0;
  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: appBar("Info", context),
      backgroundColor: const Color(0xFFF2E8DF),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              titleText("Menú"),
              filaProducto("assets/picada.png", "Picada", "45.000"),
              filaProducto("assets/menu.png", "Menú", "15.000"),
              filaProducto("assets/cazuela.png", "Cazuela", "16.000"),
              filaProducto("assets/solomo.png", "Solomo", "22.000"),
              filaProducto("assets/pescado.png", "Pescado", "20.000"),
              titleText("Ubicaciones"),
              filaProducto("assets/laureles.png", "Laureles", "Cra 12 # 60-40"),
              filaProducto("assets/poblado.png", "Poblado", "Cra 40 # 81-10"),
              filaProducto("assets/robledo.png", "Robledo", "Cra 22 # 10-90"),
            ],
          ),
        ),
      ),
    );
  }
}
