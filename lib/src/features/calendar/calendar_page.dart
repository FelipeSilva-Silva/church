import 'package:flutter/material.dart';
import 'package:igreja/src/features/finances/register_add_exit_finances.dart';
import 'package:igreja/src/features/finances/register_add_finances.dart';
import 'package:igreja/src/themes/theme_colors.dart';

import '../../components/buttons/table_button.dart';
import '../../components/calendar/month_calendar_component.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const MonthCalendarComponent(),
              Padding(
                padding: const EdgeInsets.only(bottom: 50, top: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const TableButton(
                      name: 'Adicionar Entrada',
                      icon: Icons.person_add_alt_1_outlined,
                      backgroundColor: ThemeColors.greenV,
                      action: RegisterFinances(),
                    ),
                    const SizedBox(width: 25),
                    const TableButton(
                      name: 'Adicionar Saída',
                      icon: Icons.person_add_alt_1_outlined,
                      backgroundColor: ThemeColors.redV,
                      action: RegisterFinancesExit(),
                    ),
                    const SizedBox(width: 25),
                    TableButton(
                      name: 'Emitir Relatório',
                      icon: Icons.description_outlined,
                      backgroundColor: ThemeColors.blueV,
                      action: Container(),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
