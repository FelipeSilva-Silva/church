import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:igreja/src/components/buttons/table_button.dart';
import 'package:igreja/src/components/dialogs/confirm_dialog.dart';
import 'package:igreja/src/components/filtteries/drop_menu_component.dart';
import 'package:igreja/src/components/filtteries/search_bar_component.dart';
import 'package:igreja/src/features/member/register_member.dart';
import 'package:igreja/src/model/member_model.dart';
import 'package:igreja/src/store/member_store.dart';
import 'package:igreja/src/themes/theme_colors.dart';
import 'package:provider/provider.dart';

class MemberPage extends StatelessWidget {
  const MemberPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<MemberStore>(context, listen: false);
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            const SearchBarComponent(
              searchName: 'Buscar Membro',
              prefixIcon: Icon(
                Icons.person_search_outlined,
                color: Colors.white,
              ),
              sufixIcon: Icon(
                Icons.search,
                color: Colors.white,
              ),
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DropMenuComponent(
                  width: 10,
                  hintText: 'Estado civil',
                  leadingIcon: Icon(
                    Icons.filter_list_alt,
                    color: Colors.white,
                  ),
                  list: [
                    DropdownMenuEntry(value: 0, label: ''),
                    DropdownMenuEntry(value: 1, label: 'Solteiro'),
                    DropdownMenuEntry(value: 2, label: 'Casado'),
                  ],
                ),
                DropMenuComponent(
                  width: 10,
                  hintText: 'Congregação',
                  leadingIcon: Icon(
                    Icons.filter_list_alt,
                    color: Colors.white,
                  ),
                  list: [
                    DropdownMenuEntry(value: 0, label: ''),
                    DropdownMenuEntry(value: 1, label: 'PIB'),
                    DropdownMenuEntry(value: 2, label: 'Camurim'),
                    DropdownMenuEntry(value: 2, label: 'Alto Ferrão'),
                    DropdownMenuEntry(value: 2, label: 'Tabuleiro'),
                    DropdownMenuEntry(value: 2, label: 'Corrego'),
                  ],
                ),
                DropMenuComponent(
                  width: 10,
                  hintText: 'Status',
                  leadingIcon: Icon(
                    Icons.filter_list_alt,
                    color: Colors.white,
                  ),
                  list: [
                    DropdownMenuEntry(value: 0, label: ''),
                    DropdownMenuEntry(value: 1, label: 'Afastado'),
                    DropdownMenuEntry(value: 2, label: 'Congregando'),
                    DropdownMenuEntry(value: 2, label: 'Mudado'),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 25),
            Expanded(
              child: FutureBuilder(
                future: controller.findByMember(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Erro: ${snapshot.error}'));
                  } else {
                    return Observer(builder: (context) {
                      List<MemberModel> m = controller.member;
                      return DataTable2(
                        empty: const Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Não ha membros cadastrados",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 25),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Icon(
                                Icons.assignment_late_outlined,
                                color: Colors.white,
                                size: 50,
                              )
                            ],
                          ),
                        ),
                        isHorizontalScrollBarVisible: false,
                        showCheckboxColumn: false,
                        minWidth: 900,
                        columns: const [
                          DataColumn2(
                              label: Center(child: Text('Nº')), fixedWidth: 50),
                          DataColumn2(
                              label: Center(child: Text('Nome')),
                              size: ColumnSize.L),
                          DataColumn2(
                              label: Center(child: Text('Apelido')),
                              size: ColumnSize.S),
                          DataColumn2(
                              label: Center(child: Text('Telefone')),
                              size: ColumnSize.S),
                          DataColumn2(
                              label: Center(child: Text('Congregação')),
                              size: ColumnSize.S),
                          DataColumn2(label: Text(''), fixedWidth: 50),
                          DataColumn2(label: Text(''), fixedWidth: 50),
                          DataColumn2(label: Text(''), fixedWidth: 50),
                        ],
                        rows: List<DataRow>.generate(
                          m.length,
                          (index) {
                            return DataRow(
                              cells: [
                                DataCell(Center(
                                    child: Text((index + 1).toString()))),
                                DataCell(Center(child: Text(m[index].name))),
                                DataCell(Center(child: Text(m[index].surname))),
                                DataCell(Center(child: Text(m[index].phone))),
                                DataCell(
                                    Center(child: Text(m[index].congregation))),
                                DataCell(
                                  const Center(
                                    child: Icon(
                                      Icons.edit,
                                      color: ThemeColors.greenV,
                                    ),
                                  ),
                                  onTap: () {
                                    showDialog(
                                      barrierDismissible: false,
                                      context: context,
                                      builder: (context) {
                                        return RegisterMember(member: m[index]);
                                      },
                                    );
                                  },
                                ),
                                DataCell(
                                  const Center(
                                      child: Icon(
                                    Icons.delete,
                                    color: ThemeColors.redV,
                                  )),
                                  onTap: () {
                                    showDialog(
                                      barrierDismissible: false,
                                      context: context,
                                      builder: (context) {
                                        return ConfirmDialog(
                                          title:
                                              'Tem certeza que deseja excluir o mebro, ${m[index].name}',
                                          action: controller,
                                          help: m[index],
                                        );
                                      },
                                    );
                                  },
                                ),
                                const DataCell(
                                  Center(
                                      child: Icon(
                                    Icons.contact_page_outlined,
                                    color: Colors.yellow,
                                  )),
                                ),
                              ],
                            );
                          },
                        ),
                      );
                    });
                  }
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 50, top: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const TableButton(
                    name: 'Adicionar Membro',
                    icon: Icons.person_add_alt_1_outlined,
                    backgroundColor: ThemeColors.greenV,
                    action: RegisterMember(),
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
    );
  }
}
