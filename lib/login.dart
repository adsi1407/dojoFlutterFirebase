import 'package:dojo_flutter_firebase/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
 // Es muy importante que en esta parte creemos la clase cómo Login e igual la clave
  final turquesaDark = const Color(0xff0e7c7b);
  final rosa = const Color(0xffef476f);
  final blanquito = const Color(0xfffffffa);

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _contrasenaController = TextEditingController();

  String? _mensajeError = '';

  Future<void> ingresar() async {
    try {
      await Auth().autenticarseConEmailYContrasena(
          email: _emailController.text,
          contrasena: _contrasenaController.text
      );
    } on FirebaseAuthException catch (e) {
      setState(() {
        _mensajeError = e.message;
      });
    }
  }

  Future<void> crearUsuario() async {
    try {
      await Auth().crearUsuarioConEmailYContrasena(
          email: _emailController.text,
          contrasena: _contrasenaController.text
      );
    } on FirebaseAuthException catch (e) {
      setState(() {
        _mensajeError = e.message;
      });
    }
  }

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
      child: Form(
        child: Column( //Para que todo se nos agrege de forma vertical
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            textoIngresar('Ingresa tu Email', false, _emailController), // Creamos de una vez la llamada a los demás widgets
            textoIngresar( 'Ingresa tu contraseña', true, _contrasenaController),
            botonRegistrar(context),
            botonIngresar(context),
            mensajeError()
          ],
        ),
      ),
    );
  }

  Widget textoIngresar(texto, obscureText, controller) {
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
        controller: controller,
      ),
    );
  }

  Widget botonRegistrar(context) {
    return ElevatedButton(
        onPressed: _registrarUsuario,
        child: const Text('Registrar')
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
        onPressed: _autenticarUsuario,
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

  Widget mensajeError() {
    return Text(_mensajeError!);
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
    return Scaffold(
      body: cuerpo(context),
    );
  }

  void _registrarUsuario() {

  }

  void _autenticarUsuario() {
    Navigator.of(context)
        .pushNamedAndRemoveUntil('home', (route) => true);
  }
}
