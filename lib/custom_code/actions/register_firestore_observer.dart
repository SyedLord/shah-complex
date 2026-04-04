// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// Import for WidgetsBindingObserver
import 'package:flutter/widgets.dart';

/// Ye hamara main action hai jo call hoga
Future registerFirestoreObserver() async {
  FirestoreLifecycleObserver.register();
}

// Ye wo class hai jo app ke background/foreground ko monitor karegi
class FirestoreLifecycleObserver extends WidgetsBindingObserver {
  static FirestoreLifecycleObserver? _instance;

  // Singleton taake ek se zyada dafa register na ho
  static void register() {
    if (_instance != null) return;
    _instance = FirestoreLifecycleObserver._();
    WidgetsBinding.instance.addObserver(_instance!);
  }

  FirestoreLifecycleObserver._();

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    // Jab app dubara open ho (VLC se wapas aane par)
    if (state == AppLifecycleState.resumed) {
      await _reconnectFirestore();
    }
  }

  Future<void> _reconnectFirestore() async {
    try {
      final firestore = FirebaseFirestore.instance;

      // Step 1: Purane atke hue net ko disable karo
      await firestore.disableNetwork();

      // Step 2: OS ke net on hone ka adha second wait karo
      await Future.delayed(const Duration(milliseconds: 500));

      // Step 3: Fresh net enable kar do!
      await firestore.enableNetwork();
    } catch (e) {
      print('[FirestoreLifecycle] Reconnect error: $e');
    }
  }
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
