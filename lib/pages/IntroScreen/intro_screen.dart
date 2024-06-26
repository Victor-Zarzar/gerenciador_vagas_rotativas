import 'package:flutter/material.dart';
import 'package:gerenciador_vagas_rotativas/components/AppAssets/app_assets.dart';
import 'package:gerenciador_vagas_rotativas/components/AppTheme/app_theme.dart';
import 'package:gerenciador_vagas_rotativas/pages/HomeScreen/home_screen.dart';
import 'package:getwidget/getwidget.dart';
import 'package:google_fonts/google_fonts.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  @override
  Widget build(BuildContext context) {
    double myHeight = MediaQuery.of(context).size.height;
    double myWidth = MediaQuery.of(context).size.width;
    return Scaffold(
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
                  fontSize: 18,
                  fontWeight: FontWeight.w900,
                  color: FontTextColor.secondaryColor,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "Iniciar",
                  style: GoogleFonts.jetBrainsMono(
                    textStyle: TextStyle(
                      decoration: TextDecoration.underline,
                      fontSize: 16,
                      fontWeight: FontWeight.w900,
                      color: FontTextColor.secondaryColor,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 60),
                  child: GFIconButton(
                    size: GFSize.LARGE,
                    color: ButtonColor.primaryColor,
                    shape: GFIconButtonShape.circle,
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => const HomePage()));
                    },
                    icon: const Icon(
                      Icons.arrow_forward,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
