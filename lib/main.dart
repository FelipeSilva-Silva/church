import 'package:flutter/material.dart';
import 'package:igreja/src/church_app.dart';
import 'package:igreja/src/store/finances_store.dart';
import 'package:igreja/src/store/member_store.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';
import 'package:window_manager/window_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await windowManager.ensureInitialized();
  await initializeDateFormatting();

  WindowOptions windowOptions = const WindowOptions(
    size: Size(1000, 600),
    minimumSize: Size(1000, 600),
    center: true,
    titleBarStyle: TitleBarStyle.normal,
    title: "Igreja",
  );
  windowManager.waitUntilReadyToShow(windowOptions, () async {
    await windowManager.focus();
    await windowManager.maximize();
    await windowManager.show();
  });

  runApp(
    MultiProvider(
      providers: [
        Provider(
          create: (context) => MemberStore(),
        ),
        Provider(
          create: (context) => FinancesStore(),
        ),
      ],
      child: const ChurchApp(),
    ),
  );
}
