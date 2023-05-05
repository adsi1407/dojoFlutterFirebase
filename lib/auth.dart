import 'package:firebase_auth/firebase_auth.dart';

class Auth {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  User? get usuarioActual => _firebaseAuth.currentUser;

  Stream<User?> get cambiosEnEstadoAutenticacion =>_firebaseAuth.authStateChanges();

  Future<void> autenticarseConEmailYContrasena({
    required String email,
    required String contrasena
  }) async {
    await _firebaseAuth.signInWithEmailAndPassword(email: email, password: contrasena);
  }

  Future<void> crearUsuarioConEmailYContrasena({
    required String email,
    required String contrasena
  }) async {
    await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: contrasena);
  }

  Future<void> cerrarSesion() async {
    await _firebaseAuth.signOut();
  }

}
