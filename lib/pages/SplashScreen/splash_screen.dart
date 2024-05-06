import 'package:flutter/material.dart';
import 'package:gerenciador_vagas_rotativas/components/AppAssets/app_assets.dart';
import 'package:gerenciador_vagas_rotativas/components/AppTheme/app_theme.dart';
import 'package:gerenciador_vagas_rotativas/pages/HomeScreen/home_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    double myHeight = MediaQuery.of(context).size.height;
    double myWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppTheme.primaryColor,
        body: SizedBox(
          height: myHeight,
          width: myWidth,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ImageOne.asset(),
              Text(
                "Bem Vindo ao Gerenciador \nde Vagas Rotativas :)",
                style: GoogleFonts.jetBrainsMono(
                  textStyle: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: FontTextColor.primaryColor,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HomePage()),
                  );
                },
                child: Container(
                  width: myWidth * 0.4,
                  height: myHeight * 0.06,
                  decoration: BoxDecoration(
                    color: SplashColor.primaryColor,
                    borderRadius: BorderRadius.circular(12), 
                  ),
                  child: Center(
                    child: Text(
                      "Página Inicial",
                      style: GoogleFonts.jetBrainsMono(
                        textStyle: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: FontTextColor.secondaryColor,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
