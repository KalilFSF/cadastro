import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:revisao/pages/tela_Logar.dart';

void main(){ // onde o app cmc
  runApp(
    DevicePreview(
      builder: (context) => MeuApp(),
    ),
  );
}

class MeuApp extends StatelessWidget{ //Estatico
  const MeuApp({super.key});//cria id pro flutte

  @override
  Widget build(BuildContext context) {
    return MaterialApp(//configura o app
      debugShowCheckedModeBanner: false,

      theme: ThemeData(//define visual
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          secondary: Colors.yellow
        )
      ),

      home: const TelaLogar(), //chama a tela principal
    );
  }
}