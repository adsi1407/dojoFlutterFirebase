import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home Page',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Home Page'),
        ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('¡Hola, estás autenticado!'),
              ElevatedButton(
                  onPressed: () async { _cerrarSesion; },
                  child: const Text('Cerrar Sesi{on')
              )
            ],
          ),
        )
      ),
    );
  }

  void _cerrarSesion() {

  }
}
