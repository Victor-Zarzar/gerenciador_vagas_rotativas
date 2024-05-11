import 'package:flutter/material.dart';
import 'package:gerenciador_vagas_rotativas/components/AppTheme/app_theme.dart';
import 'package:gerenciador_vagas_rotativas/data/database/database_helper.dart';
import 'package:gerenciador_vagas_rotativas/data/vacancies/vacancies_app.dart';
import 'package:getwidget/getwidget.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<Vacancies> vacancies = [];

  @override
  void initState() {
    super.initState();
    _loadVacancies();
  }

  Future<void> _loadVacancies() async {
    List<Vacancies> fetchedVacancies = await DatabaseHelper().getVagas();
    setState(() {
      vacancies = fetchedVacancies;
    });
  }

  @override
  Widget build(BuildContext context) {
    double myHeight = MediaQuery.of(context).size.height;
    double myWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: GFAppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: AppTheme.primaryColor,
        title: Text(
          'Gerenciador Vagas',
          style: GoogleFonts.jetBrainsMono(
            textStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: FontTextColor.secondaryColor,
            ),
          ),
        ),
      ),
      backgroundColor: AppTheme.primaryColor,
      body: ListView.builder(
        itemCount: vacancies.length,
        itemBuilder: (context, index) {
          return SizedBox(
            height: myHeight,
            width: myWidth,
            child: Card(
              color: CardColor.primaryColor,
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: ListTile(
                title: Text(
                  vacancies[index].nome,
                  style: TextStyle(color: FontTextColor.primaryColor),
                ),
                subtitle: Text(
                  'ID: ${vacancies[index].id}',
                  style: TextStyle(color: FontTextColor.primaryColor),
                ),
                trailing: Icon(
                  vacancies[index].ocupada ? Icons.check_circle : Icons.cancel,
                  color: vacancies[index].ocupada ? Colors.green : Colors.red,
                ),
                onTap: () {
                  // Implement onTap functionality if needed
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
