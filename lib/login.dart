import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key); // Es muy importante que en esta parte creemos la clase cómo Login e igual la clave

  final turquesaDark = const Color(0xff0e7c7b);
  final rosa = const Color(0xffef476f);
  final blanquito = const Color(0xfffffffa);

  Widget cuerpo(context) {
    return SafeArea( // Le damos un SafeArea para que nada se nos desborde
      child: Container( // Un contenedor donde metemos todo
        decoration: BoxDecoration(
          color: turquesaDark, //color de fondo
        ),
        child: ListView(
          reverse: true,
          children: <Widget>[ formulario(context)// dejamos creado nuestro espacio para poner los widgets más adelante
          ],
        ),
      )
    );
  }

  Widget formulario(context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.5,
      child: Form(
        child: Column( //Para que todo se nos agrege de forma vertical
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            textoIngresar('Ingresa tu Email', false), // Creamos de una vez la llamada a los demás widgets
            textoIngresar( 'Ingresa tu contraseña', true),
            botonIngresar(context),
          ],
        ),
      ),
    );
  }

  Widget textoIngresar(texto, obscureText) {
    return Container(
      width: Size.infinite.width,
      constraints: const BoxConstraints(maxWidth: 300),
      padding: const EdgeInsets.all(10),
      alignment: Alignment.center,
      child: TextFormField(
        decoration: InputDecoration(
            labelText: texto,
            border: InputBorder.none,
            fillColor: Colors.white,
            filled: true),
        obscureText: obscureText, //Esto hace que aparezca ******
      ),
    );
  }

  Widget botonIngresar(context) {
    return Container(
      //Boton para ir al Registro de la App
      padding: const EdgeInsets.all(10),
      alignment: Alignment.center,
      child: MaterialButton(
        minWidth: 250.0,
        height: 80.0,
        color: rosa,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        onPressed: () async {
          Navigator.of(context)
              .pushNamedAndRemoveUntil('home', (route) => true);
        },
        child: const Text(
          'Ingresar',
          style: TextStyle(
            color: Colors.white,
            fontSize: 25.0,
          ),
        ),
      )
    );
  }


  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
    return Scaffold(
      body: cuerpo(context),
    );
  }

}
