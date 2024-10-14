import 'package:flutter/material.dart';
import 'package:igreja/src/components/sidebar/item_sidebar_component.dart';
import 'package:igreja/src/features/calendar/calendar_page.dart';
import 'package:igreja/src/features/finances/finaces_page.dart';
import 'package:igreja/src/features/initial/initial_page.dart';
import 'package:igreja/src/features/member/member_page.dart';
import 'package:igreja/src/themes/theme_colors.dart';

class SideBarComponent extends StatefulWidget {
  const SideBarComponent({super.key});

  @override
  State<SideBarComponent> createState() => _SideBarComponentState();
}

class _SideBarComponentState extends State<SideBarComponent> {
  bool isExpanded = false;

  List<Widget> pages = [
    const InitialPage(),
    const CalendarPage(),
    const MemberPage(),
    const FinancesPage(),
  ];
  int selectedMenu = 0;

  void selectedPage(int index) {
    setState(() {
      selectedMenu = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blue[900],
        child: Row(
          children: [
            MouseRegion(
              onEnter: (event) => setState(() => isExpanded = true),
              onExit: (event) => setState(() => isExpanded = false),
              child: Container(
                decoration: BoxDecoration(
                    color: ThemeColors.blueTheme,
                    //color: const Color.fromARGB(255, 0, 16, 43),
                    borderRadius: isExpanded
                        ? const BorderRadius.only(
                            topRight: Radius.circular(20),
                            bottomRight: Radius.circular(20))
                        : const BorderRadius.all(Radius.circular(10))),
                margin: isExpanded
                    ? const EdgeInsets.only(top: 8, bottom: 8)
                    : const EdgeInsets.all(8),
                height: MediaQuery.of(context).size.height,
                width: isExpanded ? 180 : 90,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: isExpanded
                      ? CrossAxisAlignment.start
                      : CrossAxisAlignment.center,
                  children: [
                    Padding(
                        padding:
                            EdgeInsets.only(top: 25, left: isExpanded ? 8 : 0),
                        child: isExpanded
                            ? const ListTile(
                                leading: CircleAvatar(),
                                title: Text(
                                  "Igreja Batista", // colocar a funcionalidade para nao estrapolar a tela com as letras
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                            : const CircleAvatar()),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ItemSidebarComponent(
                          icon: Icons.church_outlined,
                          text: 'Início',
                          isExpanded: isExpanded,
                          selectedPage: selectedPage,
                          index: 0,
                          indexSelected: selectedMenu,
                        ),
                        ItemSidebarComponent(
                          icon: Icons.calendar_today_outlined,
                          text: 'Calendário',
                          isExpanded: isExpanded,
                          selectedPage: selectedPage,
                          index: 1,
                          indexSelected: selectedMenu,
                        ),
                        ItemSidebarComponent(
                          icon: Icons.diversity_3_outlined,
                          text: 'Membros',
                          isExpanded: isExpanded,
                          selectedPage: selectedPage,
                          index: 2,
                          indexSelected: selectedMenu,
                        ),
                        ItemSidebarComponent(
                          icon: Icons.point_of_sale_outlined,
                          text: 'Finanças',
                          isExpanded: isExpanded,
                          selectedPage: selectedPage,
                          index: 3,
                          indexSelected: selectedMenu,
                        ),
                        ItemSidebarComponent(
                          icon: Icons.volunteer_activism_outlined,
                          text: 'Evangelismo',
                          isExpanded: isExpanded,
                          selectedPage: selectedPage,
                          index: 4,
                          indexSelected: selectedMenu,
                        ),
                      ],
                    ),
                    ItemSidebarComponent(
                      icon: Icons.settings,
                      text: 'Configurações',
                      isExpanded: isExpanded,
                      selectedPage: selectedPage,
                      index: 5,
                      indexSelected: selectedMenu,
                    ),
                  ],
                ),
              ),
            ),
            pages[selectedMenu]
          ],
        ),
      ),
    );
  }
}
