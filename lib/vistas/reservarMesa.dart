import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../widgets/wcWidgets.dart';

class reservarMesa extends StatefulWidget {
  const reservarMesa({Key? key}) : super(key: key);

  @override
  State<reservarMesa> createState() => _reservarMesaState();
}

class _reservarMesaState extends State<reservarMesa> {
  DateTime date = DateTime.now();
  final itemsHoras = [
    "5:00",
    "5:30",
    "6:00",
    "6:30",
    "7:00",
    "7:30",
    "8:00",
    "8:30",
    "9:00"
  ];

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
        value: item,
        child: Text(
          item,
          style: TextStyle(
            fontSize: 15,
          ),
        ),
      );

  final itemsSedes = ["Laureles", "Poblado", "Robledo"];
  String? hora, sede;
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: appBar("Reservar", context),
      backgroundColor: const Color(0xFFF2E8DF),
      body: Center(
        child: Column(
          children: [
            Spacer(),
            imagenRedonda("assets/reserva.png", 220),
            Text(
              '${date.day}/${date.month}/${date.year}',
              style: TextStyle(fontSize: 28),
            ),
            Container(
              margin: EdgeInsets.only(left: 0, top: 10, right: 10, bottom: 10),
              width: 245,
              height: 40,
              child: ElevatedButton(
                child: Text("Seleccione la fecha"),
                onPressed: () async {
                  DateTime? fechaSeleccionada = await showDatePicker(
                      context: context,
                      initialDate: date,
                      firstDate: DateTime(2022),
                      lastDate: DateTime(2025));
                  if (fechaSeleccionada == null) return;
                  setState(() => date = fechaSeleccionada);
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding:
                      EdgeInsets.only(left: 0, top: 0, right: 10, bottom: 0),
                  child: Text("Hora: "),
                ),
                Container(
                  width: 200,
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: hora,
                      iconSize: 30,
                      items: itemsHoras.map(buildMenuItem).toList(),
                      onChanged: (value) => setState(() => this.hora = value),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding:
                      EdgeInsets.only(left: 0, top: 0, right: 10, bottom: 0),
                  child: Text("Sede: "),
                ),
                Container(
                  width: 200,
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: sede,
                      iconSize: 30,
                      items: itemsSedes.map(buildMenuItem).toList(),
                      onChanged: (value) => setState(() => this.sede = value),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10, // <-- SEE HERE
            ),
            largeButton(() {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text(
                    "Reserva exitosa",
                    textAlign: TextAlign.center,
                  ),
                  content: Text(
                      'Fecha: ${date.day}/${date.month}/${date.year} Hora: ${hora} Sede: ${sede}'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text("Ok"),
                    ),
                  ],
                ),
              );
            }, Colors.transparent, "Reservar", 245),
            Spacer()
          ],
        ),
      ),
    );
  }
}
