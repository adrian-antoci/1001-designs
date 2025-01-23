import 'package:_platform/theme/theme.dart';
import 'package:_platform/widgets/central_panel.dart';
import 'package:_platform/widgets/side_panel.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  ThemeData _buildTheme(brightness) {
    var baseTheme = ThemeData(
      brightness: brightness,
      useMaterial3: true,
    );

    return baseTheme.copyWith(
      colorScheme: MaterialTheme.darkScheme(),
      textTheme: GoogleFonts.montserratTextTheme(baseTheme.textTheme),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '1001 Designs',
      theme: _buildTheme(Brightness.light),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('background.jpeg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            CentralPanel(),
            SidePanel(),
          ],
        ),
      ),
    );
  }
}
