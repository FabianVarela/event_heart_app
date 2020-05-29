import 'package:event_heart_app/ui/screen_home/home.ui.dart';
import 'package:event_heart_app/ui/screen_my_event/my_events.ui.dart';
import 'package:event_heart_app/ui/screen_select_city/select_city.ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/date_symbol_data_local.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations(
      <DeviceOrientation>[DeviceOrientation.portraitUp]);

  initializeDateFormatting('es', null).then((_) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Event Heart',
      theme: ThemeData(
        textTheme: GoogleFonts.montserratTextTheme(Theme.of(context).textTheme),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute<dynamic>(builder: (_) {
          switch (settings.name) {
            case '/':
              return SelectCityUI();
            case '/home':
              return HomeUI(
                city: (settings.arguments as dynamic)['city'] as String,
              );
            case '/profile':
              return MyEvents();
            default:
              return Container();
          }
        });
      },
    );
  }
}
