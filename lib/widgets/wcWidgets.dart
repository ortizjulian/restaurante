import 'package:flutter/material.dart';

AppBar appBar(String titulo, BuildContext context) {
  return AppBar(
    toolbarHeight: 35,
    leading: IconButton(
      icon: Icon(Icons.arrow_back, color: Colors.black),
      onPressed: () => Navigator.of(context).pop(),
    ),
    title: Text(titulo),
    centerTitle: true,
  );
}

GestureDetector largeButton(
    VoidCallback function, Color bgColor, String text, double ancho) {
  return GestureDetector(
    onTap: function,
    child: Container(
      margin: EdgeInsets.only(left: 0, top: 5, right: 0, bottom: 5),
      width: ancho,
      height: 40,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          width: 1,
        ),
      ),
      child: Center(child: Text(text)),
    ),
  );
}

Text titleText(String text) {
  return Text(
    text,
    style: const TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 30,
    ),
  );
}

Text subTitleText(String text) {
  return Text(
    text,
    style: const TextStyle(
      fontWeight: FontWeight.w300,
      fontSize: 17,
    ),
    textAlign: TextAlign.center,
  );
}

Text filaProductoNombre(String text) {
  return Text(
    text,
    style: const TextStyle(
      color: Color(0xFF2e302f),
      fontWeight: FontWeight.w900,
      fontStyle: FontStyle.italic,
      fontFamily: 'Open Sans',
      fontSize: 30,
    ),
  );
}

Container filaProducto(String ruta, String nombre, String texto2) {
  return Container(
    height: 150,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        imagenRedonda(ruta, 150),
        Container(
          width: 150,
          height: 150,
          child: Column(
            children: [
              Spacer(),
              filaProductoNombre(nombre),
              subTitleText(texto2),
              Spacer(),
            ],
          ),
        ),
      ],
    ),
  );
}

SizedBox campoTexto(String text) {
  return SizedBox(
    width: 180,
    child: TextField(
      decoration: InputDecoration(
        hintText: text,
      ),
    ),
  );
}

SizedBox campoContrasena() {
  return SizedBox(
    width: 180,
    child: TextField(
      obscureText: true,
      decoration: InputDecoration(
        hintText: "Contraseña",
      ),
    ),
  );
}

Container imagenRedonda2(String ruta,double ancho) {
  return Container(
    margin: EdgeInsets.only(left: 10, top: 0, right: 10, bottom: 0),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(30.0),
      child: Image(
        image: AssetImage(ruta),
        width: ancho,
      ),
    ),
  );
}

ClipRRect imagenRedonda(String ruta,double ancho) {
  return ClipRRect(
      borderRadius: BorderRadius.circular(30.0),
      child: Image(
        image: AssetImage(ruta),
        width: ancho,
      ),
    
  );
}