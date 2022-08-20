import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../widgets/wcWidgets.dart';

class domicilio extends StatefulWidget {
  const domicilio({Key? key}) : super(key: key);

  @override
  State<domicilio> createState() => _domicilioState();
}

class filaTabla {
  final String Col1;
  final String Col2;
  final String Col3;

  filaTabla(
    this.Col1,
    this.Col2,
    this.Col3,
  );
}

class Producto {
  String nombre = "";
  int cantidadProducto = 0;
  int valor = 0;

  Producto(this.nombre,this.cantidadProducto,this.valor);
  int precioTotal() => cantidadProducto*valor;
  void aumentar() => cantidadProducto ++;
  void decrementar() => cantidadProducto --;
}

class _domicilioState extends State<domicilio> {

  int total = 0;

  Producto Picada = Producto("Picada",0,45000);
  Producto Menu = Producto("Menu",0,15000);
  Producto Cazuela = Producto("Cazuela",0,16000);
  Producto Solomo = Producto("Solomo",0,22000);
  Producto Pescado = Producto("Pescado",0,14000);

  List<filaTabla> lista = [];

  Widget rowSpecial(Producto producto,String ruta) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        filaProducto(ruta, producto.nombre, '${producto.valor}'),
        SizedBox(
          width: 10,
        ),
        Column(
          children: [
            largeButton(
              () {
                setState(() {
                  producto.aumentar();
                  llenarTabla();
                });
              },
              Colors.white,
              "+",
              40,
            ),
            largeButton(
              () {
                setState(() {
                  if (producto.cantidadProducto == 0) return;
                  producto.decrementar();
                  llenarTabla();
                });
              },
              Colors.white,
              "-",
              40,
            ),
          ],
        ),
      ],
    );
  }

  void llenarTabla() {
    lista = [];
    if (Picada.cantidadProducto != 0) {
      lista.add(filaTabla(Picada.nombre, '${Picada.cantidadProducto * Picada.valor}', '${Picada.cantidadProducto}'));
    }
    if (Menu.cantidadProducto != 0) {
      lista.add(filaTabla(Menu.nombre, '${Menu.cantidadProducto * Menu.valor}', '${Menu.cantidadProducto}'));
    }
    if (Cazuela.cantidadProducto != 0) {
      lista.add(filaTabla(Cazuela.nombre, '${Cazuela.cantidadProducto * Cazuela.valor}', '${Cazuela.cantidadProducto}'));
    }
    if (Solomo.cantidadProducto != 0) {
      lista.add(filaTabla(Solomo.nombre, '${Solomo.cantidadProducto * Solomo.valor}', '${Solomo.cantidadProducto}'));
    }
    if (Pescado.cantidadProducto != 0) {
      lista.add(filaTabla(Pescado.nombre, '${Pescado.cantidadProducto * Pescado.valor}', '${Pescado.cantidadProducto}'));
    }
    total = (Picada.cantidadProducto * Picada.valor) +
        (Menu.cantidadProducto * Menu.valor) +
        (Cazuela.cantidadProducto * Cazuela.valor) +
        (Solomo.cantidadProducto * Solomo.valor) +
        (Pescado.cantidadProducto * Pescado.valor);
  }

  Text resumenCompra() {
    String texto = "";
    lista.forEach((listItem) {
      texto += listItem.Col1 +
          " " +
          "Cant: " +
          listItem.Col2 +
          " Precio: " +
          listItem.Col3 +
          "\n";
    });
    texto += "Total: ${total}";
    return Text(texto);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2E8DF),
      appBar: appBar("Domicilio", context),
      body: Center(
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                rowSpecial(Picada,"assets/picada.png"),
                rowSpecial(Menu,"assets/menu.png"),
                rowSpecial(Cazuela,"assets/cazuela.png"),
                rowSpecial(Solomo,"assets/solomo.png"),
                rowSpecial(Pescado,"assets/pescado.png"),
                DataTable(
                  columns: [
                    DataColumn(
                      label: Text("Nombre"),
                    ),
                    DataColumn(
                      label: Text("Cantidad*Precio"),
                    ),
                    DataColumn(
                      label: Text("Cantidad"),
                    ),
                  ],
                  rows: lista
                      .map(
                        (p) => DataRow(cells: [
                          DataCell(
                            Text(p.Col1),
                          ),
                          DataCell(
                            Text(p.Col2),
                          ),
                          DataCell(
                            Text(p.Col3),
                          ),
                        ]),
                      )
                      .toList(),
                ),
                SizedBox(
                  height: 10,
                ),
                subTitleText("Total: ${total}"),
                SizedBox(
                  height: 10,
                ),
                largeButton(() {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: titleText("Compra Exitosa"),
                      content: resumenCompra(),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: Text("Ok"),
                        ),
                      ],
                    ),
                  );
                }, Colors.transparent, "Comprar", 320),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
